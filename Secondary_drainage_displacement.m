function [time, sud, Sarea, H, recang, pc_curve, Krw, Kro, Sw, Swc, check,oc,wc,Ao,Aw, Lf] = Secondary_drainage_displacement(recang,pressdrop, pcmin, ... 
    geometry, ift, oillayer, R, porearea, watervisco, oilvisco, pdrop, bpd, l, oc , wc , Ao , Aw, nt, H, check, teta, c, sui, time,totaltime, Lf) 
%% Drainage displacement 

thresholdPc = zeros(nt,1);
% % Ao          = zeros(nt,1);
% % Aw          = porearea;
% % oc          = zeros(nt,1);
% % wc          = singlephaseflowconductance(porearea, R, watervisco);
% for f = 1:nt
%     thresholdPc(f) = SecondaryDrainagePistonforEquilateral(geometry, bpd(f), recang(f), R(f), ift, oillayer(f));%entry pressure
% end
%
% Pc = zeros(nt,1);
% for i = 1:nt
%      %Pc(i) = Pistonthresholdpressureforequilatral(0,geometry,ift, R(i));%entry pressure
%      Pc(i) = Pistonthresholdpressureforequilatral(0,geometry,ift, R(i));
% end
%pressdrop  = 0.5; % the pressure drop.
Qtot   = singlephasetotalflowrate(porearea, R, l, pdrop, nt, watervisco);
% check  = false(nt,1); %Check either the pore is water filed or oil filed
%k = 1:3:nt; %the pores attached to the non-wetting reservoir
%D = sort(thresholdPc,'ascend') ;
%Pc = sort(Pc,'ascend') ;
Sw = zeros(nt,1); 
Swc = zeros(nt,1); 
Cwater = zeros(nt,1);
Krw = zeros(nt,1); Kro = zeros(nt,1);
k = 1;
%H = zeros(nt,1);
pc_curve = zeros(nt,1);
%Lf    = zeros(nt,1);
Sarea = zeros(nt,1);
pc    = pcmin;
hsatud   = max(sui);
sud      = zeros(nt,1);
checkold = check;
for f = 1:nt
    for m = 1:nt
        thresholdPc(m) = SecondaryDrainagePistonforEquilateral(pc,geometry, bpd(m), recang(m), R(m), ift, oillayer(m));%entry pressure
    end
    D = sort(thresholdPc,'ascend') ;
    pc = D(f) + 0;
    for j = 1:k:nt
        for i = 1:k
            jj = j+(i-1);
            if pc >= thresholdPc(jj) && check(jj) == 0
                if j == jj
                    check(jj) = 1;
                elseif j < jj <= j + (k-1) && check(jj-1) == 1
                    check(jj) = 1;
                    %recang(check) = 
                end                
            end
            %
            if check(jj) == 1
                [oc(jj), wc(jj), Ao(jj), Aw(jj)] = Secondary_drainconductanceforequilatral(pc, ...
                    recang(jj), geometry, ift, bpd(jj), porearea(jj), R(jj), watervisco, oilvisco);
                Cwater(jj)  = Aw(jj);
            end            
            if check(jj) == 0
                oillayer(jj) = oillayer(jj);
            elseif check(jj) == 1
                oillayer(jj) = 0;
                %recang(jj)  = 0;
            end
            Lf(jj) = interfacialarea(geometry, bpd(jj), ift, check(jj), pc, oillayer(jj), recang(jj));
            
            % Find the time to drain the candidate throat            
        end                        
    end
    %
%     for i = 1:nt
%         if check(i) == 1
%             [oc(i),wc(i),Ao(i),Aw(i)] = drainconductanceforequilatral(pc,recang(i),geometry,ift,porearea(i),R(i), watervisco, oilvisco);            
%         end  
%     end
    Sarea(f)    = sum(Lf)/sum(porearea);
    watervolume = sum((Aw).*l); %oilvolume = sum(Ao.*l);
    %
    [Krw(f), Kro(f)] = drainagerelativepermeabilities(pdrop, l, wc, oc, Qtot, nt);
    pc_curve(f)      = pc;
    %
     
    
    ti  = (2*l(f)^2.*(watervisco + oilvisco)./(R(f).^2.*pressdrop))/totaltime   ;
     
    voil = (Ao).*l./sum(porearea.*l);
    %
    time = time + ti*totaltime ;
    H(check) = H(check) + ti.*voil(check);
    recang   = teta(:,1) + (teta(:,2) - teta(:,1)).*H./(c + H );
    Sw(f)    = watervolume/sum(porearea.*l);  
     
    Swc(f)      =  sum(Cwater.*l) /sum(porearea.*l);
    
    hsatud   = hsatud  + (1-Sw(f))*ti;%
    sud(f)   = hsatud;%sum(avnwsatu.*ti)/totaltime1;
    checkold = check;
end
%pc_curve(end) = pc_max;