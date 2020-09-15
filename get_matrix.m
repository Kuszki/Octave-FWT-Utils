function [out] = get_matrix(syg, waw, dec)

  size = length(syg);
  mat = lin_ident(@(x) fwt(x, waw, dec), size);

  out = mat;
  wsp = mat * syg;
  lmb = sqrt(2*log(size)) * median(abs(wsp(size / 2 : size))) / 0.6745;

  for i = 1 : size

    if abs(wsp(i)) <= lmb

      out(i,:) = zeros(1, size);

    end

  end

  out = inv(mat) * out;

end
