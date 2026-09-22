% Import cross-sectional areas and gauge lengths 
close all
clear
clc

data = readmatrix("NEW_lab1Data.csv");

%import cross-sectional area and original gauge length of samples
area_brass = (1e-6)*8.553; %meters^2
L_0_brass = (1e-3)*32.5; %meters

area_coupon = (1e-6)*1.835; %meters^2
L_0_coupon = 0.0018; %meters

area_ibeam = (1e-6)*26.676; %meters^2
L_0_ibeam_long = 0.017; %meters
L_0_ibeam_short = 0.0115; %meters

area_poly = (1e-6)*8.867; %meters^2
L_0_poly = (1e-3)*33.2; %meters


% Brass
deltaX_brass = -1*data(20:98,2);
force_brass = -1*data(20:98,3);
[strain_brass, stress_brass] = processRawData(deltaX_brass, force_brass, L_0_brass, area_brass);
[E_brass, ultStress_brass] = analyzeData(strain_brass, stress_brass, [4, 6]);
E_brass
ultStress_brass
title('Stress vs. Strain (Brass specimen)')

%orange coupon
deltaX_orange = -1*data(1:147,6);
force_orange = -1*data(1:147,7);
[strain_orange, stress_orange] = processRawData(deltaX_orange, force_orange, L_0_coupon, area_coupon);
[E_orange, ultStress_orange] = analyzeData(strain_orange, stress_orange, [1, 3]);
E_orange
ultStress_orange
title('Stress vs. Strain (Orange Plastic Coupon)')

%black coupon
deltaX_black = -1*data(1:39,10);
force_black = -1*data(1:39,11);
[strain_black, stress_black] = processRawData(deltaX_black, force_black, L_0_coupon, area_coupon);
[E_black, ultStress_black] = analyzeData(strain_black, stress_black, [1, 12]);
E_black
ultStress_black
title('Stress vs. Strain (Black Plastic Coupon)')

%blue coupon
deltaX_blue = -1*data(2:157,14);
force_blue = -1*data(2:157,15);
[strain_blue, stress_blue] = processRawData(deltaX_blue, force_blue, L_0_coupon, area_coupon);
[E_blue, ultStress_blue] = analyzeData(strain_blue, stress_blue, [7, 13]);
E_blue
ultStress_blue
title('Stress vs. Strain (Blue Plastic Coupon)')

%clear coupon
deltaX_clear = -1*data(2:234,18);
force_clear = -1*data(2:234,19);
[strain_clear, stress_clear] = processRawData(deltaX_clear, force_clear, L_0_coupon, area_coupon);
[E_clear, ultStress_clear] = analyzeData(strain_clear, stress_clear, [6, 10]);
E_clear
ultStress_clear
title('Stress vs. Strain (Clear Plastic Coupon)')

%long ibeam 1
deltaX_long1 = -1*data(2:64,22);
force_long1 = -1*data(2:64,23);
[strain_long1, stress_long1] = processRawData(deltaX_long1, force_long1, L_0_ibeam_long, area_ibeam);
[E_long1, ultStress_long1] = analyzeData(strain_long1, stress_long1, [12, 25]);
E_long1
ultStress_long1
title('Stress vs. Strain (Long Ibeam 1)')

%long ibeam 2
deltaX_long2 = -1*data(2:55,26);
force_long2 = -1*data(2:55,27);
[strain_long2, stress_long2] = processRawData(deltaX_long2, force_long2, L_0_ibeam_long, area_ibeam);
[E_long2, ultStress_long2] = analyzeData(strain_long2, stress_long2, [10, 24]);
E_long2
ultStress_long2
title('Stress vs. Strain (Long Ibeam 2)')

%short ibeam 1
deltaX_short1 = -1*data(2:34,30);
force_short1 = -1*data(2:34,31);
[strain_short1, stress_short1] = processRawData(deltaX_short1, force_short1, L_0_ibeam_short, area_ibeam);
[E_short1, ultStress_short1] = analyzeData(strain_short1, stress_short1, [3, 8]);
E_short1
ultStress_short1
title('Stress vs. Strain (Short Ibeam 1)')

%short ibeam 2
deltaX_short2 = -1*data(2:26,34);
force_short2 = -1*data(2:26,35);
[strain_short2, stress_short2] = processRawData(deltaX_short2, force_short2, L_0_ibeam_short, area_ibeam);
[E_short2, ultStress_short2] = analyzeData(strain_short2, stress_short2, [3, 8]);
E_short2
ultStress_short2
title('Stress vs. Strain (Short Ibeam 2)')

%polyethylene 1
deltaX_poly1 = -1*data(2:587,38);
force_poly1 = -1*data(2:587,39);
[strain_poly1, stress_poly1] = processRawData(deltaX_poly1, force_poly1, L_0_poly, area_poly);
[E_poly1, ultStress_poly1] = analyzeData(strain_poly1, stress_poly1, [1, 3]);
E_poly1
ultStress_poly1
title('Stress vs. Strain (Polyethylene specimen 1)')

%polyethylene 2
deltaX_poly2 = -1*data(2:720,42);
force_poly2 = -1*data(2:720,43);
[strain_poly2, stress_poly2] = processRawData(deltaX_poly2, force_poly2, L_0_poly, area_poly);

analyzeData(strain_poly2, stress_poly2)

[E_poly2, ultStress_poly2] = analyzeData(strain_poly2, stress_poly2, [18, 22]);
E_poly2
ultStress_poly2
title('Stress vs. Strain (Polyethylene specimen 2)')

%polyethylene 3
deltaX_poly3 = -1*data(2:720,46);
force_poly3 = -1*data(2:720,47);
[strain_poly3, stress_poly3] = processRawData(deltaX_poly3, force_poly3, L_0_poly, area_poly);

analyzeData(strain_poly3, stress_poly3)

% ///Brass (ME 8232)

% Choose appropriate ranges of entries in the spreadsheet for values

force = data(22:end, 3); % force data values 
displacement = data(22:end, 2); % displacement values  
area = 8.553 / 1000; % cross-sectional area in meters
len_g = 32.5 / 1000; % gauge length in meters
[strain, stress] = processRawData(displacement, force, len_g, area);
[E, ultStress] = analyzeData(strain,stress,1:30);


% /// Polyethylene tensile sample (ME 8235)
figure(2)
area_p = 8.867 / 1000; % cross-sectional area in meters
len_gp = 33.2 / 1000; % gauge length in meters

% Trial 1
force_p = data(2:end, 39); % force data values 
displacement_p = data(2:end, 38); % displacement values  
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
force_p2 = data(2:end, 43); % force data values 
displacement_p2 = data(2:end, 42); % displacement values  
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
force_p3 = data(2:end, 47); % force data values 
displacement_p3 = data(2:end, 46); % displacement values  
[strain_p3, stress_p3] = processRawData(displacement_p3, force_p3, len_gp, area_p);
% Plot stress-strain curve
subplot(2,2,3)
plot(strain_p3, stress_p3/1e9, 'LineWidth', 2, 'Color', 'black'); % stress is turned to GPa so it fits the graph better
xlabel('Engineering Strain (m/m)', 'FontSize', 12); % label of x axis with units
ylabel('Engineering Stress (GPa)', 'FontSize', 12); % label of y axis with units
title('Polyethylene 3', 'Fontweight', 'bold', 'FontSize', 15); 
grid on;
hold on;

% Thin I-beams (ME 7012)
figure(3)
% Long 1
force_l = data(2:end, 23); % force data values 
displacement_l = data(2:end, 22); % displacement values  
area_l = 26.676 / 1000; % cross-sectional area in meters
len_gl = 0.017; % gauge length in meters
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
force_l2 = data(2:end, 27); % force data values 
displacement_l2 = data(2:end, 26); % displacement values  
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
len_gs = 0.0115;
force_s = data(2:end, 31); % force data values 
displacement_s = data(2:end, 30); % displacement values  
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
force_s2 = data(2:end, 35); % force data values 
displacement_s2 = data(2:end, 34); % displacement values  
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
force_o = data(2:end, 7); % force data values 
displacement_o = data(2:end, 6); % displacement values  
area_o = 2.64461 / 1000; % cross-sectional area in meters
len_go = 0.0018; % gauge length in meters
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
force_b = data(2:end, 11); % force data values 
displacement_b = data(2:end, 10); % displacement values  
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
force_u = data(2:end, 15); % force data values 
displacement_u = data(2:end, 14); % displacement values  
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
force_c = data(2:end, 19); % force data values 
displacement_c = data(2:end, 18); % displacement values  
[strain_c, stress_c] = processRawData(displacement_c, force_c, len_go, area_o);
% Plot stress-strain curve
subplot(2,2,4)
plot(strain_c, stress_c/1e9, 'LineWidth', 2, 'Color', 'black'); % stress is turned to GPa so it fits the graph better
xlabel('Engineering Strain (m/m)', 'FontSize', 12); % label of x axis with units
ylabel('Engineering Stress (GPa)', 'FontSize', 12); % label of y axis with units
title('Plastic Coupon Cl', 'Fontweight', 'bold', 'FontSize', 15); 
grid on;
hold on;

[E_poly3, ultStress_poly3] = analyzeData(strain_poly3, stress_poly3, [1, 7]);
E_poly3
ultStress_poly3
title('Stress vs. Strain (Polyethylene specimen 3)')

disp('outputs are in MPa!')
