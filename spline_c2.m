function coef = spline_c2 (x, y)
	% Remember that the indexes in Matlab start from 1, not 0

	% si(x)   = ai + bi(x - xi) + ci(x - xi)^2 + di(x - xi)^3
	% si'(x)  =      bi         + 2ci(x - xi)  + 3di(x - xi)^2
	% si''(x) =                   2ci          + 6di(x - xi)

	% number of intervals
    n = length(x) - 1;

    % initialize the coefficient matrix A and the vector b
    A = zeros(4 * n, 4 * n);
    b = zeros(4 * n, 1);

	% TOOD 1: si(xi) = yi, i = 0 : n - 1
    row = 1;
	for i = 0:n-1
        A(row, i * 4 + 1:(i + 1) * 4) = [1, 0, 0, 0];
        b(row) = y(i + 1);
        row = row + 1;
    endfor
	
	% TODO 2: s_n-1(xn) = yn
	A(row, (n - 1) * 4 + 1:n * 4) = [1, x(n + 1) - x(n), ...
                                     (x(n + 1) - x(n))^2, (x(n + 1) - x(n))^3];
    b(row) = y(n+1);
    row = row + 1;

	% TODO 3: si(x_i+1) = s_i+1(x_i+1), i = 0 : n - 1
	for i = 0:n - 2
        A(row, i * 4 + 1:(i + 1) * 4) = [1, x(i + 2) - x(i + 1), ...
                                         (x(i + 2) - x(i + 1))^2, ...
                                         (x(i + 2) - x(i + 1))^3];
        A(row, (i + 1) * 4 + 1:(i + 2) * 4) = [-1, 0, 0, 0];
        b(row) = 0;
        row = row + 1;
    endfor

	% TODO 4: si'(x_i+1) = s_i+1'(x_i+1), i = 0 : n - 1
	for i = 0:n - 2
        A(row, i * 4 + 1:(i + 1) * 4) = [0, 1, 2 * (x(i + 2) - x(i + 1)), ...
                                         3 * (x(i + 2) - x(i + 1))^2];
        A(row, (i + 1) * 4 + 1:(i + 2) * 4) = [0, -1, 0, 0];
        b(row) = 0;
        row = row + 1;
    endfor

	% TODO 5: si''(x_i+1) = s_i+1''(x_i+1), i = 0 : n - 1
	for i = 0:n - 2
        A(row, i * 4 + 1:(i + 1) * 4) = [0, 0, 2, 6 * (x(i + 2) - x(i + 1))];
        A(row, (i + 1) * 4 + 1:(i + 2) * 4) = [0, 0, -2, 0];
        b(row) = 0;
        row = row + 1;
    endfor

	% TODO 6: s0''(x0) = 0
	A(row, 1:4) = [0, 0, 2, 0];
    b(row) = 0;
    row = row + 1;

	% TODO 7: s_n-1''(x_n) = 0
	A(row, (n - 1) * 4 + 1:n * 4) = [0, 0, 2, 6 * (x(n + 1) - x(n))];
    b(row) = 0;

	% Solve the system of equations
	coef = A \ b;

endfunction
