function [ y ] = ln_gen_plot( amount, u, s)
% LN_GEN_PLOT Plots the generated samples into a time sequence Log-Normal
% ------------------------------------------------------------------------
%    amount : amount of samples in the set                       (1 value)
%         u : scale parameter Log-Normal                         (1 value)
%         s : shape parameter Log-Normal                         (1 value)
%       ---   ------------------------------------------------------------
%         y : generated samples Log-Normal                 (column vector)
% ---------   -------------------(example)--------------------------------
% [ y ] = ln_gen_plot( 3000, 1, 0.5 );
% -------------------------------(example)--------------------------------

% calling the generation function Log-Normal
y = ln_gen( amount, u, s);

x = 1:1:amount;

% Create figure
figure1 = figure;

% Create axes
axes1 = axes('Parent',figure1);
box(axes1,'on');
hold(axes1,'all');

% Create plot
plot(x',y,'DisplayName','amplitude vs. samples');

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