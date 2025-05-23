function [vect] = gen_rands(n, u = 1.0, mode = 'u', alpha = 95, check = false)

	if check
		assert(alpha > 0 && alpha < 100, 'alpha must be in range ( 0 ; 100 )');
		assert(n > 0, 'n must be greater than zero');
		assert(u > 0, 'u must be greater than zero');
	end

	vect = sin((rand(1, n) - 0.5) * 2 * pi);

	switch (mode)
		case 'w'
			vect = vect * sqrt(u) * sqrt(2);
		case 's'
			vect = vect * u * sqrt(2);
		otherwise
			vect = vect * u * sqrt(2) / ( ...
				1.221e-11*alpha^5 - 4.680e-10*alpha^4 - ...
				8.686e-7*alpha^3 - 1.497e-6*alpha^2 + ...
				2.223e-2*alpha);
	end

end
