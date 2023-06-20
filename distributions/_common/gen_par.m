function [ b ] = gen_par( amount,rep,ini,step,inc )
% GEN_PAR Generates a row of parameters for any distribution
% ---------------------------------------------------------------
%   amount : amount of 'b' values                       (1 value)
%      rep : repetitions for each 'b' value             (1 value)
%      ini : start of the interval                      (1 value)
%     step : absolute increase between 'b's             (1 value)
%      inc : percentage increase between 'b's           (1 value)
%      ---   ----------------------------------------------------
%        b : generated 'b' (shape) values            (row vector)
% --------   ----------------(example)---------------------------
%  [ b ] = gen_par( 40,1,0.5,0,23 );
% ---------------------------(example)---------------------------

% --- initial
b = zeros(1,amount*rep);
value = ini;

% --- generating output 'b' array
for a_1 = 1:amount
    for r_1 = 1:rep
        pos = (a_1-1)*rep+r_1; % position in output array
        b(1,pos) = value;
    end
    value = value + step + value*inc/100; % increasing by using 'step' and 'inc'
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