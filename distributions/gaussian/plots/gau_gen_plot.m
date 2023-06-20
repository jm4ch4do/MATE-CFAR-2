function [ y ] = gau_gen_plot( amount, u, s)
% GAU_GEN_PLOT Plots the generated samples into a time sequence Gaussian
% ------------------------------------------------------------------------
%    amount : amount of samples in the set                       (1 value)
%         u : location parameter Gaussian                        (1 value)
%         s : scale parameter Gaussian                           (1 value)
%       ---   ------------------------------------------------------------
%         y : generated samples Gaussian                   (column vector)
% ---------   -------------------(example)--------------------------------
% [ y ] = gau_gen_plot( 3000, 3, 2 );
% -------------------------------(example)--------------------------------

% calling the generation function Gaussian
y = gau_gen( amount, u, s);

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