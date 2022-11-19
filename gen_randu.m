function [vect] = gen_randu(n, u = 1, mode = 'u', c = 1.650)

  assert(n > 0, 'n must be greater than zero');
  assert(u > 0, 'u must be greater than zero');
  assert(c > 0, 'c must be greater than zero');

  r = rand(1, n);
  r = r - mean(r);

  switch (mode)
    case 'w'
      vect = r * u^2 / std(r);
    case 's'
      vect = r * u / std(r);
    otherwise
      vect = r * u / c / std(r);
  end

end
