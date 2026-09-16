function [strain, stress] = processRawData(deltaX, force, L_0, area)
    %arguments:
        %deltaX -> nx1 array of displacement values in m
        %force  -> nx1 array of force values in N
        %L_0    -> scalar value of gague length, in m
        %area   -> cross-sectional area of sample, in m^2
    %calculate stress & strain data from force & displacement data &
    %measurements

    stress = force / area; % stress is given in Pascal (Pa)
    strain = deltaX / L_0; % strain is unitless
    disp('ran processRawData')

    strain = deltaX/L_0;
    stress = force/area;

end

%%

function [E, ultStress] = analyzeData(strain, stress, ind)
    %arguments:
        %strain -> nx1 array of strain values
        %stress -> nx1 array of stress values in Pa
        %ind    -> 1x2 array of indices. Specifies the range of entries to do the
        %linear regression on
    
    %set up new figure
    figure
    grid on
    hold on
    theme('light')
    

    %plot stress-strain curve
    plot(strain, stress,'-k','linewidth',1)

    %find ultimate stress
    ultStress = max(stress);
    ultInd = find(stress==ultStress,1); %index of ultimate stress
    %plot ultimate stress
    plot(strain(ultInd), ultStress, 'rx', 'markersize', 12)

    if exist('ind', 'var') %only if a range for the linear regression has been specified in the arguments, find and plot the best fit line
        %find best fit
        fit = polyfit(strain(ind(1):ind(2)), stress(ind(1):ind(2)), 1); %find best fit line with regression
        E = fit(1); %young's modulus in Pa
        %plot best fit line
        plot(strain, polyval(fit), '-b', 'linewidth', 1)
    end
end

%%
% Brass

%import force & displacement data, choosing appropriate ranges of entries in the spreadsheet
data = readmatrix("NEW_lab1Data.csv");
force = data(2:end, 3); % force data values 
displacement = data(2:end, 2); % displacement values  

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