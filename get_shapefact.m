function [s] = get_shapefact(c1 = 'a', c2 = 'a', mode = 'table', check = false)

  all = strcmp(c1, 'a') && strcmp(c2, 'a') && !strcmp('file');

  if check && !all
    assert(length(c1) == 1 && sum(c1 == 'nutsr') == 1, 'shape must be "u", "n", "t", "s" or "r"')
    assert(length(c2) == 1 && sum(c2 == 'nutsr') == 1, 'shape must be "u", "n", "t", "s" or "r"')
  end

  if strcmp(mode, 'file')

    cp = sprintf("%s_%s", c1, c2);
    dat = load('dat_coherences.gz').(cp);
    s = interp1(dat(:,1), dat(:,2), 0.0)

  else

    m = containers.Map();
    key = [c1 c2];

    m("uu") = 0.33560;
    m("nn") = 0.00000;
    m("ss") = 0.71435;
    m("tt") = 0.04151;
    m("rr") = 0.02726;

    m("un") = m("nu") = 0.15613;
    m("us") = m("su") = 0.53369;
    m("ut") = m("tu") = 0.17734;
    m("ur") = m("ru") = 0.06612;

    m("ns") = m("sn") = 0.29881;
    m("nt") = m("tn") = 0.02499;
    m("nr") = m("rn") = -0.0091;

    m("st") = m("ts") = 0.35037;
    m("sr") = m("rs") = 0.19715;

    m("tr") = m("rt") = -0.0101;

    if all
      s = m;
    else
      s = m(key);
    end

  end

end
