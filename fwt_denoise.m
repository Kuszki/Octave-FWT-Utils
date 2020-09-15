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

function [out] = fwt_denoise(wsp, info, type = 'hard')

  lmb = sqrt(2*log(info.Ls)) * median(abs(wsp(info.Lc(info.J + 1) : length(wsp)))) / 0.6745;
  out = wsp;

  if type == 'hard'

    for i = 1 : info.Ls

      if abs(out(i)) <= lmb

        out(i) = 0;

      endif

    endfor

  else

    for i = 1 : info.Ls

      out(i) = sign(out(i)) * max(0, abs(out(i)) - lmb);

    endfor

  endif

endfunction
