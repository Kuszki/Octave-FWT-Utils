function [h, s, k1, k2] = get_cohermatrix(c, u, r = 0.0, check = true)

  if check
    assert(length(c) == length(u), 'c and u must be the same length');
  end

  if length(r) == 1; r = diag(ones(1, length(c))); end;

  h = s = k1 = k2 = zeros(length(c), length(c));

  for i = 1 : length(c)
    for j = 1 : length(c)
      if i == j; h(i,j) = s(i,j) = k1(i,j) = k2(i,j) = 1;
      elseif h(i,j) == 0

        [ch, cs, ck1, ck2] = get_coherence(c(i), c(j), r(i,j), i, j, u, r);

        h(i,j) = h(j,i) = ch;
        s(i,j) = s(j,i) = cs;

        k1(i,j) = k1(j,i) = ck1;
        k2(i,j) = k2(j,i) = ck2;

      end
    end
  end

end
