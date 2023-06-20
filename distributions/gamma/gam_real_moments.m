function [ me,va,skew,kurt ] = gam_real_moments( amount,b,v,sets )
% GAM_REAL_MOMENTS computes the real (empirical) moments Gamma
% -------------------------------------------------------------------
%  amount : amount of samples per set                       (1 value)
%       b : scale parameter Gamma                           (1 value)
%       v : shape parameter Gamma                           (1 value)
%    sets : amount of sets                                  (1 value)
%     ---   ---------------------------------------------------------
%      me : first real moment Gamma                      (row vector)
%      va : second real moment Gamma                     (row vector)
%    skew : third real moment Gamma                      (row vector)
%    kurt : fourth real moment Gamma                     (row vector)
% -------   -------------------(example)-----------------------------
% [ me,va,skew,kurt ] = gam_real_moments( 1000,1,3,100 );
% -----------------------------(example)-----------------------------

% initial
me = zeros(1,sets);
va = zeros(1,sets);
skew = zeros(1,sets);
kurt = zeros(1,sets);

% computing moments
for n_1 = 1:sets
   A = gam_gen(amount,b,v);
   me(1,n_1) = mean(A);
   va(1,n_1) = var(A);
   skew(1,n_1) = skewness(A);
   kurt(1,n_1) = kurtosis(A);
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