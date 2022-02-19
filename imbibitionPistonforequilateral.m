function pc = imbibitionPistonforequilateral(geometry,lswd,advangle,R,ift)
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
    pc = 2*ift.*cos(advangle)./R;
else
    if geometry == 2
        nc = 3;
        al = pi/(2*nc);
    elseif geometry == 3
        nc = 4;
        al = pi/nc;
    end
    if advangle < pi/2 - al
       pc = ift.*(cos(advangle) + sqrt(0.5*tan(al).*(sin(2*advangle) - 2*advangle - 2*al + pi)))./R;
    elseif pi/2 - al <= advangle <= pi/2 + al
        konv = 1;
        rc   = R;    
        it   = 0;
        while konv > 1e-10
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
        pc = ift/rc;
    elseif advangle > pi/2 + al 
        %% Oil layer formation and displacement
        nmax         = 250; 
        konv         = 1;                                         %initialize error bound eps
        xx           = R;
        it           = 0;                                           %initialize n (counts iterations)
        area         = @(r,tetaH) r*(r*cos(teta)*cos(teta - al)/sin(al) - lswd*cos(tetaH) - r*(pi-teta-tetaH))/2;
        prim         = @(r,tetaH) (r*cos(teta-al)/sin(al) - lswd)*cos(teta) - r*(pi-teta - tetaH);
        while konv      >= 1e-12 %set while-conditions
            tetaH       =   acos(lswd*sin(al)/xx) - al;%xx - eq(xx)/df(xx); %compute next iterate
            rc          =   area(xx,tetaH)/prim(xx,tetaH);
            convergence = rc - xx;         
            konv        = abs(convergence);
            xx          = rc;
            it          = it + 1;
            if it > nmax
                error('*** Imbibition - Not convergence ***');
            end
        end
        pc_layer = ift/rc;
        pc_psiton = ift*(cos(advangle) - sqrt(0.5*tan(al)*(-sin(2*advangle) + a*advangle - 2*al -pi)))/R;
        if pc_layer <= pc_psiton
            %oil layer formation do not occure
            % the displacement is C-->D
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
            pc = ift/rc;
        elseif pc_layer > pc_psiton
            % Oil layer has formed and the displacement is from C-->E
            pc = pc_psiton;
        end
    end
end