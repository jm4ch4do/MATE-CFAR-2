function [ y ] = gam_gen( amount, b, v )
% GAM_GEN Generates samples of the Gamma distribution
% ----------------------------------------------------------
%   amount : amount of samples                     (1 value)
%        b : scale parameter Gamma                 (1 value)
%        v : shape parameter Gamma                 (1 value)
%      ---   -----------------------------------------------
%        y : generated samples Gamma       (column vector)
% --------   -------------(example)-------------------------
% [ y ] = gam_gen( 3000, 1, 3 );
% ------------------------(example)-------------------------

% initial
y = zeros(amount,1);

% algorithm for generating Gamma samples 
for m_1 = 1:amount
    if v>=1
        D = v - 1/3;
        C = 1/sqrt(9*D);
        while 1
            U = rand;
            N = randn;
            V = (1+C*N)^3;
            value = 0.5*N^2+D-D*V+D*log(V);
            if V>0 && log(U)<value
                y(m_1,1) = D*V;
                break
            end
        end
    else 
        % iterative algorithm for v<1
        T = 0.07+0.75*sqrt(1-v);
        B = 1+exp(-T)*v/T;
        while 1
           U1 = rand;
           U2 = rand;
           V = B*U1;
           if V<=1
               S=T*V^(1/v);
               if U2<=(2-S)/(2+S) || U2<=exp(-S)
                   y(m_1,1) = S;
                   break
               end
           else
               S = -log(T*(B-V)/v);
               Y = S/T;
               if U2*(v+Y*(1-v))<1 || U2<=Y^(v-1)
                   y(m_1,1) = S;
                   break
               end
           end
        end
    end
    % incorporating the scale parameter
    y(m_1,1)= y(m_1,1)*1/b^2;
 
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