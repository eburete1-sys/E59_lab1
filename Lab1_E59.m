% E59 Lab 1
% September 22, 2026
% ENGR059
% LAB #1


% Antony Coque
% September 10, 2026
% ENGR059
% MATLAB HW1

% clean up MATLAB workspace
clear % delete all variables in the workspace
clc % clear all text from the command line
close all % close all figures

% Initializing variables for gauge length and diameter

gauge_length = 25.4 / 1000; % gauge length in meters
diameter = 7.31 / 1000; % diameter in meters

% Finding cross-sectional area of gauge region (cylindrical)

area = (pi/4) * diameter.^2; % cross_sectional area in meters

% Steel Specimen

% Importing data to MATLAB 

data = readmatrix('lab1Data.csv');

% Separating columns into variables: time, force, and displacement

time = data(2:end, 13);
force = data(2:end, 15); % force data values 
displacement = data(2:end, 14); % displacement values 

% Calculating engineering stress and strain

stress = force / area; % stress is given in Pascal (Pa)
strain = displacement / gauge_length; % strain is unitless

% Plotting the stress-strain curve
figure(1)
p = plot(strain, stress/1e9, '-o', 'Color', 'black'); % strain and stress in x,y axis 
% stress is turned to GPa so it fits the graph better
xlabel('Engineering Strain (m/m)', 'FontWeight', 'bold', 'FontSize', 12); % label of x axis with units
ylabel('Engineering Stress (GPa)', 'FontWeight', 'bold', 'FontSize', 12); % label of y axis with units
title('Stress-Strain Curve for Brass', 'FontSize', 15); 
grid on;

hold on;


% Calculating slope of the linear portion of the stress-strain curve


% function used to find the indices of the linear elastic region of graph

% pt_a = datatip(p,0,0.0281639); point at index 1
% pt_b = datatip(p,0.001078,0.206273); point at index 32

x_linear = strain(1:32); % initializing range where curve is linear x 
y_linear = stress(1:32); % initializing range where curve is linear y 

slope  = polyfit(x_linear, y_linear, 1); % function to find slope

MOE_GPa = slope(1) / 1e9; % Modulus of elasticity given in GPa

ult_strength = max(stress) / 1e9; % maximum stress given in GPa

frac_stress = stress(end) / 1e9; % fracture stress given in GPa

% Calculating the yield strength using the 0.02% offset method

offset = 0.002; 
offset_stress = MOE_GPa * (strain - offset); % offset line equation
% Check difference of stress and offset_stress 
difference = stress - offset_stress; 
% finds index on the minimum difference/zero where the lines cross
[~, idx] = min(abs(difference));
yield_stress = stress(idx) / 1e9; % Finds the yield stress at the given index


% Displaying values of stress

fprintf("Modulus of Elasticity for Brass = %f GPa \n", MOE_GPa)
fprintf("Brass Ultimate Stress = %f GPa \n", ult_strength)
fprintf("Brass Fracture Stress = %f GPa \n", frac_stress)
fprintf("Brass Yield Stress = %f GPa \n", yield_stress)


