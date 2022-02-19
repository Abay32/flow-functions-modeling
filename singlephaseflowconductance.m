function Qtot = singlephaseflowconductance(porearea, R, watervisco)
Qtot =  pi.*(sqrt(porearea./pi) + R).^4./(128.*watervisco);

%
