function [ y ] = gamr_gen( amount, b, v )
% GAMR_GEN Generates samples of the Root-Gamma distribution
% ----------------------------------------------------------
%   amount : amount of samples                     (1 value)
%        b : scale parameter Root-Gamma            (1 value)
%        v : shape parameter Root-Gamma            (1 value)
%      ---   -----------------------------------------------
%        y : generated samples Root-Gamma    (column vector)
% --------   -------------(example)-------------------------
% [ y ] = gamr_gen( 3000, 1, 3 );
% ------------------------(example)-------------------------

% initial
y = zeros(amount,1);

% using the Gamma generation function
GAM = gam_gen( amount, b, v );
y = sqrt(GAM);

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