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
analyzeData(strain_brass, stress_brass)

%orange coupon
deltaX_orange = -1*data(1:147,6);
force_orange = -1*data(1:147,7);
[strain_orange, stress_orange] = processRawData(deltaX_orange, force_orange, L_0_coupon, area_coupon);
%[E_orange, ultStress_orange] =
analyzeData(strain_orange, stress_orange);

%black coupon
deltaX_black = -1*data(1:39,10);
force_black = -1*data(1:39,11);
[strain_black, stress_black] = processRawData(deltaX_black, force_black, L_0_coupon, area_coupon);
analyzeData(strain_black, stress_black);

%blue coupon
deltaX_blue = -1*data(2:157,14);
force_blue = -1*data(2:157,15);
[strain_blue, stress_blue] = processRawData(deltaX_blue, force_blue, L_0_coupon, area_coupon);
analyzeData(strain_blue, stress_blue)

%clear coupon
deltaX_clear = -1*data(2:234,18);
force_clear = -1*data(2:234,19);
[strain_clear, stress_clear] = processRawData(deltaX_clear, force_clear, L_0_coupon, area_coupon);
analyzeData(strain_clear, stress_clear)

%long ibeam 1
deltaX_long1 = -1*data(2:64,22);
force_long1 = -1*data(2:64,23);
[strain_long1, stress_long1] = processRawData(deltaX_long1, force_long1, L_0_ibeam_long, area_ibeam);
analyzeData(strain_long1, stress_long1)

%long ibeam 2
deltaX_long2 = -1*data(2:55,26);
force_long2 = -1*data(2:55,27);
[strain_long2, stress_long2] = processRawData(deltaX_long2, force_long2, L_0_ibeam_long, area_ibeam);
analyzeData(strain_long2, stress_long2)

%short ibeam 1
deltaX_short1 = -1*data(2:34,30);
force_short1 = -1*data(2:34,31);
[strain_short1, stress_short1] = processRawData(deltaX_short1, force_short1, L_0_ibeam_short, area_ibeam);
analyzeData(strain_short1, stress_short1)

%short ibeam 2
deltaX_short2 = -1*data(2:26,34);
force_short2 = -1*data(2:26,35);
[strain_short2, stress_short2] = processRawData(deltaX_short2, force_short2, L_0_ibeam_short, area_ibeam);
analyzeData(strain_short2, stress_short2)

%polyethylene 1
deltaX_poly1 = -1*data(2:587,38);
force_poly1 = -1*data(2:587,39);
[strain_poly1, stress_poly1] = processRawData(deltaX_poly1, force_poly1, L_0_poly, area_poly);
analyzeData(strain_poly1, stress_poly1)

%polyethylene 2
deltaX_poly2 = -1*data(2:720,42);
force_poly2 = -1*data(2:720,43);
[strain_poly2, stress_poly2] = processRawData(deltaX_poly2, force_poly2, L_0_poly, area_poly);
analyzeData(strain_poly2, stress_poly2)


%polyethylene 3
deltaX_poly3 = -1*data(2:720,46);
force_poly3 = -1*data(2:720,47);
[strain_poly3, stress_poly3] = processRawData(deltaX_poly3, force_poly3, L_0_poly, area_poly);
analyzeData(strain_poly3, stress_poly3)