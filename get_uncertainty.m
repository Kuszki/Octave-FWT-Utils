function [u, c, s, w] = get_uncertainty(y, alpha = 0.95, cut = 5, num = 2, mode = "div")

  assert(isvector(y), 'y must be a vector');
  assert(alpha > 0 && alpha < 1, 'alpha must be in range (0, 1)');
  assert(cut > 1, 'cut must be greater than 1');
  assert(num >= 1, 'num must be greater or equal 1');

  t = 0.0;
  il = 0;
  ir = 0;

  yc = zeros(1, length(y));
  stdev = std(y)*cut;
  numok = 0;

  for j = 1 : length(y)
    if abs(y(j)) < stdev

      numok = numok + 1;
      yc(numok) = y(j);

    end
  end

  y = yc - mean(yc);

  if mode == "div"

    l = idivide(int32(length(y)), int32(num), 'fix');

  else

    l = num;

  end

  a = idivide(int32(l), int32(2), 'fix');

  [n, x] = hist(y, l, 1);

  if mod(l, 2)

    t = t + n(a + 1);
    il = a;
    ir = a + 2;

  else

    il = a;
    ir = a + 1;

  end

  while t < alpha

      t = t + n(il) + n(ir);
      u = (abs(x(il)) + abs(x(ir)))/2;

      il = il - 1;
      ir = ir + 1;

  end

  s = std(y);
  w = var(y);
  c = u / s;

end
