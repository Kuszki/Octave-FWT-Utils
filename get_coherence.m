function [h, s, k1, k2] = get_coherence(c1, c2, r12 = 0.0, n1 = 0, n2 = 0, vect = [], check = true)

  if check
    assert(n1 + n2 == 0 || n1 + n2 >= 2, 'all or noone indexes must be zero given');
    assert(n1 >= 0 && n1 <= length(vect), 'index n1 must be in range of uncertainty vector');
    assert(n2 >= 0 && n2 <= length(vect), 'index n2 must be in range of uncertainty vector');
  end

  if n1 == n2 && n1 != 0; r = s = k1 = k2 = 1.0;
  elseif r12 != 0.0; h = s = r12; k1 = k2 = 1.0;
  else

    s = get_shapefact(c1, c2);

    if length(vect)
      k1 = (vect(n1)^2 + vect(n2)^2) / sum(vect .^ 2);
      k2 = abs(min(vect(n1), vect(n2))/max(vect(n1), vect(n2)));
      k2 = sqrt(k2);
    else
      k1 = k2 = 1.0;
    end

    h = s * k1 * k2;

  end

end