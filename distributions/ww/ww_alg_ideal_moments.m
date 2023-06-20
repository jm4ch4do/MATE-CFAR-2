function [ mai_1, mai_2, mai_3, mai_4 ] = ww_alg_ideal_moments( mix, a1, b1, a2, b2 )
% WW_ALG_MOMENTS Computes ideal algebraic moments Weibull
% -------------------------------------------------------------------
%     mix : mixture parameter WW                            (1 value)
%      a1 : scale parameter WW dist 1                       (1 value)
%      b1 : shape parameter WW dist 1                       (1 value)
%      a2 : scale parameter WW dist 2                       (1 value)
%      b2 : shape parameter WW dist 2                       (1 value)
%     ---   ---------------------------------------------------------
%   mai_1 : first ideal alg. moment WW     	                (1 value)
%   mai_2 : second ideal alg. moment WW                     (1 value)
%   mai_3 : third ideal alg. moment WW                      (1 value)
%   mai_4 : fourth ideal alg. moment WW                     (1 value)
% -------   ------------------(example)------------------------------
% [ mai_1, mai_2, mai_3, mai_4 ] = ww_alg_ideal_moments( 0.5, 2, 0.5, 10, 20 );
% ----------------------------(example)------------------------------

% for clarification
n_1 = 1;
n_2 = 2;
n_3 = 3;
n_4 = 4;

% ideal (theoretical) algebraic moments
mai_1 = (1-mix)*(a1^n_1)*gamma(1+n_1/b1) + mix*(a2^n_1)*gamma(1+n_1/b2);
mai_2 = (1-mix)*(a1^n_2)*gamma(1+n_2/b1) + mix*(a2^n_2)*gamma(1+n_2/b2);
mai_3 = (1-mix)*(a1^n_3)*gamma(1+n_3/b1) + mix*(a2^n_3)*gamma(1+n_3/b2);
mai_4 = (1-mix)*(a1^n_4)*gamma(1+n_4/b1) + mix*(a2^n_4)*gamma(1+n_4/b2);

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