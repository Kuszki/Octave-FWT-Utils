function [up, um, s, w, m] = get_uncertainty(y, alpha = 95, mode = 's', check = false)

	if check
		assert(alpha > 0 && alpha < 100, 'alpha must be in range (0, 100)');
		assert(isvector(y) && length(y) > 1, 'y must be a vector');
	end

	m = mean(y); w = var(y); s = sqrt(w);
	[n, x] = hist(y, 1000, 100);

	ip = 1; ta = 0;

	while x(ip) < m; ++ip; end

	im = ip - 1;

	while ta < alpha
		ta = ta + n(ip++) + n(im--);
	end

	up = x(ip-1);
	um = x(im+1);

	if strcmp(mode, 's')
		up = (up - um) / 2.0;
		um = up / s;
	end

end
