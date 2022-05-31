function [u, c, s, w] = get_uncertainty(y, num = 4, mode = "div")

  assert(isvector(y), 'y must be a vector');

  t = 0.0;
  il = 0;
  ir = 0;

  if mode == "div"

    l = idivide(int32(length(y)), int32(num), 'fix');

  else

    l = num;

  end

  a = idivide(int32(l), int32(2), 'fix');
  y = y .- mean(y);

  [n, x] = hist(y, l, 1);

  if mod(l, 2)

    t = t + n(a + 1);
    il = a;
    ir = a + 2;

  else

    il = a;
    ir = a + 1;

  end

  while t < 0.95

      t = t + n(il) + n(ir);
      u = (abs(x(il)) + abs(x(ir)))/2;

      il = il - 1;
      ir = ir + 1;

  end

  s = std(y);
  w = var(y);
  c = u / s;

end
