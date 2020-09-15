function [out] = mod_matrix(syg, mat)

  size = length(syg);
  cols = length(mat(1,:));

  out = mat;
  wsp = mat * syg;
  lmb = sqrt(2*log(size)) * median(abs(wsp(size / 2 : size))) / 0.6745;

  for i = 1 : size

    if abs(wsp(i)) <= lmb

      out(i,:) = zeros(cols, 1);

    end

  end

  out = inv(mat) * out;

end
