function [vect] = gen_randt(n, u = 1.0, mode = 'u', alpha = 95, check = false)

	if check
		assert(alpha > 0 && alpha < 100, 'alpha must be in range ( 0 ; 100 )');
		assert(n > 0, 'n must be greater than zero');
		assert(u > 0, 'u must be greater than zero');
	end

	c = sqrt(6)*(1 - sqrt(1 - alpha/100));
	vect = (rand(1, n) + rand(1, n)) - 1.0;

	switch (mode)
		case 'w'
			vect = vect * sqrt(u) / 0.4083;
		case 's'
			vect = vect * u / 0.4083;
		otherwise
			vect = vect * u / c / 0.4083;
	end

end
