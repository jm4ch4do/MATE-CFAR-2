function [ mai_1, mai_2, mai_3, mai_4 ] = lw_alg_ideal_moments( a,b )
% LW_ALG_MOMENTS Computes ideal algebraic moments Log-Weibull
% -------------------------------------------------------------------
%       a : scale parameter Log-Weibull                     (1 value)
%       b : shape parameter Log-Weibull                     (1 value)
%     ---   ---------------------------------------------------------
%   mai_1 : first ideal alg. moment Log-Weibull 	        (1 value)
%   mai_2 : second ideal alg. moment Log-Weibull            (1 value)
%   mai_3 : third ideal alg. moment Log-Weibull             (1 value)
%   mai_4 : fourth ideal alg. moment Log-Weibull            (1 value)
% -------   ------------------(example)------------------------------
% [ mai_1, mai_2, mai_3, mai_4 ] = lw_alg_ideal_moments( 1,3 );
% ----------------------------(example)------------------------------

% for clarification
n_1 = 1;
n_2 = 2;
n_3 = 3;
n_4 = 4;

% ideal (theoretical) algebraic moments
mai_1 = 1;
mai_2 = 2;
mai_3 = 3;
mai_4 = 4;

% initial values before looping
total  = 1;
total2 = 1;
total3 = 1;
total4 = 1;
for i=1:20 % computing alg. moments through iterative process
    new  = ((n_1^i)*(a^i)/factorial(i))*gamma(1+i/b);
    new2 = ((n_2^i)*(a^i)/factorial(i))*gamma(1+i/b);
    new3 = ((n_3^i)*(a^i)/factorial(i))*gamma(1+i/b);
    new4 = ((n_4^i)*(a^i)/factorial(i))*gamma(1+i/b);
    total = total + new;
    total2 = total2 + new2;
    total3 = total3 + new3;
    total4 = total4 + new4;
end

% updating outputs
mai_1 = total;
mai_2 = total2;
mai_3 = total3;
mai_4 = total4;

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