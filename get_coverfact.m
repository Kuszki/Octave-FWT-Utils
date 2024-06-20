function [c] = get_coverfact(cv, alpha = 95)

	for i = 1 : length(cv)
		switch cv(i)

			case 'n'
				c(i) = norminv(1 - (1 - alpha/100) / 2);
			case 'u'
				c(i) = sqrt(3)*(alpha/100);
			case 't'
				c(i) = sqrt(6)*(1 - sqrt(1 - alpha/100));
			case 's'
				c(i) = 1.221e-11*alpha^5 - 4.680e-10*alpha^4 - ...
					8.686e-7*alpha^3 - 1.497e-6*alpha^2 + ...
					2.223e-2*alpha;

			otherwise error('cv element must be "n", "u", "t" or "s"');

		end
	end

end
