function [s] = gen_shapefact(c1, c2, mode = 'u', alpha = 95, num = 1e6)

	assert(sum(c1 == "nuts") == 1, 'c1 must be "n", "u", "t" or "s"');
	assert(sum(c2 == "nuts") == 1, 'c2 must be "n", "u", "t" or "s"');

	[x1, x2] = gen_corrm(num, 0, c1, c2, 1, 1, mode, alpha, false);
	[s, r] = get_corelation(x1, x2, alpha, false);

end

