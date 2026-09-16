% Brass

%import force & displacement data, choosing appropriate ranges of entries in the spreadsheet
data = readmatrix("NEW_lab1Data.csv");
force = data(22:end, 3); % force data values 
displacement = data(22:end, 2); % displacement values  

%also import cross-sectional areas and gauge lengths
area = 8.553 / 1000 % cross-sectional area in meters
len_g = 32.5 / 1000 % gauge length in meters

%We want to import data from NEW_lab1Data.csv



%call function for each trial

%call functions for each trial


[stress, strain] = processRawData(displacement, force, len_g, area)

figure(1)
p = plot(strain, stress/1e9, 'LineWidth', 2, 'Color', 'black'); % strain and stress in x,y axis 
% stress is turned to GPa so it fits the graph better
xlabel('Engineering Strain (m/m)', 'FontWeight', 'bold', 'FontSize', 12); % label of x axis with units
ylabel('Engineering Stress (GPa)', 'FontWeight', 'bold', 'FontSize', 12); % label of y axis with units
title('Stress-Strain Curve for Brass', 'FontSize', 15); 
grid on;

hold on;

analyzeData(1,2)
analyzeData([1,2,3,4,5,6,7,8,9],[2,4,6,8,10,12,14,14,14],[1 6])