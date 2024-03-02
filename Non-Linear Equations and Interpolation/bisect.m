function x = bisect(f_str, a, b, n)
% f_str is the function as a string
% a , b are the right and left limits of the interval
% n is the number of bisections to do

% Convert the string to a function handle
f = str2func(['@(x)' f_str]);

% Checking if the ends have different signs.
fa = f(a);
fb = f(b);

if fa * fb > 0
    error("Both end points of the function has the same sign! ");
end

% Doing the bisection n times.
for i = 1:n
    % Finding the middle and evaluating there
    x = (a + b) / 2;
    fx = f(x);
    disp([x, fx])

    if fx == 0.0   % Solved the equation exactly
        a = x;
        b = x;
        break % Jumps out of the loop if we got our solution
    end

    % Decide which half to keep so that the signs of the ends are different
    if fa * fx < 0.0
        % If it's negative
        b = x;
    else
        % If it's positive
        a = x;
    end
end

% Output the final approximation of the root
x = (a + b) / 2;
end