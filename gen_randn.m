function [vect] = gen_randn(n, u = 1.0, mode = 'u', alpha = 95, check = false)

	if check
		assert(alpha > 0 && alpha < 100, 'alpha must be in range ( 0 ; 100 )');
		assert(n > 0, 'n must be greater than zero');
		assert(u > 0, 'u must be greater than zero');
	end

	vect = randn(1, n);

	switch (mode)
		case 'w'
			vect = vect * sqrt(u);
		case 's'
			vect = vect * u;
		otherwise
			vect = vect * u / norminv(1 - (1 - alpha/100) / 2);
	end

end
