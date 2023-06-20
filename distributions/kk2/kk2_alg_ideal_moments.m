function [ mai_1, mai_2, mai_3, mai_4 ] = kk2_alg_ideal_moments( mix, c1, v1, c2, v2 )
% KK2_ALG_MOMENTS Computes ideal algebraic moments K-K2
% -------------------------------------------------------------------
%     mix : mixture parameter KK2                           (1 value)
%      c1 : scale parameter KK2 dist 1                      (1 value)
%      v1 : shape parameter KK2 dist 1                      (1 value)
%      c2 : scale parameter KK2 dist 2                      (1 value)
%      v2 : shape parameter KK2 dist 2                      (1 value)
%     ---   ---------------------------------------------------------
%   mai_1 : first ideal alg. moment KK2                     (1 value)
%   mai_2 : second ideal alg. moment KK2                    (1 value)
%   mai_3 : third ideal alg. moment KK2                     (1 value)
%   mai_4 : fourth ideal alg. moment KK2                    (1 value)
% -------   ------------------(example)------------------------------
% [ mai_1, mai_2, mai_3, mai_4 ] = kk2_alg_ideal_moments( 0.5, 2, 0.5, 10, 20 );
% ----------------------------(example)------------------------------

% for clarification
n_1 = 1;
n_2 = 2;
n_3 = 3;
n_4 = 4;

% ideal (theoretical) algebraic moments
mai_1 = (1-mix)*(1/c1^(2*n_1))*gamma(v1+n_1)*gamma(n_1+1)/gamma(v1) + (mix)*(1/c2^(2*n_1))*gamma(v2+n_1)*gamma(n_1+1)/gamma(v2);
mai_2 = (1-mix)*(1/c1^(2*n_2))*gamma(v1+n_2)*gamma(n_2+1)/gamma(v1) + (mix)*(1/c2^(2*n_2))*gamma(v2+n_2)*gamma(n_2+1)/gamma(v2);
mai_3 = (1-mix)*(1/c1^(2*n_3))*gamma(v1+n_3)*gamma(n_3+1)/gamma(v1) + (mix)*(1/c2^(2*n_3))*gamma(v2+n_3)*gamma(n_3+1)/gamma(v2);
mai_4 = (1-mix)*(1/c1^(2*n_4))*gamma(v1+n_4)*gamma(n_4+1)/gamma(v1) + (mix)*(1/c2^(2*n_4))*gamma(v2+n_4)*gamma(n_4+1)/gamma(v2);

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