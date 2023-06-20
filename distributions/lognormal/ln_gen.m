function [ y ] = ln_gen( amount, u, s )
% LN_GEN Genera muestras de la distribución Log-Normal
% ----------------------------------------------------------
%   amount : cantidad de muestras               (1 valor)
%        u : parámetro de escala Log-Normal     (1 valor)
%        s : parámetro de forma Log-Normal      (1 valor)
%      ---   -----------------------------------------------
%        y : muestras Log-Normal         (vector columna)
% --------   -----------------------------------------------
% [ y ] = ln_gen( 3000, 1, 0.5 );
% ----------------------------------------------------------

% initial
y = zeros(amount,1);

% looping
for m_1 = 1:amount
    valid = 0;
    while valid ==0
        uu = rand(1,1); % generating uniform samples
        y(m_1,1) = exp(u+sqrt(2)*s*erfinv(2*uu-1)); % generating log-normal samples
        
        % removing values higher than 1000
        if y(m_1,1)<1000 
            valid=1; % the LN distribution may produce extremely high values for certain parameters combination
        end          
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