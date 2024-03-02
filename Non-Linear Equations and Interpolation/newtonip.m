function N = newtonip(X, Y)
    % X and Y are the nodes of interpolation and the function values in nodes
    
    n = length(X);
    
    % Table of divided differences
    table = zeros(n);
    table(:,1) = Y';
    
    % Compute divided differences
    for j = 2:n
        for i = j:n
            table(i,j) = (table(i,j-1) - table(i-1,j-1)) / (X(i) - X(i-j+1));
        end
    end
    
    % N - array of coefficients for the Newton polynomial
    N = diag(table)';
    
    fprintf("%d'th order Newton polynomial with coefficients: \n", n - 1);
    disp(N);  % Display the coefficients
    % Draw the graph of the interpolation
    drawInterpolation(X, Y, N, n);
end

function drawInterpolation(X, Y, N, n)
    % Draw a picture to illustrate the interpolation
    % It evaluates the polynomial in Newton form and plots the results
    
    % Generate points for the plot
    xPlot = linspace(min(X), max(X), 1000);
    yPlot = N(end) * ones(size(xPlot));
    
    for i = n-1:-1:1
        yPlot = yPlot .* (xPlot - X(i)) + N(i);
    end

    % Plot the interpolation
    plot(xPlot, yPlot, '-', X, Y, 'o');
    title('Newton Interpolation Polynomial');
    xlabel('x');
    ylabel('Interpolated values');
end
