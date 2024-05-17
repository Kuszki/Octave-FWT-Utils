function [h, r] = gen_coherence(p1, p2, c1, c2, mode = 'u', alpha = 95, num = 1e6)

	assert(sum(c1 == "nuts") == 1, 'c1 must be "n", "u", "t" or "s"');
	assert(sum(c2 == "nuts") == 1, 'c2 must be "n", "u", "t" or "s"');

	x1 = gen_randm(num, c1, p1, mode, alpha, false);
	x2 = gen_randm(num, c2, p2, mode, alpha, false);

	[h, r] = get_corelation(x1, x2, alpha, false);

end

