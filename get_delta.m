function [delta] = get_delta(syg1, syg2)

  assert(length(syg1) == length(syg2), 'length dont match');

  len = length(syg1);
  delta = 0.0;

  for i = 1 : len

    delta = delta + abs(syg1(i) - syg2(i));

  end

end
