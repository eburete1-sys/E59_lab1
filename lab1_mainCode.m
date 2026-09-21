% Import necessary data

data = readmatrix("NEW_lab1Data.csv");

% ///Brass (ME 8232)

% Choose appropriate ranges of entries in the spreadsheet for values

force = data(22:end, 3); % force data values 
displacement = data(22:end, 2); % displacement values  

% Import cross-sectional areas and gauge lengths 

area = 8.553 / 1000; % cross-sectional area in meters
len_g = 32.5 / 1000; % gauge length in meters

% Call function to find stress and strain
[strain, stress] = processRawData(displacement, force, len_g, area);

[E, ultStress] = analyzeData(strain,stress,1:30);

% /// Polyethylene tensile sample (ME 8235)
figure(2)

% Trial 1
% Choose appropriate ranges of entries in the spreadsheet for values

force_p = data(2:end, 39); % force data values 
displacement_p = data(2:end, 38); % displacement values  

% Import cross-sectional areas and gauge lengths 

area_p = 8.867 / 1000; % cross-sectional area in meters
len_gp = 33.2 / 1000; % gauge length in meters

% Call function to find stress and strain
[strain_p, stress_p] = processRawData(displacement_p, force_p, len_gp, area_p);

% Plot stress-strain curve
subplot(2,2,1)
plot(strain_p, stress_p/1e9, 'LineWidth', 2, 'Color', 'black'); % stress is turned to GPa so it fits the graph better
xlabel('Engineering Strain (m/m)', 'FontSize', 12); % label of x axis with units
ylabel('Engineering Stress (GPa)', 'FontSize', 12); % label of y axis with units
title('Polyethylene', 'Fontweight', 'bold', 'FontSize', 15); 
grid on;
hold on;

% Trial 2
% Choose appropriate ranges of entries in the spreadsheet for values

force_p2 = data(2:end, 43); % force data values 
displacement_p2 = data(2:end, 42); % displacement values  

% Call function to find stress and strain
[strain_p2, stress_p2] = processRawData(displacement_p2, force_p2, len_gp, area_p);

% Plot stress-strain curve
subplot(2,2,2)
plot(strain_p2, stress_p2/1e9, 'LineWidth', 2, 'Color', 'black'); % stress is turned to GPa so it fits the graph better
xlabel('Engineering Strain (m/m)', 'FontSize', 12); % label of x axis with units
ylabel('Engineering Stress (GPa)', 'FontSize', 12); % label of y axis with units
title('Polyethylene 2', 'Fontweight', 'bold', 'FontSize', 15); 
grid on;
hold on;

% Trial 3
% Choose appropriate ranges of entries in the spreadsheet for values

force_p3 = data(2:end, 47); % force data values 
displacement_p3 = data(2:end, 46); % displacement values  

% Call function to find stress and strain
[strain_p3, stress_p3] = processRawData(displacement_p3, force_p3, len_gp, area_p);

% Plot stress-strain curve
subplot(2,2,3)
plot(strain_p3, stress_p3/1e9, 'LineWidth', 2, 'Color', 'black'); % stress is turned to GPa so it fits the graph better
xlabel('Engineering Strain (m/m)', 'FontSize', 12); % label of x axis with units
ylabel('Engineering Stress (GPa)', 'FontSize', 12); % label of y axis with units
title('Polyethylene 3', 'Fontweight', 'bold', 'FontSize', 15); 
grid on;
hold on;


% /// Thin I-beams (ME 7012)
figure(3)

% Long 1
% Choose appropriate ranges of entries in the spreadsheet for values

force_l = data(2:end, 23); % force data values 
displacement_l = data(2:end, 22); % displacement values  

% Import cross-sectional areas and gauge lengths 

area_l = 26.676 / 1000; % cross-sectional area in meters
len_gl = 140 / 1000; % gauge length in meters

% Call function to find stress and strain
[strain_l, stress_l] = processRawData(displacement_l, force_l, len_gl, area_l);

% Plot stress-strain curve
subplot(2,2,1)
plot(strain_l, stress_l/1e9, 'LineWidth', 2, 'Color', 'black'); % stress is turned to GPa so it fits the graph better
xlabel('Engineering Strain (m/m)', 'FontSize', 12); % label of x axis with units
ylabel('Engineering Stress (GPa)', 'FontSize', 12); % label of y axis with units
title('Long I-beam', 'Fontweight', 'bold', 'FontSize', 15); 
grid on;
hold on;

% Long 2
% Choose appropriate ranges of entries in the spreadsheet for values

force_l2 = data(2:end, 27); % force data values 
displacement_l2 = data(2:end, 26); % displacement values  

% Call function to find stress and strain
[strain_l2, stress_l2] = processRawData(displacement_l2, force_l2, len_gl, area_l);

% Plot stress-strain curve
subplot(2,2,2)
plot(strain_l2, stress_l2/1e9, 'LineWidth', 2, 'Color', 'black'); % stress is turned to GPa so it fits the graph better
xlabel('Engineering Strain (m/m)', 'FontSize', 12); % label of x axis with units
ylabel('Engineering Stress (GPa)', 'FontSize', 12); % label of y axis with units
title('Long I-beam 2', 'Fontweight', 'bold', 'FontSize', 15); 
grid on;
hold on;

% Short 1
% Choose appropriate ranges of entries in the spreadsheet for values
len_gs = 80 / 1000;
force_s = data(2:end, 31); % force data values 
displacement_s = data(2:end, 30); % displacement values  

% Call function to find stress and strain
[strain_s, stress_s] = processRawData(displacement_s, force_s, len_gs, area_l);

% Plot stress-strain curve
subplot(2,2,3)
plot(strain_s, stress_s/1e9, 'LineWidth', 2, 'Color', 'black'); % stress is turned to GPa so it fits the graph better
xlabel('Engineering Strain (m/m)', 'FontSize', 12); % label of x axis with units
ylabel('Engineering Stress (GPa)', 'FontSize', 12); % label of y axis with units
title('Short I-beam 1', 'Fontweight', 'bold', 'FontSize', 15); 
grid on;
hold on;

% Short 2
% Choose appropriate ranges of entries in the spreadsheet for values

force_s2 = data(2:end, 35); % force data values 
displacement_s2 = data(2:end, 34); % displacement values  

% Call function to find stress and strain
[strain_s2, stress_s2] = processRawData(displacement_s2, force_s2, len_gs, area_l);

% Plot stress-strain curve
subplot(2,2,4)
plot(strain_s2, stress_s2/1e9, 'LineWidth', 2, 'Color', 'black'); % stress is turned to GPa so it fits the graph better
xlabel('Engineering Strain (m/m)', 'FontSize', 12); % label of x axis with units
ylabel('Engineering Stress (GPa)', 'FontSize', 12); % label of y axis with units
title('Short I-beam 2', 'Fontweight', 'bold', 'FontSize', 15); 
grid on;
hold on;


% /// Plastic coupon (AP 8222)

figure(4)

% Orange
% Choose appropriate ranges of entries in the spreadsheet for values

force_o = data(2:end, 7); % force data values 
displacement_o = data(2:end, 6); % displacement values  

% Import cross-sectional areas and gauge lengths 

area_o = 2.64461 / 1000; % cross-sectional area in meters
len_go = 40 / 1000; % gauge length in meters

% Call function to find stress and strain
[strain_o, stress_o] = processRawData(displacement_l, force_l, len_go, area_o);

% Plot stress-strain curve
subplot(2,2,1)
plot(strain_o, stress_o/1e9, 'LineWidth', 2, 'Color', 'black'); % stress is turned to GPa so it fits the graph better
xlabel('Engineering Strain (m/m)', 'FontSize', 12); % label of x axis with units
ylabel('Engineering Stress (GPa)', 'FontSize', 12); % label of y axis with units
title('Plastic Coupon Or', 'Fontweight', 'bold', 'FontSize', 15); 
grid on;
hold on;

% Black
% Choose appropriate ranges of entries in the spreadsheet for values

force_b = data(2:end, 11); % force data values 
displacement_b = data(2:end, 10); % displacement values  

% Call function to find stress and strain
[strain_b, stress_b] = processRawData(displacement_b, force_b, len_go, area_o);

% Plot stress-strain curve
subplot(2,2,2)
plot(strain_b, stress_b/1e9, 'LineWidth', 2, 'Color', 'black'); % stress is turned to GPa so it fits the graph better
xlabel('Engineering Strain (m/m)', 'FontSize', 12); % label of x axis with units
ylabel('Engineering Stress (GPa)', 'FontSize', 12); % label of y axis with units
title('Plastic Coupon Bl', 'Fontweight', 'bold', 'FontSize', 15); 
grid on;
hold on;

% Blue
% Choose appropriate ranges of entries in the spreadsheet for values

force_u = data(2:end, 15); % force data values 
displacement_u = data(2:end, 14); % displacement values  

% Call function to find stress and strain
[strain_u, stress_u] = processRawData(displacement_u, force_u, len_go, area_o);

% Plot stress-strain curve
subplot(2,2,3)
plot(strain_u, stress_u/1e9, 'LineWidth', 2, 'Color', 'black'); % stress is turned to GPa so it fits the graph better
xlabel('Engineering Strain (m/m)', 'FontSize', 12); % label of x axis with units
ylabel('Engineering Stress (GPa)', 'FontSize', 12); % label of y axis with units
title('Plastic Coupon Blue', 'Fontweight', 'bold', 'FontSize', 15); 
grid on;
hold on;

% Clear
% Choose appropriate ranges of entries in the spreadsheet for values

force_c = data(2:end, 19); % force data values 
displacement_c = data(2:end, 18); % displacement values  

% Call function to find stress and strain
[strain_c, stress_c] = processRawData(displacement_c, force_c, len_go, area_o);

% Plot stress-strain curve
subplot(2,2,4)
plot(strain_c, stress_c/1e9, 'LineWidth', 2, 'Color', 'black'); % stress is turned to GPa so it fits the graph better
xlabel('Engineering Strain (m/m)', 'FontSize', 12); % label of x axis with units
ylabel('Engineering Stress (GPa)', 'FontSize', 12); % label of y axis with units
title('Plastic Coupon Cl', 'Fontweight', 'bold', 'FontSize', 15); 
grid on;
hold on;
