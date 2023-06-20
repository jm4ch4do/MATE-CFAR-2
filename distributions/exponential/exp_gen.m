function [ y ] = exp_gen( amount, sigma )
% EXP_GEN Generates samples of the Exponential distribution
% ---------------------------------------------------------------
%   amount : amount of samples                          (1 value)
%        s : scale parameter Exponential                (1 value)
%      ---   ----------------------------------------------------
%        y : generated samples Exponential        (column vector)
% --------   -------------(example)------------------------------
% [ y ] = exp_gen( 3000, 1 );
% ------------------------(example)------------------------------

% initial
y = zeros(amount,1);

% looping
for m_1 = 1:amount
    u=rand(1,1); % generating uniform samples
    y(m_1,1) = log(1-u)*(-2*sigma^2); % generating exponential samples
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