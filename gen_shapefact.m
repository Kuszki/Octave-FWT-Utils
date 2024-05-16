function s = gen_shapefact(c1, c2, s1, s2, alpha, num = 1e6)

	assert(sum(c1 == "nuts") == 1, 'c1 must be "n", "u", "t" or "s"');
	assert(sum(c2 == "nuts") == 1, 'c2 must be "n", "u", "t" or "s"');

	switch (c1)
		case 'n'
			x1 = gen_randn(num, 1/c1, 's');
		case 'u'
			x1 = gen_randu(num, 1/c1, 's');
		case 's'
			x1 = gen_rands(num, 1/c1, 's');
		case 't'
			x1 = gen_randt(num, 1/c1, 's');
	end

	switch (c2)
		case 'n'
			x2 = gen_randn(num, 1/c2, 's');
		case 'u'
			x2 = gen_randu(num, 1/c2, 's');
		case 's'
			x2 = gen_rands(num, 1/c2, 's');
		case 't'
			x2 = gen_randt(num, 1/c2, 's');
	end

	s = get_corelation(x1, x2, alpha, false);

end

