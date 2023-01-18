function [r] = get_corelation(y1, y2, mode = "w")

  assert(length(y1) == length(y2), "length of input vectors must be the same");

  w1 = var(y1); s1 = sqrt(w1);
  w2 = var(y2); s2 = sqrt(w2);
  we = var(y1 + y2);

  r = (we - w1 - w2) / (2 * s1 * s2);

end
