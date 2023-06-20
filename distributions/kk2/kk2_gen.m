function [ y ] = kk2_gen( amount, mix, c1, v1, c2, v2 )
% KK2_GEN Generates samples of the K-K2 distribution
% ----------------------------------------------------------
%   amount : amount of samples                     (1 value)
%      mix : mixture parameter KK2                 (1 value)
%       c1 : scale parameter KK2 dist 1            (1 value)
%       v1 : shape parameter KK2 dist 1            (1 value)
%       c2 : scale parameter KK2 dist 2            (1 value)
%       v2 : shape parameter KK2 dist 2            (1 value)
%      ---   -----------------------------------------------
%        y : generated samples KK2            (column vector)
% --------   -------------(example)-------------------------
% [ y ] = kk2_gen( 3000,0.5, 2, 0.5,10,20 );
% [ y ] = kk2_gen( 3000,0.5, 1, 3,2,2 );
% ------------------------(example)-------------------------

% initial
y = zeros(amount,1);

% looping
for m_1 = 1:amount
    u = rand(1,1); % generating uniform sample for K2 seed
    if rand(1,1)>mix % choose which K2 to generate
        y(m_1,1) = k2_gen( 1, c1, v1 ); % generate K2_1
    else
        y(m_1,1) = k2_gen( 1, c2, v2 ); % generate K2_2
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