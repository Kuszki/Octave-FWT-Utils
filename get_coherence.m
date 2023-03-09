function [h, s, k1, k2] = get_coherence(c1, c2, r12 = 0.0, n1 = 0, n2 = 0, uv = [], rv = [], check = false)

  isrok = !check || !length(rv) || (rows(rv) == length(uv) && columns(rv) == length(uv));

  if check
    assert(n1 + n2 == 0 || n1 + n2 >= 2, 'all or noone indexes must be zero given');
    assert(n1 >= 0 && n1 <= length(uv), 'index n1 must be in range of uncertainty uvor');
    assert(n2 >= 0 && n2 <= length(uv), 'index n2 must be in range of uncertainty uvor');
    assert(isrok, 'rv must be square matrix with length(uv) x length(uv) dimmension');
  end

  if n1 == n2 && n1 != 0; r = s = k1 = k2 = 1.0;
  elseif r12 != 0.0

     cp = sprintf("%s_%s", c1, c2);
     dat = load('dat_coherences.gz').(cp);

     s = interp1(dat(:,1), dat(:,2), 0.0);
     h = interp1(dat(:,1), dat(:,2), r12);

     k1 = k2 = 1.0;
     #h = s = r12;

  else

    s = get_shapefact(c1, c2);
    k1 = k2 = 1.0;

    if length(uv)

      if !length(rv); rv = diag(ones(1, length(c))); end;

      u1 = uv(n1); u2 = uv(n2);

      us = uv * rv * transpose(uv);
      ss = sum(uv .^ 2);

      d1 = sqrt(us) - sqrt(ss);
      d2 = abs(d1);

      k1 = u1^2 + u2^2 + d1^2;
      k1 = k1 / ss;

      k2 = (min(u1, u2) + d2) / (max(u1, u2));
      k2 = k2^(1/2);

      if d1 < 0; k1 = 1 - k1; end;

      #assert(k1 >= 0 && k1 <= 1, sprintf('range k1 = %f', k1))
      #assert(k2 >= 0 && k2 <= 1, sprintf('range k2 = %f', k2))

    end

    h = s * abs(k1) * abs(k2);
    #assert(h >= -1 && h <= 1, sprintf('range h = %f', h))

  end

end
