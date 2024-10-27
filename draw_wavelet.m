function [wlf, sfl] = draw_wavelet(name, res)

	A = lin_ident(@(x) fwt(x, name, res), 1024);
	l = get_fwtlevels(1024, res); wl = 0; sl = 0;

	for i = l(1,1) : (l(1,2) - 1)

		if A(i, 1) == 0 && A(i, 2) != 0

			wl = i;

			break
		end

	end

	for i = 1024 : -1 : 2

		if A(wl, i) == 0 && A(wl, i-1) != 0

			wlf = A(wl,:)(1:i);

			break
		end

	end

	for i = l(2,1) : (l(2,2) - 1)

		if A(i, 1) == 0 && A(i, 2) != 0

			sl = i;

			break
		end

	end

	for i = 1024 : -1 : 2

		if A(sl, i) == 0 && A(sl, i-1) != 0

			slf = A(sl,:)(1:i);

			break
		end

	end

	newplot();
	hold on;
	plot(wlf);
	plot(slf);
	hold off;

end
