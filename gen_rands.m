function [vect] = gen_rands(n, u = 1, mode = 'u', c = 1.415)

  assert(n > 0, 'n must be greater than zero');
  assert(u > 0, 'u must be greater than zero');
  assert(c > 0, 'c must be greater than zero');

  r = rand(1, n);
  r = r - mean(r);
  r = r * 2 * pi;

  switch (mode)
    case 'w'
      vect = sin(r) * sqrt(u) * 1.415;
    case 's'
      vect = sin(r) * u * 1.415;
    otherwise
      vect = sin(r) * u * c / 1.415;
  end

end
