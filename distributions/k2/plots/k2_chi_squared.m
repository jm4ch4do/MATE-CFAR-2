function [ p ] = k2_chi_squared( amount,c,v,limit,step, p_size )
% K2_CHI_SQUARED Computes the 'p' values of the Chi-2 statistic test K2  
% --------------------------------------------------------------------
%     amount : amount of samples in the set                  (1 value)
%          c : scale parameter K2                            (1 value)
%          v : shape parameter K2                            (1 value)
%      limit : limit in the x axis                           (1 value)
%       step : length of the histogram bins                  (1 value) 
%     p_size : amount of 'p' values to be produced           (1 value)
%        ---   -------------------------------------------------------
%          p : resulting 'p' values                       (row vector)
% ----------   ----------------(example)------------------------------
% [ p ] = k2_chi_squared( 1000,1,3,5,0.1,100);
% -----------------------------(example)------------------------------

% --- initial
p = zeros(1,p_size);

% --- repetition of the procedure for every 'p' value requested
for p_1 = 1:p_size

    % calling the generation function K2
    y = k2_gen( amount, c, v );

    % computing observed values
    x = 0:step:limit;
    [obs,xout] = hist(y,x);
    [M,N] = size(obs);  % the last value tends to be too high
    obs(1,N)=obs(1,N-1); % so we force the last value to be equal to the previous one
    x1 = 0:step:limit;
    x1(1,1)= 0.00001; % making the first value different from 0
    ideal= k2_pdf(x1, c,v);
    
    % expected values for the ideal (theoretical) K distribution
    esp = ideal*amount*step;

    % computing variables requested for the MATLAB chi-2 function
    n = (limit)/step + 1;
    bins = 0:n-1;
    
    % the last �obs� tends to be too high
    obs(n) = obs(n-1);
    % the first �obs� tends to be different
    obs(1) = esp(1);
    % executing the Chi-2 function
    [h,p_new,st] = chi2gof(bins,'ctrs',bins,'frequency',obs,'expected',esp,'nparams',1);
    p(1,p_1) = p_new;
end

end


%  Copyright 2017 Jos� Ra�l Machado Fern�ndez.
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