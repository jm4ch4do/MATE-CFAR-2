function [ mar_1, mar_2, mar_3, mar_4 ] = ln_alg_real_moments( amount,u,s,sets )
% LN_ALG_MOMENTS Computes real (empirical) algebraic moments Log-Normal
% ----------------------------------------------------------------------
%  amount : amount of samples per set                          (1 value)
%       u : scale parameter Log-Normal                         (1 value)
%       s : scale parameter Log-Normal                         (1 value)
%    sets : amount of sets                                     (1 value)
%     ---   ------------------------------------------------------------
%   mar_1 : first real alg. moment Log-Normal               (row vector)
%   mar_2 : second real alg. moment Log-Normal              (row vector)
%   mar_3 : third real alg. moment Log-Normal               (row vector)
%   mar_4 : fourth real alg. moment Log-Normal              (row vector)
% -------   --------------------(example)-------------------------------
% [ mar_1, mar_2, mar_3, mar_4 ] = ln_alg_real_moments( 1000,1,0.5,100);
% ------------------------------(example)-------------------------------

% initial
mar_1 = zeros(1,sets);
mar_2 = zeros(1,sets);
mar_3 = zeros(1,sets);
mar_4 = zeros(1,sets);

% computing moments
for n_1 = 1:sets
	A = ln_gen(amount,u,s);
    mar_1(1,n_1) = (sum(A.^1))/amount;
    mar_2(1,n_1) = (sum(A.^2))/amount;
    mar_3(1,n_1) = (sum(A.^3))/amount;
    mar_4(1,n_1) = (sum(A.^4))/amount;
end

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