function [time, sui, Sarea_i, advangle, H, oillayer, check, Sw_i, Sw_c, oilSat_layer, pci_curve, Krw_i, Kro_i, oc, wc, Ao, Aw, Lf] = Secondary_imbibition(geometry,bpd,advangle,pressdrop,R, ... 
    ift,porearea, l, pdrop, watervisco, oilvisco, check, oc,wc,Ao,Aw, nt, H, teta, c, sud, time, totaltime, Lf)
% Imbibition displacement proceses 
%

%oc = oc;wc = wc; Ao = Ao;Aw = Aw;
Pc_thre_pis = zeros(nt,1); 
Qtotal    = singlephasetotalflowrate(porearea, R, l, pdrop,nt,watervisco);
oillayer = zeros(nt,1);
pci_curve = zeros(nt,1);
Sw_i = zeros(nt,1);
Sw_c = zeros(nt,1);
k    = 1;
%Lf   = zeros(nt,1);
%
Sarea_i  = zeros(nt,1);
A_oil    = zeros(nt,1);
oilSat_layer  = zeros(nt,1);
Krw_i    = zeros(nt,1);
Kro_i    = zeros(nt,1);
sui      = zeros(nt,1);
hsatu    = max(sud);
checkold = check; 
for f = 1:nt
    for i = 1:nt
        Pc_thre_pis(i) = imbibitionPistonforequilateral(geometry,bpd(i), advangle(i), R(i),ift);
    end
    D  = sort(Pc_thre_pis,'descend')-0.1;
    pc = D(f);
    %Pc_thre_snap = snapofthresholdforequilateral(pc, pc_max, geometry, bpd, advangle, recang, R, ift);
    for j = nt:-k:1 
        for i = 1:k
            jj = j - (i-1);
            if check(jj) == 1
                if pc <= Pc_thre_pis(jj) %|| pc <= Pc_thre_snap(jj)
                    if j == jj
                        check(jj) = 0;
                    elseif j-(k-1) < jj < j && check(jj+1) == 0
                        if check(j-(k-1)) == 0
                            check(j-(k-1):j) = check(j-(k-1):j);
                        else
                            check(jj) = 0;
                        end
                    end
                end
            end
            if check(jj) == 0       
                oillayer(jj)                     = layerexist(geometry, R(jj), bpd(jj), advangle(jj), pc, ift);                  
                [oc(jj), wc(jj), Ao(jj), Aw(jj)] = imbibitionconductanceforequilateral(pc, advangle(jj), geometry, ...
                    porearea(jj), ift, R(jj), oillayer(jj), bpd(jj), watervisco, oilvisco);
                A_oil(jj)  = Ao(jj);
                Lf(jj) = 0; %interfacialarea(geometry, bpd(jj), ift, check(jj), pc, oillayer(jj), advangle(jj));
                                %oc(i) = oilcon; wc(i) = 
                                
            end
%                                                
%                     if Pc_thre_snap(jj) > Pc_thre_pis(jj) && Pc_thre_snap(jj) > pc
%                         % pure snap-off is occured
%                         if check(j-(k-1)) ~= 0 %if the outlet is stil occupied by the oil
%                             check(jj)     = 0;%Snap off has occured 
%                             snapcheck(jj) = 1;
%                         elseif check(j-(k-1)) == 0
%                             % No displacement for this particular pore
%                             check(j-(k-1):j) = check(j-(k-1):j);
%                         end%end inner if 
%                     elseif Pc_thre_snap(jj) > pc && j-(k-1) <= jj < j % Snapoff may occure if piston is not posible
%                         if any(check(j-(k-1)) == 1) %&& any(check(jj+1) == 1) % if the outlet and the receding pore is oil filled 
%                             check(jj) = 0;
%                             snapcheck(jj) = 1;
%                         elseif any(check(j-(k-1)) == 1) && any(check(jj+1) == 0) % if the outlet is oil and the receding pore is water filled
%                             %snap of doesnot occure ratherpiston is
%                             %favoured 
%                             check(jj) = 0;
%                         elseif any(check(j-4) == 0 )% no displacement 
%                             check(j-(k-1):j) = check(j-(k-1):j);
%                         end
%                          if Pc_thre_snap(jj) < Pc_thre_pis(jj) %&& any(jj == j)
%                             if any(check(j-(k-1)) == 1) % the outlet is oil occupied 
%                                 check(jj) = 0;
%                             elseif any(check(j-(k-1)) == 0)
%                                 check(j-(k-1):j) = check(j-(k-1):j);
%                             end
%                         %end
%                     %end
%                 end
%             end
        end
    end
    Sarea_i(f)   = sum(Lf)/sum(porearea);
    watervolume  = sum((Aw  ).*l);
    [Krw_i(f), Kro_i(f)] = drainagerelativepermeabilities(pdrop, l, wc, oc, Qtotal, nt);
    pci_curve(f) = pc;
    Sw_i(f)     = watervolume/sum(porearea.*l);
    Sw_c(f)     = sum(Aw.*l)/sum(porearea.*l);
    oilSat_layer(f) = sum(A_oil.*l)/sum(porearea.*l);
    ii = check + checkold == 1;% the pore that is redisplced 
    if any(ii)
        Rt = R(ii);
        ti          = max(2*l(f)^2.*(watervisco + oilvisco)./(Rt.^2.*pressdrop))/totaltime; 
    else
        ti = 0;
    end
    voil       = Ao.*l./sum(porearea.*l);
    H(check)   = H(check)+ ti.*voil(check);
    advangle   = teta(:,1)  + (teta(:,2) - teta(:,1)).*H./(c + H);
    hsatu      = hsatu   + (1-Sw_i(f)).*ti;%
    sui(f)     = hsatu;  
    time  = time + ti*totaltime;
    checkold   = check;
end