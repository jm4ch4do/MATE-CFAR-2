function [ mai_1, mai_2, mai_3, mai_4 ] = ig_alg_ideal_moments( u, l )
% IG_ALG_MOMENTS Computes ideal algebraic moments InvGaus
% -------------------------------------------------------------------
%       u : localization parameter InvGaus                  (1 value)
%       l : scale parameter InvGaus                         (1 value)
%     ---   ---------------------------------------------------------
%   mai_1 : first ideal alg. moment InvGaus     	        (1 value)
%   mai_2 : second ideal alg. moment InvGaus                (1 value)
%   mai_3 : third ideal alg. moment InvGaus                 (1 value)
%   mai_4 : fourth ideal alg. moment InvGaus                (1 value)
% -------   ------------------(example)------------------------------
% [ mai_1, mai_2, mai_3, mai_4 ] = ig_alg_ideal_moments( 1,1 );
% ----------------------------(example)------------------------------

% for clarification
n_1 = 1;
n_2 = 2;
n_3 = 3;
n_4 = 4;

% ideal (theoretical) algebraic moments
mai_1 = u;
mai_2 = u^2*(l+u)/l;
mai_3 = u^3*(l^2+3*l*u+3*u^2)/l^2;
mai_4 = exp(l/u)*sqrt(2*l/pi)*u^(4-1/2)*besselk(1/2-4,l/u) ;

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