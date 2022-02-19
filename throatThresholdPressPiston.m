function throatThresholdPressure = throatThresholdPressPiston (recedingAngle,...
    throatGeometry,shapeFactor,throatRadius,halfAngles)
% Calculating element thrshold pressure according to Patzek's approach

global sig_ow
if throatGeometry == 1 %circular
    throatThresholdPressure = 2*sig_ow*cos(recedingAngle)/throatRadius;
else
    E2 = zeros(1,4); E0 = zeros(1,4);
    for jj = 1:4
        if ~isnan(halfAngles(jj)) %&& recedingAngle + halfAngles(jj) > pi/2
            E2(jj) = cos(recedingAngle + halfAngles(jj)) *...
                cos(recedingAngle) / sin(halfAngles(jj));
            E0(jj) = pi / 2 - recedingAngle - halfAngles(jj);
        end
    end
    throatThresholdPressure = (sig_ow / throatRadius)*cos(recedingAngle)*...
            (1+sqrt(1 - (4*shapeFactor*(sum(E2) - sum(E0)))/(cos(recedingAngle)^2)));
end