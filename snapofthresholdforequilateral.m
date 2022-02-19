function snapPc = snapofthresholdforequilateral(pc, pc_max,geometry, b,thetaadva,reang, R,ift)
if geometry == 1
    snapPc = nan;
else 
    if geometry == 2
        nc = 3;
        al = pi/(2*nc);
    elseif geometry == 3
        nc = 4;
        al = pi/nc;
    end
    %% Spontaneous snapoff
    th = acos(pc.*(cos(al + reang)./pc_max))-al;
    if thetaadva < pi/2 - al
        snapPc = ift.*(cos(th) - sin(th).*tan(al))./R;
    % forced snapoff
    elseif pi/2 - al <= thetaadva <= pi/2 + al
        snapPc = ift.*(cot(al).*cos(thetaadva) - sin(thetaadva))./b;
    elseif thetaadva > pi/2 + al
        snapPc = -ift./(b.*sin(al));
    end
end
        