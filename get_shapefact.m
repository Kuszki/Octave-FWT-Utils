function [s] = get_shapefact(c1 = 'a', c2 = 'a', check = true)

  all = strcmp(c1, 'a') && strcmp(c2, 'a');

  if check && !all
    assert(length(c1) == 1 && sum(c1 == 'nuts') == 1, 'shape must be "u", "n", "t" or "s"')
    assert(length(c2) == 1 && sum(c2 == 'nuts') == 1, 'shape must be "u", "n", "t" or "s"')
  end

  m = containers.Map();
  key = [c1 c2];

  m("uu") = 0.334;
  m("nn") = 0.000;
  m("ss") = 0.714;
  m("tt") = 0.041;

  m("un") = m("nu") = 0.155;
  m("us") = m("su") = 0.531;
  m("ut") = m("tu") = 0.177;

  m("ns") = m("sn") = 0.296;
  m("nt") = m("tn") = 0.021;

  m("st") = m("ts") = 0.350;

  if all
    s = m;
  else
    s = m(key);
  end

end
