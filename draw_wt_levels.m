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

function draw_wt_levels(wsp, info)
  
  mag_label = "Wzmocnienie";
  smp_label = "Numer próbki";
  
  dec_size = size(info.Lc)(1);
  newplot();
  
  if (iscell(wsp))
    
    for i = 1 : dec_size
      
      x = 1 : info.Ls / size(wsp{i})(1) : info.Ls;
      
      subplot(dec_size, 1, i);
      plot(x, wsp{i});
      
      xlim([0 info.Ls]);
      ylabel(mag_label);
      xlabel(smp_label);
      title(gen_plot_name(i, dec_size));
      grid on;
      
    endfor
    
  elseif (ismatrix(wsp))
    
    start = 1;
    
    for i = 1 : size(info.Lc)(1)
      
      x = 1 : info.Ls / info.Lc(i) : info.Ls;
      
      subplot(dec_size, 1, i);
      plot(x, wsp(start : start + info.Lc(i) - 1));
      
      xlim([0 info.Ls]);
      ylabel(mag_label);
      xlabel(smp_label);
      title(gen_plot_name(i, dec_size));
      grid on;
      
      start = start + info.Lc(i);
      
    endfor
    
  endif
  
endfunction

function [name] = gen_plot_name(step, count)
  
  if step == 1
    
    if count > 2
      
      name = cstrcat('Aproksymacja sygnału (cA_{', num2str(count - 1), '})');
      
    else
      
      name = cstrcat('Aproksymacja sygnału (cA)');
      
    endif
    
  else
    
    if count > 2
    
      name = cstrcat('Szczegóły sygnału (cD_{', num2str(count - step + 1), '})');
      
    else
      
      name = cstrcat('Szczegóły sygnału (cD)');
      
    endif
    
  endif
  
endfunction
