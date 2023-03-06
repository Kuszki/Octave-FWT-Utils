function [s] = get_shapefact(c1 = 'a', c2 = 'a', check = true)

  all = strcmp(c1, 'a') && strcmp(c2, 'a');

  if check && !all
    assert(length(c1) == 1 && sum(c1 == 'nuts') == 1, 'shape must be "u", "n", "t" or "s"')
    assert(length(c2) == 1 && sum(c2 == 'nuts') == 1, 'shape must be "u", "n", "t" or "s"')
  end

  m = containers.Map();
  key = [c1 c2];

  m("uu") = 0.33560;
  m("nn") = 0.00000;
  m("ss") = 0.71435;
  m("tt") = 0.04151;

  m("un") = m("nu") = 0.15613;
  m("us") = m("su") = 0.53369;
  m("ut") = m("tu") = 0.17734;

  m("ns") = m("sn") = 0.29881;
  m("nt") = m("tn") = 0.02499;

  m("st") = m("ts") = 0.35037;

  if all
    s = m;
  else
    s = m(key);
  end

end
