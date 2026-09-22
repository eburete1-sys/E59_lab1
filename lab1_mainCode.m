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
[E_poly2, ultStress_poly2] = analyzeData(strain_poly2, stress_poly2, [18, 22]);
E_poly2
ultStress_poly2
title('Stress vs. Strain (Polyethylene specimen 2)')

%polyethylene 3
deltaX_poly3 = -1*data(2:720,46);
force_poly3 = -1*data(2:720,47);
[strain_poly3, stress_poly3] = processRawData(deltaX_poly3, force_poly3, L_0_poly, area_poly);
[E_poly3, ultStress_poly3] = analyzeData(strain_poly3, stress_poly3, [1, 7]);
E_poly3
ultStress_poly3
title('Stress vs. Strain (Polyethylene specimen 3)')

disp('outputs are in MPa!')