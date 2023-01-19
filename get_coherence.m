function [r] = get_coherence(y1, y2, n1, n2, vect)

  assert(isvector(vect), "vect must be a uncertainty vector");
  assert(length(y1) == length(y2), "length of input vectors must be the same");
  assert(n1 > 0 && n1 <= length(vect), "index n1 must be in range of uncertainty vector");
  assert(n2 > 0 && n2 <= length(vect), "index n2 must be in range of uncertainty vector");

  if n1 == n2; r = 1; return; end;

  vects = vect .^ 2;
  uss = sum(vects);

  u1 = vect(n1); u1s = vects(n1);
  u2 = vect(n2); u2s = vects(n2);
  ues = get_uncertainty(y1 + y2)^2;

  r = (ues - u1s - u2s) / (2 * u1 * u2);
  r = r * (u1s + u2s) / uss;

end
