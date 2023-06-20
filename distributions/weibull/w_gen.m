function [ y ] = w_gen( amount, a, b )
% W_GEN Generates samples of the Weibull distribution
% ----------------------------------------------------------
%   amount : amount of samples                     (1 value)
%        a : scale parameter Weibull               (1 value)
%        b : shape parameter Weibull               (1 value)
%      ---   -----------------------------------------------
%        y : generated samples Weibull       (column vector)
% --------   -------------(example)-------------------------
% [ y ] = w_gen( 3000, 1, 2 );
% ------------------------(example)-------------------------

% initial
y = zeros(amount,1);

% looping
for m_1 = 1:amount
    u=rand(1,1); % generating uniform samples
    y(m_1,1) = a*(-log(1-u))^(1/b); % generating weibull samples
end

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