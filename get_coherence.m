function [r] = get_coherence(c1, c2, r12, n1 = 0, n2 = 0, vect = [], check = true)

  if check
    assert(length(y1) == length(y2), 'length of input vectors must be the same');
  end

  if check
    assert(isvector(vect), 'vect must be a uncertainty vector');
    assert(n1 > 0 && n1 <= length(vect), 'index n1 must be in range of uncertainty vector');
    assert(n2 > 0 && n2 <= length(vect), 'index n2 must be in range of uncertainty vector');
  end

  if n1 == n2; r = 1; return; end;
  elseif r12 > 0.9; r = r12; return; end;

  s = 123; % WIP TODO

  r = s * (u1s + u2s) / uss;

end
