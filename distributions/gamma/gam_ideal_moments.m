function [ m1,m2,m3,m4,S,K ] = gam_ideal_moments( b,v )
% GAM_IDEAL_MOMENTS computes the ideal (theoretical) central moments Gamma
% -----------------------------------------------------------------
%     b : scale parameter Gamma                         (1 value)
%     v : shape parameter Gamma                         (1 value)
%   ---   ---------------------------------------------------------
%    m1 : first ideal central moment Gamma              (1 value)
%    m2 : second ideal central moment Gamma             (1 value)
%    m3 : third ideal central moment Gamma              (1 value)
%    m4 : fourth ideal central moment Gamma             (1 value)
%     S : Skewness ideal Gamma                          (1 value)
%     K : Kurtosis ideal Gamma                          (1 value)
% -----   -----------------(example)-------------------------------
% [ m1,m2,m3,m4,S,K ] = gam_ideal_moments( 1,3 );
% -------------------------(example)-------------------------------

% computing central moments
m1 = v/(b^2);
m2 = v/(b^4);
m3 = 2*v/b^6;
m4 = 3*v*(2+v)/b^8;
S = 2/sqrt(v);
K = 3*(2+v)/v;

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