function [oil_conductance, water_conductance, A_oil, A_water] =...
    conduct_drain(Pc_threshold,rec_angle,half_angles,geometry,...
    G_factor,total_A,sig_ow,rInscribed)
% Patzek's approach to find corner fluid area and conduactance.
% This model is based on paper:
% "Patzek ;Verification of a Complete Pore Network Simulator of Drainage
% and Imbibition"

% Mention that Piri and Patzek Approach have equal results

global oil_viscosity water_viscosity clayVolume

r = sig_ow / Pc_threshold;
dimenlessAreaCorner         = zeros(1,4);
cornerShapeFactor           = zeros(1,4);
scaledDimenlessConducCorner = zeros(1,4);
dimenlessConducCorner       = zeros(1,4);
b = zeros(1,4); % Meniscus-Apex distance
if geometry == 1
    A_water = 0;
    water_conductance = 0;
else
    for ii = 1:length(half_angles)
        if ~isnan(half_angles(ii))
            b(ii) = (r * cos(rec_angle + half_angles(ii)) / sin(half_angles(ii)));
            if half_angles(ii) + rec_angle == pi/2
                dimenlessAreaCorner(ii) = sin(half_angles(ii))*cos(half_angles(ii));
                cornerShapeFactor(ii)   = dimenlessAreaCorner(ii) /...
                    (4 * (1 + sin(half_angles(ii)))^2);
            else
                dimenlessAreaCorner(ii) = (sin(half_angles(ii)) /...
                    cos(rec_angle + half_angles(ii)))^2 * ((cos(rec_angle)...
                    * cos(rec_angle + half_angles(ii)) / sin(half_angles(ii)))...
                    + rec_angle + half_angles(ii) - pi/2);
                cornerShapeFactor(ii) = dimenlessAreaCorner(ii) /...
                    (4 * (1 - (sin(half_angles(ii)) / cos(half_angles(ii)...
                    + rec_angle))*(rec_angle + half_angles(ii) - pi/2))^2);
            end
            scaledDimenlessConducCorner(ii) = -0.5081 - 0.0022 * half_angles(ii)...
                - 0.009 * half_angles(ii)^2 + (6.5835 - 0.9951 * half_angles(ii)...
                + 0.9173 * half_angles(ii)^2)*cornerShapeFactor(ii);
%             scaledDimenlessConducCorner(ii) = -15.1794 * cornerShapeFactor(ii)^2 + 7.6307 * cornerShapeFactor(ii) - 0.53488;

            dimenlessConducCorner(ii) = exp((scaledDimenlessConducCorner(ii) +...
                0.02 * sin(half_angles(ii) - pi/6)) / (1/4/pi - cornerShapeFactor(ii))^(7/8)...
                / cos(half_angles(ii) - pi/6)^0.5) * dimenlessAreaCorner(ii)^2;
        end
    end
    A_water = sum(b.^2 .* dimenlessAreaCorner) + total_A*clayVolume;
    water_conductance = sum(2 * b.^4 .* dimenlessConducCorner / water_viscosity);
end

A_oil = total_A - A_water;

if geometry == 1
    oil_conductance = (A_oil / total_A)*0.5*G_factor*total_A^2/oil_viscosity;
elseif geometry == 2
    oil_conductance = (A_oil / total_A)*3*rInscribed^2*total_A/20/oil_viscosity;
elseif geometry == 3
    oil_conductance = (A_oil / total_A)*0.5623*G_factor*total_A^2 / oil_viscosity;
end