function [ m1,m2,m3,m4,S,K ] = igm_ideal_moments(  b, a )
% IGM_IDEAL_MOMENTS computes the ideal (theoretical) central moments InvGam
% -----------------------------------------------------------------
%     b : scale parameter InvGam                          (1 value)
%     a : shape parameter InvGam                          (1 value)
%   ---   ---------------------------------------------------------
%    m1 : first ideal central moment InvGam               (1 value)
%    m2 : second ideal central moment InvGam              (1 value)
%    m3 : third ideal central moment InvGam               (1 value)
%    m4 : fourth ideal central moment InvGam              (1 value)
%     S : Skewness ideal InvGam                           (1 value)
%     K : Kurtosis ideal InvGam                           (1 value)
% -----   -----------------(example)-------------------------------
% [ m1,m2,m3,m4,S,K ] = igm_ideal_moments( 5,5 );
% -------------------------(example)-------------------------------

% clarification
n_1 = 1;
n_2 = 2;
n_3 = 3;
n_4 = 4;

% computing algebraic moments, skewness and kurtosis
ma1 = b/(a-1);
m1 = ma1;
m2 = b^2/((a-2)*(a-1)^2);
S = 4*sqrt(a-2)/(a-3);
K = 3*(a+5)*(a-2)/((a-3)*(a-4));
m3 = S*m2^(3/2);
m4 = K*m2^2;

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