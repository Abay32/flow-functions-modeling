function [oc, wc, Ao, Aw,Awc] = imbibitionconductanceforequilateral(pc,advangle, geometry,porearea,ift, R, oillayerexist, bpd,watervisco,oilvisco)
% This function calculates the conductance of water and oil during grainage
% Input   pc     --threshold capillary pressure
%       advangle -- oil-water advancing angle
%       geometry -- the geometry of pores
%       porearea -- pore area 
%       ift      -- interfacial tension
%       oillayerexist -- 1 if it exist and 0 otherwise
%          bpd        -- the corner water length. 
% Outputs  oc         -- oillayer conductance 
%          wc         -- corner water conductance
if geometry == 1 % cylincerical 
    Ao       = 0;
    oc       = 0;
    %wc      = 0;
    Aw       = porearea;
    gw       = pi.*(sqrt(porearea./pi) + R).^4./128 ;% total water conductance
    wc       = gw/watervisco;
else
    if geometry == 2%triangular 
        nc = 3;
        al = pi/(2*nc);
    elseif geometry == 3% rectangular 
        nc = 4;
        al = pi/nc;
    end
    if advangle < pi/2 + al%no oil layer exist 
        Ao       = 0;
        oc       = 0;
        wc       = 0;
        Aw       = porearea;
        gw       = pi.*(sqrt(porearea./pi) + R).^4./128 + wc;% total water conductance
        wc       = gw/watervisco;
    elseif advangle >= pi/2 + al
        if any(oillayerexist)
            r           = ift./pc;
            higingangle = acos(pc.*bpd.*sin(al)./ift) - al;
            if higingangle >= advangle 
                higingangle = advangle;
            end
            cwater  = @(r,x) nc*r.^2.*(cos(x).*(cot(al).*cos(x) - sin(x)) + x + al - pi/2);
            %Acoi    = @(teta,r) nc.*r^2.*(cos(teta-al).*cos(teta)/sin(al) - (teta - al - pi/2));
            %area    = @(r,tetaH,x) nc*r*(r*cos(x)*cos(x - al)/sin(al) - bpd*cos(tetaH) - r*(pi-x-tetaH))/2;
            Awc     = cwater(r, higingangle);%water reside in the corner 
            Ac      = cwater(r, pi-advangle); %water and oil reside in the corner
            Ao      = Ac - Awc; %area(r, higingangle,advangle);
            Aw      = porearea - Ac;           
            %%                      
            p3      = (pi/2 - al).*tan(al);
            numw    = Awc.^2.*(1-sin(al)).^2.*tan(al).*p3.^2;
            denw    = 12*nc*sin(al).^2.*(1-p3).*(1 + p3).^2;
            wc      = numw./denw;
            %%            
            num    = Ao.^3.*(1-sin(al)).^2.*tan(al).*p3^2;
            deno   = 12*nc*(Ao + Awc).*sin(al)^2.*(1-p3).*(1+p3-(1-p3).*sqrt(Awc./(Ao+Awc))).^2;
            go     = num./deno;
            oc     = go/oilvisco;
            %
            gw     = pi.*(sqrt((Aw)./pi) + R).^4./128 + wc;%total water phase conductance
            wc     = gw/watervisco;
        else
            wc       = 0;
            Ao       = 0;
            oc       = 0;
            Ac       = 0;
            Aw       = porearea;
            gw       = pi.*(sqrt((porearea-Ao)./pi) + R).^4./128 + wc;
            wc       = gw/watervisco;
        end
    end
end 