function [vect] = gen_rands(n, u = 1, c = 1.41)

  assert(n > 0, 'n must be greater than zero');
  assert(u > 0, 'u must be greater than zero');
  assert(c > 0, 'c must be greater than zero');

  r = rand(1, n);
  r = r * 2 * pi;

  vect = sin(r) * u * c / 1.41;

end
