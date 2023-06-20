function [ m1,m2,m3,m4,S,K ] = ww_ideal_moments( mix, a1, b1, a2, b2 )
% WW_IDEAL_MOMENTS computes the ideal (theoretical) central moments WW
% -----------------------------------------------------------------
%      mix : mixture parameter WW                         (1 value)
%       a1 : scale parameter WW dist 1                    (1 value)
%       b1 : shape parameter WW dist 1                    (1 value)
%       a2 : scale parameter WW dist 2                    (1 value)
%       b2 : shape parameter WW dist 2                    (1 value)
%      ---   ------------------------------------------------------
%       m1 : first ideal central moment WW                (1 value)
%       m2 : second ideal central moment WW               (1 value)
%       m3 : third ideal central moment WW                (1 value)
%       m4 : fourth ideal central moment WW               (1 value)
%        S : Skewness ideal WW                            (1 value)
%        K : Kurtosis ideal WW                            (1 value)
% -----   -----------------(example)-------------------------------
% [ m1,m2,m3,m4,S,K ] = ww_ideal_moments( 0.5, 2, 0.5, 10, 20 );
% -------------------------(example)-------------------------------

% clarification
n_1 = 1;
n_2 = 2;
n_3 = 3;
n_4 = 4;

% computing algebraic moments
ma1 = (1-mix)*(a1^n_1)*gamma(1+n_1/b1) + mix*(a2^n_1)*gamma(1+n_1/b2);
ma2 = (1-mix)*(a1^n_2)*gamma(1+n_2/b1) + mix*(a2^n_2)*gamma(1+n_2/b2);
ma3 = (1-mix)*(a1^n_3)*gamma(1+n_3/b1) + mix*(a2^n_3)*gamma(1+n_3/b2);
ma4 = (1-mix)*(a1^n_4)*gamma(1+n_4/b1) + mix*(a2^n_4)*gamma(1+n_4/b2);
u = ma1; % mean
m1 = ma1;

% computing central moments from algebraic moments
m2 =  (u^2)  -  (2*u  *ma1)    +  (        ma2);
m3 = -(u^3)  +  (3*(u^2)*ma1)  -  (3*u    *ma2)  +  (    ma3);
m4 =  (u^4)  -  (4*(u^3)*ma1)  +  (6*(u^2)*ma2)  -  (4*u*ma3)  +  (ma4);

% skewness and kurtosis
S = m3/(sqrt(m2)^3);
K = m4/(m2^2);

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