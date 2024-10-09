function y_interp = P_spline (coef, x, x_interp)
	% si(x)   = ai + bi(x - xi) + ci(x - xi)^2 + di(x - xi)^3, i = 0 : n - 1
	% coef = [a0, b0, c0, d0, a1, b1, c1, d1, ..., an-1, bn-1, cn-1, dn-1]
	% x = [x0, x1, ..., xn]
	% y_interp(i) = P_spline(x_interp(i)), i = 0 : length(x_interp) - 1
	% Be careful! Indexes in Matlab start from 1, not 0

	% TODO: Calculate y_interp using the Spline coefficients
    
    % initialize y_interp
    y_interp = zeros(size(x_interp));
    
    % find the interval indices for each x_interp
    [~, interval_indices] = histc(x_interp, [-Inf; x(2:end-1); Inf]);
    
    % evaluate the spline at each interpolation point
    for i = 1:length(x) - 1
        % logical index for points in the i-th interval
        idx = (interval_indices == i);
        
        if any(idx)
            % coefficients for the i-th interval
            a = coef(4 * (i - 1) + 1);
            b = coef(4 * (i - 1) + 2);
            c = coef(4 * (i - 1) + 3);
            d = coef(4 * (i - 1) + 4);
            
            % compute the offset (x_interp - x(i)) for points in this interval
            dx = x_interp(idx) - x(i);
            
            % evaluate the spline polynomial for these points
            y_interp(idx) = a + b * dx + c * dx .^ 2 + d * dx .^ 3;
        endif
    endfor

endfunction
