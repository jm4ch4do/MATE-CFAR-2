function [ y ] = par_gen( amount, a, b )
% PAR_GEN Generates samples of the Pareto distribution
% ----------------------------------------------------------
%   amount : amount of samples                     (1 value)
%        a : shape parameter Pareto                (1 value)
%        b : scale parameter Pareto                (1 value)
%      ---   -----------------------------------------------
%        y : generated samples Pareto        (column vector)
% --------   -------------(example)-------------------------
% [ y ] = par_gen( 3000, 2, 2 );
% ------------------------(example)-------------------------

% initial
y = zeros(1,amount);

% looping
for m_1 = 1:amount
    y(1,m_1) = b/(rand(1,1)^(1/a));
end

% removing extra-precision
y = roundn(y',-5);

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