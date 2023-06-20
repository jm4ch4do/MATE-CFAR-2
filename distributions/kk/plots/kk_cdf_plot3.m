function [  ] = kk_cdf_plot3( )
%KK_CDF_PLOT3 plots examples of CDF K-K 3.
%---------------------------
%
%INICIATING VALUES-----------------------------------------------------
%  X1:  vector of x data
%  YMATRIX1:  matrix of y data
%
x1=0.01:0.01:2;
[m,n] = size(x1);
YMatrix1 = zeros(m,n);
YMatrix1(1,:)= kk_cdf(x1,  0, 2, 0.5, 10, 20);
YMatrix1(2,:)= kk_cdf(x1,0.3, 2, 0.5, 10, 20);
YMatrix1(3,:)= kk_cdf(x1,0.7, 2, 0.5, 10, 20);
YMatrix1(4,:)= kk_cdf(x1,  1, 2, 0.5, 10, 20);
%
%----------------------------------------------------------------------
%CREATING FIGURE-------------------------------------------------------
%
% Create figure
figure1 = figure;
%
% Create axes
axes1 = axes('Parent',figure1);
box(axes1,'on');
hold(axes1,'all');
%grid;
%
% Create multiple lines using matrix input to plot
plot1 = plot(x1,YMatrix1,'Parent',axes1);
set(plot1(1),'DisplayName','mix =   0   c1 = 2   v1= 0.5   c2 = 10   v2 = 20');
set(plot1(2),'DisplayName','mix = 0.3   c1 = 2   v1= 0.5   c2 = 10   v2 = 20');
set(plot1(3),'DisplayName','mix = 0.7   c1 = 2   v1= 0.5   c2 = 10   v2 = 20');
set(plot1(4),'DisplayName','mix =   1   c1 = 2   v1= 0.5   c2 = 10   v2 = 20');
%
% Create xlabel
xlabel('magnitudes of the variable');
%
% Create ylabel
ylabel({'CDF K-K','(mix,c1,v1,c2,v2)'});
%
% Create legend
legend1 = legend(axes1,'show');
set(legend1,'Location','NorthEast');
%
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