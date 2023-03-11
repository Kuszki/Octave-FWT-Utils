function [up, um, s, w, m] = get_uncertainty(y, alpha = 95, mode = 's', check = false)

	if check
		assert(alpha > 0 && alpha < 100, 'alpha must be in range (0, 100)');
		assert(isvector(y) && length(y) > 1, 'y must be a vector');
	end

	m = mean(y); w = var(y); s = sqrt(w);
	[n, x] = hist(y, 1001, 100);

	ip = 1; ta = 0;

	while x(ip) < m; ++ip; end

	ta = n(im = ip);

	while ta < alpha
		if im > 1; ta = ta + n(--im); end
		if ip < 1001 ta = ta + n(++ip); end
	end

	up = x(ip);
	um = x(im);

	if strcmp(mode, 's')
		up = (up - um) / 2.0;
		um = up / s;
	end

end
