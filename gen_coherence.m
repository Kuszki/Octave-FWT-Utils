function [h, r] = gen_coherence(p1, p2, c1, c2, r = 0.0, mode = 'u', alpha = 95, num = 1e6)

	assert(sum(c1 == "nuts") == 1, 'c1 must be "n", "u", "t" or "s"');
	assert(sum(c2 == "nuts") == 1, 'c2 must be "n", "u", "t" or "s"');
	assert(r <= 1 && r >= -1, 'r must be in range < -1 ; 1 >');

	[x1, x2] = gen_corrm(num, r, c1, c2, p1, p2, mode, alpha, false);
	[h, r] = get_corelation(x1, x2, alpha, false);

end

