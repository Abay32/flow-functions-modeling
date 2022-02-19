function Qtot = singlephasetotalflowrate(porearea, R, l, pdrop,nt,watervisco)
%% Total flow rate 
Qtot  = 0;
for i = 1:nt
    gt = pi.*(sqrt(porearea(i)./pi) + R(i)).^4.*pdrop./(128*l(i));
    Qtot = Qtot + gt/watervisco;
end
%
