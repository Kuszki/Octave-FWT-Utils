function [u, c, s, w] = get_uncertainty(y, alpha = 0.95, cut = 0, num = 8, mode = 'div', check = true)

  if check
    assert(isvector(y), 'y must be a vector');
    assert(alpha > 0 && alpha < 1, 'alpha must be in range (0, 1)');
    assert(num >= 1, 'num must be greater or equal 1');
  end

  t = 0.0;
  il = 0;
  ir = 0;

  stdev = std(y)*cut;
  tmpmn = mean(y);
  numok = 0;

  if cut > 1

    for j = 1 : length(y)
      if abs(y(j) - tmpmn) < stdev

        numok = numok + 1;

        if j != numok
          y(numok) = y(j);
        end

      end
    end

    y = y(1 : numok);
    y = y - mean(y);

  else
    y = y - tmpmn;
  end

  if !strcmp(mode, 'div'); l = num;
  else; l = floor(length(y) / num);
  end

  a = idivide(int32(l), int32(2), 'fix');
  [n, x] = hist(y, l, 1);
  w = var(y);

  if w == 0.0; u = s = c = 0.0; return; end;

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

  s = sqrt(w);
  c = u / s;

end
