function [ y ] = ig_gen( amount, u, l)
% IG_GEN Generates samples of the InvGaus distribution
% ----------------------------------------------------------
%   amount : amount of samples                     (1 value)
%        u : localization parameter InvGaus        (1 value)
%        l : scale parameter InvGaus               (1 value)
%      ---   -----------------------------------------------
%        y : generated samples InvGaus       (column vector)
% --------   -------------(example)-------------------------
% [ y ] = ig_gen( 3000, 1, 1 );
% ------------------------(example)-------------------------

% initial
y = zeros(amount,1);

% looping
for m_1 = 1:amount
    U=rand;
    N=randn;
    V=N^2;
    D=l/u;
    Y=1-0.5*((sqrt(V^2+4*D*V)-V)/D);
    if (1+Y)*U>1
        S=u/Y;
    else
        S=Y*u;
    end
    y(m_1,1) = S;
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