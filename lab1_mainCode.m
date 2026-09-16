function [strain, stress] = processRawData(deltaX, force, L_0, area)
    %arguments:
        %deltaX -> nx1 array of displacement values in m
        %force  -> nx1 array of force values in N
        %L_0    -> scalar value of gague length, in m
        %area   -> cross-sectional area of sample, in m^2
    %calculate stress & strain data from force & displacement data &
    %measurements
    strain = deltaX/L_0;
    stress = force/area;
end

%%

function [E, ultStress] = analyzeData(strain, stress, range)
    %arguments:
        %strain -> nx1 array of strain values
        %stress -> nx1 array of stress values in Pa
        %range  -> 1x2 array, being the xlimits to do linear regression on
    
    %plot stress-strain curve

    %find ultimate stress
    %plot ultimate stress

    if exist('range', 'var') %only if a range for the linear regression has been specified, find and plot the best fit line
        %find young's modulus
        %plot best fit line
        disp('range is defined')
    end
    disp('ran analyzeData')
end

%%

%import force & displacement data, choosing appropriate ranges of entries in the spreadsheet
%also import cross-sectional areas and gauge lengths

%We want to import data from NEW_lab1Data.csv

%call function for each trial

processRawData(1,2,3,4)
analyzeData(1,2)
analyzeData(1,2,3)