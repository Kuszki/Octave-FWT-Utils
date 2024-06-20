function [vect1, vect2] = gen_corrm(n, r, c1, c2, u1 = 1.0, u2 = 1.0, mode = 'u', alpha = 95, check = true)

	if check
		assert(alpha > 0 && alpha < 100, 'alpha must be in range ( 0 ; 100 )');
		assert(r <= 1 && r >= -1, 'r must be in range < -1 ; 1 >');
	end

	vect1 = gen_randm(n, c1, u1, mode, alpha, check);
	vect2 = gen_randm(n, c2, u2, mode, alpha, check);

	if r > 0; vect2 = r*vect1 + sqrt(1 - r^2)*vect2;
	elseif r < 0; vect2 = r*vect1 - sqrt(1 - r^2)*vect2;
	end;

end
