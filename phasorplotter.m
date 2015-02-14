%% Phasor plotter
% DESCRIPTIVE TEXT
function [value] = phasors(Z)
    value
    figure
    hold on
     
    % Calculate a suitable axis limit based on phasors
    m = 1.3 * max(real(Z));
     
    % Create a new figure window
    figure
    hold on
    
    % Plot an arrow from (0,0) to (Re,Im)
    quiver(0,0,real(Z),imag(Z));
     
    % Draw horizontal and vertical axis lines
    plot([-m m],[0 0])
    plot([0 0],[-m m])
     
    % Set axis limits and aspect ratio
    axis([-m,m,-m,m], 'square')
end