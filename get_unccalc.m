function [u, c, s, w, h] = get_unccalc(uv, cv, alpha = 95, mode = 'u', map = containers.Map())

	assert(length(uv) == length(cv), 'cv and uv must be the same length');

	kv = get_coverfact(cv, alpha);

	if strcmp(mode, 'w')
		uv = kv .* sqrt(uv);
	elseif strcmp(mode, 's')
		uv = kv .* uv;
	end

	if length(map) == 0
		map = load_shapes(alpha);
	end

	h = get_cohermatrix(cv, uv, map);
	u = sqrt(uv*h*transpose(uv));
	w = sum((uv ./ kv).^2);
	s = sqrt(w);
	c = u / s;

end
