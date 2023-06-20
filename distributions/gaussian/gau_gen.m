function [ y ] = gau_gen( amount, u, s )
% GAU_GEN Generates samples of the Gaussian distribution
% ----------------------------------------------------------
%   amount : amount of samples                     (1 value)
%        u : location parameter Gaussian           (1 value)
%        k : scale parameter Gaussian              (1 value)
%      ---   -----------------------------------------------
%        y : generated samples Gaussian      (column vector)
% --------   -------------(example)-------------------------
% [ y ] = gau_gen( 3000, 3, 1 );
% ------------------------(example)-------------------------

% initial
y = zeros(amount,1);
flag = 0;

% looping
for m_1 = 1:amount
    if flag==0;
        u1=rand(1,1); % generating uniform samples
        u2=rand(1,1); % generating uniform samples
        X = cos(2*pi*u1)*sqrt(-2*log(u2)); % generating gaussian samples with cos
        y(m_1,1) = X*s+u;
        flag=1;
    else
        X = cos(2*pi*u1)*sqrt(-2*log(u2)); % generating gaussian samples with sen
        y(m_1,1) = X*s+u;
        flag=0;
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