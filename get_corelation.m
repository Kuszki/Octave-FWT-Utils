function [h, r] = get_corelation(y1, y2, alpha = 95, check = true)

	if check
		assert(alpha > 0 && alpha < 100, 'alpha must be in range ( 0 ; 100 )');
		assert(length(y1) == length(y2), 'length of input vectors must be the same');
	end

	[u1, c1, s1, w1] = get_uncertainty(y1, alpha);
	[u2, c2, s2, w2] = get_uncertainty(y2, alpha);
	[u3, c3, s3, w3] = get_uncertainty(y1 + y2, alpha);

	h = (u3^2 - u1^2 - u2^2) / (2*u1*u2);
	r = (w3 - w1 - w2) / (2*s1*s2);

	h = min(h, 1); h = max(h, -1);
	r = min(r, 1); r = max(r, -1);

end
