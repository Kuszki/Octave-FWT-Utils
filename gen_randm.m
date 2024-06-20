function [r] = gen_randm(num, c, u = 1.0, mode = 'u', alpha = 95, check = true)

	if length(u) == 1
		u = u * ones(1, length(c));
	end

	for i = 1 : length(c)

		switch (c(i))
			case 'n'; r(i,:) = gen_randn(num, u(i), mode, alpha, check);
			case 'u'; r(i,:) = gen_randu(num, u(i), mode, alpha, check);
			case 't'; r(i,:) = gen_randt(num, u(i), mode, alpha, check);
			case 's'; r(i,:) = gen_rands(num, u(i), mode, alpha, check);
			case 'd'; r(i,:) = gen_randd(num, u(i), mode, alpha, check);
		end

	end

end
