function [r] = gen_randm(num, c, u = 1.0, mode = 'u', alpha = 95, check = true)

	if length(u) == 1
		u = u * ones(1, length(c));
	end

	if check
		assert(length(c) == length(u), 'c and u must be the same length');
	end

	switch alpha
		case 90; covs = [   1.645   1.559   1.675   1.397   ];
		case 91; covs = [   1.695   1.576   1.715   1.400   ];
		case 92; covs = [   1.751   1.593   1.757   1.403   ];
		case 93; covs = [   1.812   1.611   1.801   1.405   ];
		case 94; covs = [   1.881   1.628   1.849   1.408   ];
		case 95; covs = [   1.960   1.645   1.902   1.409   ];
		case 96; covs = [   2.054   1.663   1.960   1.411   ];
		case 97; covs = [   2.170   1.680   2.025   1.412   ];
		case 98; covs = [   2.326   1.697   2.103   1.413   ];
		case 99; covs = [   2.576   1.715   2.205   1.414   ];
		otherwise error('select alpha level in range 90-99%');
	end

	for i = 1 : length(c)

		switch (c(i))
			case 'n'; r(i,:) = gen_randn(num, u(i), mode, covs(1));
			case 'u'; r(i,:) = gen_randu(num, u(i), mode, covs(2));
			case 't'; r(i,:) = gen_randt(num, u(i), mode, covs(3));
			case 's'; r(i,:) = gen_rands(num, u(i), mode, covs(4));
		end

	end

end
