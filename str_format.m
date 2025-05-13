function s = str_format(s, comma = false)

	fm_e = @(x) regexprep(x, '[Ee]([+-])0+(\d+)', 'E$1$2');
	fm_m = @(x) strrep(x, '-', '−');
	fm_c = @(x) strrep(x, '.', ',');

	if comma
		s = fm_c(fm_m(fm_e(s)));
	else
		s = fm_m(fm_e(s));
	end

end
