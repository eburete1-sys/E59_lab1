function [strain, stress] = processRawData(deltaX, force, L_0, area)
    %arguments:
        %deltaX -> nx1 array of displacement values in m
        %force  -> nx1 array of force values in N
        %L_0    -> scalar value of gague length, in m
        %area   -> cross-sectional area of sample, in m^2
    %calculate stress & strain data from force & displacement data &
    %measurements
    force = abs(force);
    deltaX = abs(deltaX);
    strain = deltaX/L_0; %strain values (unitless)
    stress = force/area; %stress values in Pa
    strain(isnan(strain)) = [];
    stress(isnan(stress)) = [];

end