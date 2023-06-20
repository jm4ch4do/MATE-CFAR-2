function [ residuals ,res_pos, x_res_pos,res_neg, x_res_neg ] = pdf_residuals( model,data,xout )
% LW_RESIDUALS computes the residual between the ideal PDF and the data
% ------------------------------------------------------------------------------------------
%       model : ideal PDF       											    (row vector)
%        data : empirical PDF                                                   (row vector)
%        xout : x axis for both the 'model' and the 'data'                      (row vector)
%         ---   ----------------------------------------------------------------------------
%   residuals : residuals (diference between 'model' and 'data')                (row vector)
%     res_pos : positive residuals                                              (row vector)
%   x_res_pos : x axis for positive residuals                                   (row vector)
%     res_neg : negative residuals                                              (row vector)
%   x_res_neg : x axis for negative residuals                                   (row vector)
% -----------   ---------------------------(example)-----------------------------------------
% [y,obs,xout,prob_obs, ideal] = lw_gen_compare( 1000, 1, 3, 7, 0.1 );
% [ residuals ,res_pos, x_res_pos,res_neg, x_res_neg ] = pdf_residuals( ideal,prob_obs,xout );
% -----------------------------------------(example)------------------------------------------

% compute residuals
residuals = data - model;
[m,n] = size(residuals);

% suppressing 'Inf' or "NAN" values (this indicates isolated mistakes)
for n_1 = 1:n
    if(   isnan(residuals(n_1)) ||  isinf(residuals(n_1))  )
        residuals(n_1)=0;
    end
end

% --- selecting positive and negative residuals
%counting positive and negative residuals
size_res_pos = 0;
size_res_neg = 0;
for n_1 = 1:n
    if residuals(n_1)>0
        size_res_pos = size_res_pos + 1;
    else
        size_res_neg = size_res_neg + 1;
    end
end

% defining length of matrix
res_pos = zeros(1,size_res_pos);
x_res_pos = zeros(1,size_res_pos); % stores x values for which r>0
res_neg = zeros(1,size_res_neg);
x_res_neg = zeros(1,size_res_neg); % stores x values for which r<0


% filling matrix with positive and negative residuals
counter_res_pos = 0;
counter_res_neg = 0;
for n_1 = 1:n
    if residuals(n_1)>0
        counter_res_pos = counter_res_pos + 1;
        res_pos(counter_res_pos)   = residuals(n_1);
        x_res_pos(counter_res_pos) = xout(n_1);
    else
        counter_res_neg = counter_res_neg +1;
        res_neg(counter_res_neg)   = residuals(n_1);
        x_res_neg(counter_res_neg) = xout(n_1);
    end
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