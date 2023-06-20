function [ p ] = ww_ks( amount,mix, a1, b1, a2, b2, p_size )
% WW_KS Computes the 'p' values of the K-S statistic test Weibull Weibull
% --------------------------------------------------------------------
%     amount : amount of samples in the set                  (1 value)
%        mix : parámetro índice de mezcla        			(1 valor)
%         a1 : parámetro de escala WW dist 1 				(1 valor)
%         b1 : parámetro de forma WW dist 1  				(1 valor)
%         a2 : parámetro de escala WW dist 2 				(1 valor)
%         b2 : parámetro de forma WW dist 2  				(1 valor)
%      limit : limit in the x axis                           (1 value)
%       step : length of the histogram bins                  (1 value) 
%     p_size : amount of 'p' values to be produced           (1 value)
%        ---   -------------------------------------------------------
%          p : resulting 'p' values                       (row vector)
% ----------   ----------------(example)------------------------------
% p = ww_ks( 1000,0.5,1,2,3,3,100);
% -----------------------------(example)------------------------------

p = zeros(1,p_size);
for p_1 = 1:p_size
    
    % calling the generation function Weibull
    test(:,1) = ww_gen( amount,mix,a1,b1, a2, b2 );
    test(:,2) = (ww_cdf((test(:,1))',mix,a1,b1,a2,b2))';
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