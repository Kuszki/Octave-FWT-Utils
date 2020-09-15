## * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
## *                                                                         *
## *  {description}                                                          *
## *  Copyright (C) 2018  Łukasz "Kuszki" Dróżdż  l.drozdz@openmailbox.org   *
## *                                                                         *
## *  This program is free software: you can redistribute it and/or modify   *
## *  it under the terms of the GNU General Public License as published by   *
## *  the  Free Software Foundation, either  version 3 of the  License, or   *
## *  (at your option) any later version.                                    *
## *                                                                         *
## *  This  program  is  distributed  in the hope  that it will be useful,   *
## *  but WITHOUT ANY  WARRANTY;  without  even  the  implied  warranty of   *
## *  MERCHANTABILITY  or  FITNESS  FOR  A  PARTICULAR  PURPOSE.  See  the   *
## *  GNU General Public License for more details.                           *
## *                                                                         *
## *  You should have  received a copy  of the  GNU General Public License   *
## *  along with this program. If not, see http://www.gnu.org/licenses/.     *
## *                                                                         *
## * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *

function [data] = fwt_compress(tab, samples)

  assert(ismatrix(tab), 'tab must be a matrix');
  assert(samples > 0, 'samples must be greater than zero');
  assert(samples < length(tab), 'samples must by less then tab size');

  sorted = sort(abs(tab), 'descend');
  min = sorted(samples + 1);
  count = 0;

  data = zeros(1, length(tab));

  for i = 1 : length(tab)

    if count < samples && abs(tab(i)) > min

      data(i) = tab(i);
      count = count + 1;

    endif

  endfor

endfunction
