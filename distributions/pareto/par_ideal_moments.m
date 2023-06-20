function [ m1,m2,m3,m4,S,K ] = par_ideal_moments( a,b )
% PAR_IDEAL_MOMENTS computes the ideal (theoretical) central moments Pareto
% -----------------------------------------------------------------
%     a : shape parameter Pareto                          (1 value)
%     b : scale parameter Pareto                          (1 value)
%   ---   ---------------------------------------------------------
%    m1 : first ideal central moment Pareto               (1 value)
%    m2 : second ideal central moment Pareto              (1 value)
%    m3 : third ideal central moment Pareto               (1 value)
%    m4 : fourth ideal central moment Pareto              (1 value)
%     S : Skewness ideal Pareto                           (1 value)
%     K : Kurtosis ideal Pareto                           (1 value)
% -----   -----------------(example)-------------------------------
% [ m1,m2,m3,m4,S,K ] = par_ideal_moments( 5,5 );
% -------------------------(example)-------------------------------

% clarification
n_1 = 1;
n_2 = 2;
n_3 = 3;
n_4 = 4;

% computing algebraic moments
ma1 = a*(b)/(a-n_1);
ma2 = a*(b^n_2)/(a-n_2);
ma3 = a*(b^n_3)/(a-n_3);
ma4 = a*(b^n_4)/(a-n_4);
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