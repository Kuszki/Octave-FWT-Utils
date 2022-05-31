function [a] = get_rowcoef(wsp, i)

  if isvector(wsp)

    a = sqrt(sum(wsp.^2));

  elseif is_matrix(i)

    for j = 1 : length(i)

      a(j) = sqrt(sum(wsp(i(j),:).^2));

    end

  else

    a = sqrt(sum(wsp(i,:).^2));

  end

end
