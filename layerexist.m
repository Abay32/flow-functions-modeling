function layer = layerexist(geometry,R,lswd, teta, pc_pis,ift)
if geometry == 1
    layer = 0;
else 
    if geometry == 2
        nc = 3;
        al = pi/(2*nc);
    elseif geometry == 3
        nc = 4;
        al = pi/nc;
    end
    if teta > pi/2 + al
        nmax         = 250; 
        konv         = 1;                                         %initialize error bound eps
        xx           = R;
        it           = 0;                                           %initialize n (counts iterations)
        area         = @(r,tetaH) r*(r*cos(teta)*cos(teta - al)/sin(al) - lswd*cos(tetaH) - r*(pi-teta-tetaH))/2;
        prim         = @(r,tetaH) (r*cos(teta-al)/sin(al) - lswd)*cos(teta) - r*(pi-teta - tetaH);
        while konv      >= 1e-6 %set while-conditions
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
%         konv       = 1;
%         rc         = R;
%         it         = 0; 
%         while konv > 1e-12
%             gamma       = asin(lswd*sin(al)/rc);
%             omega_eff   = (R./tan(al) - lswd)*cos(teta) + rc*gamma;
%             A_eff       = R.^2/(2*tan(al)) - rc*lswd*sin(al + gamma)/2 + rc^2*gamma/2;
%             rc1         = A_eff/omega_eff;
%             convergence = rc - rc1;
%             konv        = abs(convergence);
%             rc          = rc1;
%             it          = it + 1;
%             if it > 20
%                 error('*** Imbibition - Not convergence ***');
%             end
%         end
        pclayer = ift/rc;
        %%        
                num = ift.*(cos(al).*sin(al).*(2*sin(al) + cos(teta)) + sin(al).^2.*sqrt(4*cos(al).^2 - 3 - cos(teta).^2 - 4*sin(al).*cos(teta)));
                den = lswd.*(3*sin(al).^2 + 4*sin(al).*cos(teta) + cos(teta).^2);
                pcl = num/den;
        if pc_pis <= pcl%pclayer
            layer = 0;
        elseif pc_pis > pcl%pclayer
            layer = 1;
        end
    else
        layer = 0;
    end
end