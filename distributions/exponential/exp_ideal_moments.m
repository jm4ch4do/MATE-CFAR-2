function [ m1,m2,m3,m4,S,K ] = exp_ideal_moments( s )
% EXP_IDEAL_MOMENTS computes the ideal (theoretical) central moments Exponential
% ------------------------------------------------------------------------------
%     s : scale parameter Exponential                                 (1 value)
%   ---   ----------------------------------------------------------------------
%    m1 : first ideal central moment Exponential                      (1 value)
%    m2 : second ideal central moment Exponential                     (1 value)
%    m3 : third ideal central moment Exponential                      (1 value)
%    m4 : fourth ideal central moment Exponential                     (1 value)
%     S : Skewness ideal Exponential                                  (1 value)
%     K : Kurtosis ideal Exponential                                  (1 value)
% -----   -----------------(example)--------------------------------------------
% [ m1,m2,m3,m4,S,K ] = exp_ideal_moments( 1 );
% -------------------------(example)--------------------------------------------

m1 = 2*s^2;
m2 = 4*s^4;
m3 = 2;
m4 = 9;

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