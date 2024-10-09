function y_interp = P_vandermonde (coef, x_interp)
	% P_vandermonde(x) = a0 + a1 * x + a2 * x^2 + ... + an * x^n
	% coef = [a0, a1, a2, ..., an]'
	% y_interp(i) = P_vandermonde(x_interp(i)), i = 0 : length(x_interp) - 1

	% TODO: Calcualte y_interp using the Vandermonde coefficients
	n = length(coef) - 1; % degree of the polynomial
    m = length(x_interp); % number of interpolation points

    % Vandermonde matrix
    V = ones(m, n + 1);
    for i = 2:n + 1
        V(:, i) = x_interp .* V(:, i - 1);
    endfor

    % calculate y_interp
    y_interp = V * coef;

endfunction
