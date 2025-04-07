function [a, p, u, w, vx, vy] = get_dynparams(amp, phi, alpha = 95, check = true)

	if check
		assert(length(amp) == length(phi), 'amps and phis must be the same length');
		assert(alpha >= 1 && alpha <= 99, 'alpha must be in range < 1 ; 99 >');
	end

	vx = 0.0;
	vy = 0.0;

	for i = 1 : length(amp)

		vx = vx + amp(i)*cos(phi(i));
		vy = vy + amp(i)*sin(phi(i));

	end

	a = sqrt(vx^2 + vy^2);
	p = atan2(vy, vx);
	u = get_coverfact('s', alpha) * a/sqrt(2);
	w = a^2 / 2;

end
