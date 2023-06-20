function [ y ] = igm_gen( amount, b, a)
% IGM_GEN Generates samples of the InvGam distribution
% ----------------------------------------------------------
%   amount : amount of samples                     (1 value)
%        b : scale parameter InvGam                (1 value)
%        a : shape parameter InvGam                (1 value)
%      ---   -----------------------------------------------
%        y : generated samples InvGam        (column vector)
% --------   -------------(example)-------------------------
% [ y ] = igm_gen( 3000, 5, 5 );
% ------------------------(example)-------------------------

% initial
y = zeros(1,amount);

% using the generation function for the 'gamma' distribution
[ y ] = gam_gen( amount, sqrt(b), a );
y = 1./y;

% removing extra-precision
y = roundn(y,-5);

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