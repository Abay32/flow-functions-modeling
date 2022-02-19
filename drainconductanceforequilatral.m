function [oc,wc,Ao, Aw] = drainconductanceforequilatral(pc,recangle,geometry,ift,porearea,R, watervisco, oilvisco)
% This function calculates the conductance of water and oil during grainage
% Input pc--threshold capillary pressure
if geometry == 1
    wc = 0;
    Ao = porearea;
    Aw = 0;
    go = pi.*(sqrt(Ao/pi) + R).^4./128;
    oc = go/oilvisco;    
else
    if geometry == 2
        nc = 3;
        al = pi/(2*nc);
    elseif geometry == 3
        nc = 4;
        al = pi/nc;
    end
    cwater = @(r,x) nc*r.^2.*(cos(x).*(cot(al).*cos(x)-sin(x)) + x + al - pi/2);
    if recangle < pi/2 - al
        r     = ift./pc;
        Aw    = cwater(r, recangle);
        Ao    = porearea - Aw;
        p1    = pi/2 - al - recangle;
        p2    = cot(al).*cos(recangle) - sin(recangle);
        p3    = (pi/2 - al).*tan(al);
        num   = Aw.^2.*(1-sin(al)).^2.*(p2*cos(recangle) - p1).*p3.^2;
        denum = 12*nc*sin(al).^2.*(1-p3).^2.*(p2 + p1).^2;
        go    = pi.*(sqrt(Ao/pi) + R).^4./128;
        oc    = go/oilvisco;
        gw    = num./denum;%corener water conductance 
        wc    = gw/watervisco;
    elseif recangle > pi/2 - al
        r   = ift./pc;
        Aw  = cwater(r, recangle);
        Ao  = porearea - Aw;
        p3  = (pi/2 - al).*tan(al);
        num = Aw.^2.*(1-sin(al)).^2.*tan(al).*p3.^2;
        denum = 12*nc*sin(al).^2.*(1-p3).*(1 + p3).^2;
        go    = pi.*(sqrt(Ao/pi) + R).^4./128;
        oc    = go/oilvisco;
        gw    = num./denum;%corener water conductance 
        wc    = gw/watervisco;
    end
end      