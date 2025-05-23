function [up, um, s, w, m] = get_uncertainty(y, alpha = 95, issym = true, check = false)

	if check
		assert(alpha > 0 && alpha < 100, 'alpha must be in range (0, 100)');
		assert(isvector(y) && length(y) > 1, 'y must be a vector');
	end

	m = mean(y);
	w = var(y);
	s = sqrt(w);

	ln = round(length(y)/10);
	[n, x] = hist(y, ln, 100);

	max_ip = length(x);
	ip = 1;

	while x(ip) < m && ip < max_ip; ++ip; end

	im = ip--;
	ta = 0;

	while ta < alpha
		if im > 1;  ta = ta + n(--im); end
		if ip < ln; ta = ta + n(++ip); end
	end

	up = x(ip);
	um = x(im);

	if issym
		up = (up - um) / 2.0;
		um = up / s;
	end

end
