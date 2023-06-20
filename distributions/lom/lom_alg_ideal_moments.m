function [ mai_1, mai_2, mai_3, mai_4 ] = lom_alg_ideal_moments( b, a )
% LOM_ALG_MOMENTS Computes ideal algebraic moments Lomax 
% ----------------------------------------------------------------
%       b : scale parameter Lomax                           (1 value)
%       a : shape parameter Lomax                           (1 value)
%     ---   ---------------------------------------------------------
%   mai_1 : first ideal alg. moment Lomax      	            (1 value)
%   mai_2 : second ideal alg. moment Lomax                  (1 value)
%   mai_3 : third ideal alg. moment Lomax                   (1 value)
%   mai_4 : fourth ideal alg. moment Lomax                  (1 value)
% -------   ------------------(example)------------------------------
% [ mai_1, mai_2, mai_3, mai_4 ] = lom_alg_ideal_moments( 5,5 );
% ----------------------------(example)------------------------------

% for clarification
n_1 = 1;
n_2 = 2;
n_3 = 3;
n_4 = 4;

% ideal (theoretical) algebraic moments
mai_1 = a*b^n_1*gamma(n_1+1)*gamma(a-n_1)/gamma(a+1);
mai_2 = a*b^n_2*gamma(n_2+1)*gamma(a-n_2)/gamma(a+1);
mai_3 = a*b^n_3*gamma(n_3+1)*gamma(a-n_3)/gamma(a+1);
mai_4 = a*b^n_4*gamma(n_4+1)*gamma(a-n_4)/gamma(a+1);

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