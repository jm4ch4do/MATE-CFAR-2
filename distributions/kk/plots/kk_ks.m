function [ p ] = kk_ks( amount,mix, c1, v1, c2, v2, p_size )
% KK_KS Computes the 'p' values of the K-S statistic test K-K
% --------------------------------------------------------------------
%     amount : amount of samples in the set                  (1 value)
%        mix : parámetro índice de mezcla        			 (1 value)
%         c1 : parámetro de escala KK dist 1 				 (1 value)
%         v1 : parámetro de forma KK dist 1  				 (1 value)
%         c2 : parámetro de escala KK dist 2 				 (1 value)
%         v2 : parámetro de forma KK dist 2  				 (1 value)
%      limit : limit in the x axis                           (1 value)
%       step : length of the histogram bins                  (1 value) 
%     p_size : amount of 'p' values to be produced           (1 value)
%        ---   -------------------------------------------------------
%          p : resulting 'p' values                       (row vector)
% ----------   ----------------(example)------------------------------
% p = kk_ks( 1000,0.5,1,2,3,3,100);
% -----------------------------(example)------------------------------

p = zeros(1,p_size);
for p_1 = 1:p_size
    
    % calling the generation function K
    test(:,1) = kk_gen( amount,mix,c1,v1, c2, v2 );
    test(:,2) = (kk_cdf((test(:,1))',mix,c1,v1,c2,v2))';
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