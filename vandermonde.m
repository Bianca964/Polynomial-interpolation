function coef = vandermonde(x, y)
    % x = [x0, x1, ..., xn]'
    % y = [y0, y1, ..., yn]'
    % coef = [a0, a1, a2, ..., an]'

    % TODO: Calculate the Vandermonde coefficients
    % number of points of interpolation
    n = length(x);
    
    % create the Vandermonde matrix
    V = zeros(n, n);
    for i = 1:n
        V(:, i) = x .^ (i - 1);
    endfor
    
    % solve the linear system V * coef = y
    coef = V \ y;

endfunction
