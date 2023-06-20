function [ p ] = par_ks( amount,a, b, p_size )
% PAR_KS Computes the 'p' values of the K-S statistic test Pareto
% --------------------------------------------------------------------
%     amount : amount of samples in the set                  (1 value)
%          a : shape parameter Pareto     					 (1 value)
%          b : scale parameter Pareto                        (1 value)
%      limit : limit in the x axis                           (1 value)
%       step : length of the histogram bins                  (1 value) 
%     p_size : amount of 'p' values to be produced           (1 value)
%        ---   -------------------------------------------------------
%          p : resulting 'p' values                       (row vector)
% ----------   ----------------(example)------------------------------
% p = par_ks( 1000,2,2,100);
% -----------------------------(example)------------------------------

p = zeros(1,p_size);
for p_1 = 1:p_size
    
    % calling the generation function Pareto
    test(:,1) = par_gen( amount,a,b);
    test(:,2) = (par_cdf((test(:,1))',a,b))';
    [ h, p_new ] = kstest(test(:,1),'CDF',test);
    p(1,p_1) = p_new;
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