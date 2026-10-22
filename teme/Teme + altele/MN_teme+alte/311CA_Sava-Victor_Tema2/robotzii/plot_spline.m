function plot_spline(x, y, nr_points)
    % Calculate the spline polynomial coefficients
    coef = spline_c2(x, y);

    % Calculate plotting points
    xlin = linspace(min(x), max(x), nr_points)';
    ylin = P_spline(coef, x, xlin);
    % ylin = interp1(x, y, xlin, 'spline'); % this whole task could have been solved with one function...

    % Plot interpolation
    h = plot(xlin, ylin, '-', x, y, 'o', "markersize", 5, 'markerfacecolor', 'red', "color", "red");
    xlabel('x');
    ylabel('y');
    title('Traiectorie robot - Spline');
    set(gcf, 'color', [0.8 0.8 0.8]); % Set background color to gray
    grid on;
    grid minor;
endfunction
