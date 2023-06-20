function [ y ] = ww_gen( amount, mix, a1, b1, a2, b2 )
% WW_GEN Generates samples of the Weibull-Weibull distribution
% ----------------------------------------------------------
%   amount : amount of samples                     (1 value)
%      mix : mixture parameter WW                  (1 value)
%       a1 : scale parameter WW dist 1             (1 value)
%       b1 : shape parameter WW dist 1             (1 value)
%       a2 : scale parameter WW dist 2             (1 value)
%       b2 : shape parameter WW dist 2             (1 value)
%      ---   -----------------------------------------------
%        y : generated samples WW            (column vector)
% --------   -------------(example)-------------------------
% [ y ] = ww_gen( 3000,0.5, 2, 0.5,10,20 );
% [ y ] = ww_gen( 3000,0.5, 1, 3,2,2 );
% ------------------------(example)-------------------------

% initial
y = zeros(amount,1);

% looping
for m_1 = 1:amount
    u=rand(1,1); % generating uniform sample for Weibull seed
    if rand(1,1)>mix % choose which Weibull to generate
        y(m_1,1) = a1*(-log(1-u))^(1/b1); % generate W1
    else
        y(m_1,1) = a2*(-log(1-u))^(1/b2); % generate W2
    end
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