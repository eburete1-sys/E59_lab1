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