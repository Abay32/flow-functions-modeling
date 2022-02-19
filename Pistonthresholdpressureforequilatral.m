function pistonPc = Pistonthresholdpressureforequilatral(thetarec,geometry, ift, R)
%% PistonLike displacement entery pressure
% inputs: thetarec -- receding contact angle
%         geometry -- the shape of the pore
%         R        -- inscribed pore/throat radius 
% output: pistonPc -- pistonlike displacement threshold capillary pressure
if geometry == 1
    pistonPc = 2*ift.*cos(thetarec)./R;
else
    if geometry == 2
        nc = 3;
        al = pi/(2*nc);
    elseif geometry == 3
        nc = 4;
        al = pi/nc;
    end
    pistonPc = ift.*(cos(thetarec) + sqrt(0.5*tan(al).*(sin(2*thetarec) -2*thetarec -2*al + pi)))./R;
end