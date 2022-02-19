function [time, sud, bpd, Sarea, H, advang, pc_curve, Krw, Kro, Sw, Swc, check,oc,wc,Ao,Aw, Lf] = Primary_drainage_displacement(recang, pressdrop, ... 
    geometry, ift, R, porearea,watervisco,oilvisco, pdrop, l, nt, teta, c, totaltime) 
%% Drainage displacement
thresholdPc = zeros(nt,1);
Ao          = zeros(nt,1);
Aw          = porearea;
oc          = zeros(nt,1);
wc          = singlephaseflowconductance(porearea, R, watervisco);
%for i = 1:nt
%    thresholdPc(i) = Pistonthresholdpressureforequilatral(recang(i),geometry,ift, R(i));%entry pressure
%end
thresholdPc  = Pistonthresholdpressureforequilatral(recang ,geometry,ift, R );%entry pressure

pc_max = max(thresholdPc) + 1;
Qtot   = singlephasetotalflowrate(porearea, R, l, pdrop,nt,watervisco);
check  = false(nt,1); %Check either the pore is water filed or oil filed
D  = sort(thresholdPc,'ascend') ;

Lf = zeros(nt,1);
Sw = zeros(nt,1);
Cwater = zeros(nt,1);
Swc = zeros(nt,1);
k  = 1;
H  = zeros(nt,1);
Sarea = zeros(nt,1);
bpd   = zeros(nt,1);
%
pc_curve = zeros(nt,1);
Krw      = zeros(nt,1);
Kro      = zeros(nt,1);
hsatud   = 0;
sud      = zeros(nt,1);
advang   = teta(:,1);
%
checkold = check;
time  = 0;
oillayer = false(nt,1);
for f = 1:nt
    pc = D(f); 
    for j = 1:k:nt
        thresholdPc  = Pistonthresholdpressureforequilatral(recang ,geometry,ift, R );%entry pressure
        %for i = 1:k
        %jj = j+(i-1);
        if pc >= thresholdPc(j) && check(j) == 0
            %if j == jj
            check(j) = 1;
            %elseif j < jj <= j + (k-1) && check(jj-1) == 1
            %    check(jj) = 1;
            %recang(check) = 
            %end       
        end        
        if check(j) == 1
            bpd(j)                          = ift.*cos(recang(j) + pi/6)./(pc.*sin(pi/6));
            [oc(j), wc(j), Ao(j), Aw(j)] = ...
                drainconductanceforequilatral(pc, recang(j), geometry, ift, porearea(j), R(j), watervisco, oilvisco);
            Cwater(j)  = Aw(j);
            Lf(j) = interfacialarea(geometry, bpd(j),ift, check(j), pc, oillayer(j), recang(j));  
            
            %% For surface plot 
            [ocM(j), wcM(j), AoM(j), AwM(j)] = ...
                drainconductanceforequilatral(pc, advang(j), geometry, ift, porearea(j), R(j), watervisco, oilvisco);
            CwaterM(j)  = AwM(j);
            LfM(j) = interfacialarea(geometry, bpd(j),ift, check(j), pc, oillayer(j), advang(j));
        end   
    end
    [Krw(f), Kro(f)] = drainagerelativepermeabilities(pdrop, l, wcM, ocM, Qtot, nt);
    %
%     for i = 1:nt
%         if check(i) == 1
%             [oc(i),wc(i),Ao(i),Aw(i)] = drainconductanceforequilatral(pc,recang(i),geometry,ift,porearea(i),R(i), watervisco, oilvisco);            
%         end  
%     end
    ii = check + checkold == 1;
    Rt = R(ii);
    %if all ii are false then equilibrium condition is attained
    if any(ii) 
        ti = max(2*l(f)^2.*(watervisco + oilvisco)./(Rt.^2.*pressdrop))/totaltime;
    else
        ti = 0;
    end
    
    voil        = Ao.*l./sum(porearea.*l);
    voilM        = AoM.*l./sum(porearea.*l);

    H(check)    = H(check) + ti.*voil(check);
    time        = time + ti*totaltime;
    advang      = teta(:,1) + (teta(:,2)-teta(:,1)).*H./(c + H);

    %advangM     = teta(:,1) + (teta(:,2)-teta(:,1)).*HM./(c + HM);

    watervolume = sum(Aw.*l); %oilvolume = sum(Ao.*l);
    watervolumeM = sum(AwM.*l); %oilvolume = sum(Ao.*l);
    Sarea(f)    = sum(Lf)/sum(porearea)/totaltime;
    
    
    
    
    
    pc_curve(f) = pc;
    Sw(f)       = watervolume/sum(porearea.*l); 
    Swc(f)      = sum(Cwater.*l) /sum(porearea.*l); 
    hsatud      = hsatud  + (1-Sw(f))*ti;
    sud(f)      = hsatud;%sum(avnwsatu.*ti)/totaltime1;
    checkold    = check; %copy chceck
    
end
