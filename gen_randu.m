function [vect] = gen_randu(n, u = 1, c = 1.65)

  assert(n > 0, 'n must be greater than zero');
  assert(u > 0, 'u must be greater than zero');
  assert(c > 0, 'c must be greater than zero');

  r = rand(1, n);
  r = r - mean(r);

  vect = r * u / c / std(r);

end
