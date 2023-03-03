function [s] = get_shapefact(c1 = 'a', c2 = 'a', check = true)

  all = strcmp(c1, 'a') && strcmp(c2, 'a');

  if check && !all
    assert(length(c1) == 1 && sum(c1 == 'nuts') == 1, 'shape must be "u", "n", "t" or "s"')
    assert(length(c1) == 1 && sum(c1 == 'nuts') == 1, 'shape must be "u", "n", "t" or "s"')
  end

  m = containers.Map();
  key = [c1 c2];

  m("uu") = 0.3358;
  m("un") = 0.1338;
  m("us") = 0.5233;
  m("ut") = 0.1774;

  m("nu") = 0.1338;
  m("nn") = 0.0000;
  m("ns") = 0.2876;
  m("nt") = 0.0218;

  m("su") = 0.5233;
  m("sn") = 0.2876;
  m("ss") = 0.7144;
  m("st") = 0.3502;

  m("tu") = 0.1774;
  m("tn") = 0.0218;
  m("ts") = 0.3502;
  m("tt") = 0.0408;

  if all
    s = m;
  else
    s = m(key);
  end

end
