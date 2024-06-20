function [h, s, k1, k2] = get_cohermatrix(cv, uv, map, check = true)

	if check
		assert(length(cv) == length(uv), 'c and u must be the same length');
	end

	h = s = k1 = k2 = d = zeros(length(cv), length(cv));
	su = sum(uv .^ 2);

	for i = 1 : length(cv)
		for j = 1 : length(cv)

			if i == j; h(i,j) = s(i,j) = k1(i,j) = k2(i,j) = 1;
			elseif d(i,j) == false

				ck2 = sqrt(min(uv(i), uv(j)) / max(uv(i), uv(j)));
				ck1 = (uv(i)^2 + uv(j)^2) / su;

				cs = map([cv(i) cv(j)]);
				ch = abs(cs * ck1 * ck2);

				d(i,j) = d(j,i) = true;
				h(i,j) = h(j,i) = ch;
				s(i,j) = s(j,i) = cs;

				k1(i,j) = k1(j,i) = ck1;
				k2(i,j) = k2(j,i) = ck2;

			end

		end
	end

end
