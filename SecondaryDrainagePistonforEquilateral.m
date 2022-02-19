function pcthre = SecondaryDrainagePistonforEquilateral(pc, geometry, lswd, advangle, R, ift, oillayer)
%% calculates the water entery pressure for a piston displacement
%\\
%  Inputs: geometry -- the pore gemetry
%          lswd     -- the length of corner water from the appex
%          advangle -- the advancing contact angle
%            R      -- the inscribed pore radius
%            ift    -- fluid-fluid interfacial tension
%  Output:    pc    -- the entry pressure for imbibition displacement
%\\
if geometry == 1
    pcthre = 2*ift.*cos(advangle)./R;
else
    if geometry == 2
        nc = 3;
        al = pi/(2*nc);
    elseif geometry == 3
        nc = 4;
        al = pi/nc;
    end
    if advangle < pi/2 - al
       pc1 = ift.*(cos(advangle) + sqrt(0.5*tan(al).*(sin(2*advangle) - 2*advangle - 2*al + pi)))./R;
       %
       konv = 1; 
       rc   = R; 
       it   = 0;
       while konv > 1e-12
           gamma       = asin(lswd *sin(al)/rc);
           omega_eff   = (R./tan(al) - lswd).*cos(advangle) + rc*gamma;
           A_eff       = R^2./(2*tan(al)) - rc*lswd.*sin(al + gamma)/2 + rc.^2.*gamma/2;
           rc1         = A_eff/omega_eff;
           convergence = rc - rc1; 
           konv        = abs(convergence);
           rc          = rc1;
           it          = it + 1;
           if it > 20
               error('*** Imbibition - Not convergence ***');
           end
       end
       %rc = rc
       pc2 = ift/rc;
       %
       %
       bpd2 = ift.*cos(advangle + al)/(pc.*sin(al));
       if any(bpd2 > lswd)
           %the displacement is from D-->B
           pcthre = pc1;
       else
           %the displacement is from D-->C
           pcthre = pc2;
       end
    elseif pi/2 - al <= advangle <= pi/2 + al
        %the displacement is from D-->C
        konv = 1;
        rc   = R;    
        it   = 0;
        while konv > 1e-8
            gamma       = asin(lswd *sin(al)/rc);
            omega_eff   = (R./tan(al) - lswd).*cos(advangle) + rc*gamma;
            A_eff       = R^2./(2*tan(al)) - rc*lswd.*sin(al + gamma)/2 + rc.^2.*gamma/2;
            rc1         = A_eff/omega_eff;
            convergence = rc - rc1; 
            konv        = abs(convergence);
            rc          = rc1;
            it          = it + 1;
            if it > 20
                error('*** Imbibition - Not convergence ***');
            end
        end
        pcthre = ift/rc;
    elseif advangle > pi/2 + al 
        % Find the layer entry pressure 
% %         konv       = 1;
% %         rc         = R;
% %         it         = 0; 
% %         while konv > 1e-12
% %             gamma       = asin(lswd*sin(al)/rc);
% %             omega_eff   = (R./tan(al) - lswd)*cos(teta) + rc*gamma;
% %             A_eff       = R.^2/(2*tan(al)) - rc*lswd*sin(al + gamma)/2 + rc^2*gamma/2;
% %             rc1         = A_eff/omega_eff;
% %             convergence = rc - rc1;
% %             konv        = abs(convergence);
% %             rc          = rc1;
% %             it          = it + 1;
% %             if it > 20
% %                 error('*** Imbibition - Not convergence ***');
% %             end
% %         end
% %         pclayer = ift./rc;
        % Find the central displacement entry pressure konv = 1;
        konv = 1;
        rc   = R;    
        it   = 0;
        while konv > 1e-12
            gamma       = asin(lswd *sin(al)/rc);
            omega_eff   = (R./tan(al) - lswd).*cos(advangle) + rc*gamma;
            A_eff       = R^2./(2*tan(al)) - rc*lswd.*sin(al + gamma)/2 + rc.^2.*gamma/2;
            rc1         = A_eff/omega_eff;
            convergence = rc - rc1; 
            konv        = abs(convergence);
            rc          = rc1;
            it          = it + 1;
            if it > 20
                error('*** Imbibition - Not convergence ***');
            end
        end
        pcthre = ift/rc;
% %         if pc_c < pclayer 
% %             % Layer does not exist and the displacement is indeed from
% %             % D-->C
% %             pc = pc_c;
% %         else
% %             % layer exist and the Displacement is from D--> E
% %             pc = pclayer;
% %         end
        if any(oillayer)
            % The displacement is from E --> C
            pcthre = ift.*(cos(advangle) - sqrt(0.5*tan(al).*(-sin(2*advangle) + 2*advangle - 2*al - pi)))./R;
        end            
    end
end