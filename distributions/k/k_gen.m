function [ y ] = k_gen( amount, c, v )
% K_GEN Generates samples of the K distribution
% ----------------------------------------------------------
%   amount : amount of samples                     (1 value)
%        c : scale parameter K                     (1 value)
%        v : shape parameter K                     (1 value)
%      ---   -----------------------------------------------
%        y : generated samples K             (column vector)
% --------   -------------(example)-------------------------
% [ y ] = k_gen( 3000, 1, 3 );
% ------------------------(example)-------------------------

% initial
y = zeros(amount,1);

% looping
for m_1 = 1:amount
    b = 2*c/sqrt(pi); % find Root-Gamma scale parameter
    g = gamr_gen(1,b,v); % generate Root-Gamma sample
    alfa = sqrt( (g^2)*(2/pi) ); % find Rayleigh parameter using the Root-Gamma variable
    k = ray_gen(1,alfa) ; % generate the K sample using the Rayleigh PDF 
    while k == 0 % avoiding the generation of values = 0 
       g = gamr_gen(1,b,v); % generate Root-Gamma sample
       alfa = sqrt( (g^2)*(2/pi) ); % find Rayleigh parameter using the Root-Gamma variable
       k = ray_gen(1,alfa) ; % generate the K sample using the Rayleigh PDF
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