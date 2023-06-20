function [ y] = gau_gen_hist( amount, u, s, limit, step )
% GAU_GEN_HIST Plots the generated samples into a histogram Gaussian
% --------------------------------------------------------------------
%    amount : amount of samples in the set                   (1 value)
%         u : location parameter Gaussian                    (1 value)
%         s : scale parameter Gaussian                       (1 value)
%     limit : limit in the x axis                            (1 value)
%      step : length of the histogram bins                   (1 value)
%       ---   ---------------------------------------------------------
%         y : generated samples Gaussian               (column vector)
% ---------   ------------------(example)------------------------------
% y = gau_gen_hist( 3000, 3, 2, 10, 0.2 );
% ------------------------------(example)------------------------------

% calling the generation function Gauss
y = gau_gen( amount, u, s);

% show histogram
x = -1*limit:step:limit;
hist(y,x)

end


%  Copyright 2017 José Raúl Machado Fernández.
%
%  This file is part of MATE-CFAR 2
%
%    MATE-CFAR 2 is free software: you can redistribute it and/or modify
%    it under the terms of the GNU General Public License as published by
%    the Free Software Foundation, either version 3 of the License, or
%    (at your option) any later version.

%    MATE-CFAR 2 is distributed in the hope that it will be useful,
%    but WITHOUT ANY WARRANTY; without even the implied warranty of
%    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%    GNU General Public License for more details.

%    You should have received a copy of the GNU General Public License
%    along with MATE-CFAR 2.  If not, see <http://www.gnu.org/licenses/>.