function [ y ] = k2_gen( amount, c, v )
% K2_GEN Generates samples of the K2 distribution
% ----------------------------------------------------------
%   amount : amount of samples                     (1 value)
%        c : scale parameter K2                    (1 value)
%        v : shape parameter K2                    (1 value)
%      ---   -----------------------------------------------
%        y : generated samples K2            (column vector)
% --------   -------------(example)-------------------------
% [ y ] = k2_gen( 3000, 1, 3 );
% ------------------------(example)-------------------------

% initial
y = zeros(amount,1);

% looping
for m_1 = 1:amount
    b = 2*c/sqrt(pi); % find Gamma scale parameter
    g = gam_gen(1,b,v); % generate Gamma sample
    sigma = sqrt((g)*(2/pi)); % find Exponential parameter using the Gamma variable
    k = exp_gen(1,sigma) ; % generate the K sample using the Exponential PDF
    while k == 0  % avoiding the generation of values = 0
        g = gam_gen(1,b,v); % generate Gamma sample
        sigma = sqrt((g)*(2/pi)); % find Exponential parameter using the Gamma variable
        k = exp_gen(1,sigma) ; % generate the K sample using the Exponential PDF
    end
      
    y(m_1,1) = k;
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