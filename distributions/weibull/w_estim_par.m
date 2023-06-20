function [ a_estim, b_estim ] = w_estim_par( samples, max_i)
% W_ESTIM_PAR Estimates the parameters Weibull
% -----------------------------------------------------------------------
%   samples : each column contains a dataset                  (vector 2D)
%     max_i : maximum number of iterations in the search        (1 value)
%       ---   -----------------------------------------------------------
%   a_estim : estimations of the scale parameter Weibull     (row vector)
%   b_estim : estimations of the shape parameter Weibull     (row vector)
% ---------   --------------------(example)------------------------------
% [ samples ] = w_gen_sets( 1000,ones(1,100),2*ones(1,100));
% [ a_estim, b_estim  ] = w_estim_par( samples,100);
% --------------------------------(example)------------------------------

% initial
[m,n] = size(samples);
a_estim = zeros(1,n);
b_estim = zeros(1,n);
ini = 0.5; % minimum possible value of 'b'
last = 10; % maximum possible value of 'b'
allowed = 0.001; % maximum error allowed in the binary search

% looping through every group of samples
for n_1 = 1:n
    mar_1 = (sum(samples(:,n_1).^1))/m; % computing algebraic moments
    mar_2 = (sum(samples(:,n_1).^2))/m;
    MI = mar_2/mar_1^2; % expression left to the equal
    up = last; % upper limit of the search interval
    down = ini; % lower limit of the serch interval
    dif = 10; % setting an initial high 'difference' value
    counter = 0; % setting the iteration counter to 0
    
    % binary search
    while dif > allowed
        bb = (up+down)/2;
        MD = gamma(2/bb+1)/(gamma(1/bb+1))^2; % expression right to the equal
        if MD > MI % we need to decrease 'MD'
            down = bb; % we increase 'bb' beacause the expression has a negative slope
        else
            up = bb;
        end
        counter = counter + 1;
        dif = abs(MD-MI);
        if counter == max_i
            break
        end
    end
    aa = mar_1/gamma(1+1/bb);
    a_estim(1,n_1) = aa;
    b_estim(1,n_1) = bb;
end

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