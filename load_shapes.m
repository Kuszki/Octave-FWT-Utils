function [map] = load_shapes(alpha = 95)

	assert(exist('data_shapes.dat', 'file') == 2, 'unable to locate default data');
	assert(alpha >= 50 && alpha <= 99, 'alpha must be in range < 50 ; 99 >');

	mat = load('data_shapes.dat').shapes{round(alpha)-49};
	map = containers.Map();
	list = "nuts";

	for i = 1 : length(list)
		for j = 1 : length(list)

			map([list(i) list(j)]) = mat(i,j);

		end
	end

end
