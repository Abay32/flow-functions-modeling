function [throatArea , throatVolume] = throatAandV(throatRadius ,...
    throatShapeFactor , throatLength , throatGeometry)
%%
% This function calculates the cross section area and volume of each throats
% (pore or throats)
%%
global n_t clayVolume
a=1;
for ii = 1:n_t
    if throatGeometry(ii) == 1
        throatArea(ii) = (1+clayVolume) * ( pi * throatRadius(ii) ^ 2);
        throatVolume(ii) = throatArea(ii) * throatLength(ii); 
    elseif throatGeometry(ii) == 2
        throatArea(ii)   = (1 + clayVolume)*( throatRadius(ii) ^ 2 / 4 / throatShapeFactor(ii));
        throatVolume(ii) = throatLength(ii) * throatArea(ii);
    elseif throatGeometry(ii) == 3
        throatArea(ii) = (1 + clayVolume) *( 4 * throatRadius(ii) ^ 2);
        throatVolume(ii) = throatLength(ii) * throatArea(ii);    
    end
end

