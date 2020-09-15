function [wsp] = lin_ident(f, n)

  fun = @(i) f(gen_ones(n, i));
  par = pararrayfun(nproc, fun, 1:n, 'UniformOutput', false);

  parfor i = 1 : n

    wsp(:,i) = cell2mat(par(i));

  end

end
