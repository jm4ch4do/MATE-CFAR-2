function [ y ] = ln_gen_hist( amount, u, s, limit, step )
% LN_GEN_HIST Plots the generated samples into a histogram Log-Normal
% --------------------------------------------------------------------
%    amount : amount of samples in the set                   (1 value)
%         u : scale parameter Log-Normal                     (1 value)
%         s : shape parameter Log-Normal                     (1 value)
%     limit : limit in the x axis                            (1 value)
%      step : length of the histogram bins                   (1 value)
%       ---   ---------------------------------------------------------
%         y : generated samples Log-Normal             (column vector)
% ---------   ------------------(example)------------------------------
% y = ln_gen_hist( 3000, 1, 0.5, 10, 0.2 );
% ------------------------------(example)------------------------------

% calling the generation function Log-Normal
y = ln_gen( amount, u, s);

% show histogram
x = 0:step:limit;
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