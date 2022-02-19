function totalPV = totalPoreVol

global pore_data throat_data
totalPV = 0;
for i = 1:length(pore_data(:,1))
    totalPV = totalPV + pore_data(i,15);
end
for i = 1:length(throat_data(:,1))
    totalPV = totalPV + throat_data(i,16);
end
bulkVolume = pore_data(end,37) * pore_data(end,38) * pore_data(end,39);
fprintf('Total pore volume of the model is %3.2e m3 \n',totalPV )
fprintf('Porosity of the model is: %3.5f \n',bulkVolume / totalPV )
fprintf('\n')