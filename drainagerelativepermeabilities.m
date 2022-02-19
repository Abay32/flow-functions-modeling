function [Krw,Kro] = drainagerelativepermeabilities(pdrop, l, Wconductance, Oconductance, Qtotal,nt)
%% Phase relative permeabilities for two-phase flow.
%
Qtot_w = 0;
Qtot_o = 0;
%
for j = 1:nt
    Qtot_w = Qtot_w + pdrop.*Wconductance(j)./l(j);%water phase total flow rate
    Qtot_o = Qtot_o + pdrop.*Oconductance(j)./l(j);%oil phase flow rate 
end
Krw = Qtot_w/Qtotal;
Kro = Qtot_o/Qtotal;
%
if Krw > 1
    Krw = 1;
elseif Krw < 0
    Krw = 0;
end
%
if Kro > 1
    Kro = 1;
elseif Kro < 0
    Kro = 0;
end