function [ y, obs , xout, prob_obs, ideal ] = gamr_gen_compare( amount, b, v, limit, step )
% GAMR_GEN_COMPARE Compares a histogram from samples with the ideal PDF Root-Gamma
% -------------------------------------------------------------------------------------
%    amount : amount of samples in the set                                    (1 value)
%         b : scale parameter Root-Gamma                                      (1 value)
%         v : shape parameter Root-Gamma                                      (1 value)
%     limit : limit in the x axis                                             (1 value)
%      step : length of the histogram bins                                    (1 value)
%       ---   -------------------------------------------------------------------------
%         y : generated samples Root-Gamma                              (column vector)
%       obs : observed values in every bin of the histogram                (row vector)
%      xout : limits of every bin                                          (row vector)
%  prob_obs : probability of observing samples in every bin                (row vector)
%     ideal : ideal plot of the distribution Root-Gamma                    (row vector)
%----------   ---------------------(example)-------------------------------------------
% [y,obs,xout,prob_obs, ideal] = gamr_gen_compare( 1000, 1, 3, 6, 0.1 );
% ---------------------------------(example)-------------------------------------------

% calling the generation function Root-Gamma  
y = gamr_gen( amount, b, v);

% computing observed values
x = 0:step:limit;
[obs,xout] = hist(y,x);

% transforming amount of observed values into probability of observing values
n = (limit/step) + 1;
prob_obs = zeros(1,n);
total = sum(obs);
for n_1 = 1:n
   prob_obs(1,n_1) = ( obs(1,n_1)/total )   /step; % expression deduced from the histogram
end


%--------------------------------------------------------------------------
%--------------------------------------------------------------------------
%PLOTTING THE RESULTS-----------------------------------------------------
%  X1:  vector of x data
%  YMATRIX1:  matrix of y data
%
x1 = 0:step:limit;
m=1; 
n=(limit)/step +1;
%---
YMatrix1 = zeros(m,n);
YMatrix1(1,:)= gamr_pdf(x1,b,v);
ideal = YMatrix1;
%
%CREATING FIGURE-------------------------------------------------------
%
% Create figure
figure1 = figure;
%
% Create axes
axes1 = axes('Parent',figure1);
box(axes1,'on');
hold(axes1,'all');
%
% Create multiple lines using matrix input to plot
plot1 = plot(x1,YMatrix1,'Parent',axes1);

str1 = num2str(b);
str2 = num2str(v);
out = ['b=' str1 '   v= ' str2];
set(plot1(1),'DisplayName',out);

%
% Create xlabel
xlabel('magnitudes of the variable');
%
% Create ylabel
ylabel({'PDF Root-Gamma','(b,v)'});
%
% Create legend
legend1 = legend(axes1,'show');
set(legend1,'Location','NorthEast');

%----------------------------------------------------------------------

% Including the histogram from samples in the same plot
plot(xout,prob_obs,'DisplayName','prob_obs vs. xout','XDataSource','xout','YDataSource','prob_obs');figure(gcf)

%----------------------------------------------------------------------

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