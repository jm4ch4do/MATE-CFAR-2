function [  ] = gam_pdf_plot2( )
%GAM_PDF_PLOT2 plots examples of PDF Gamma 2.
%---------------------------
%
%INICIATING VALUES-----------------------------------------------------
%  X1:  vector of x data
%  YMATRIX1:  matrix of y data
%
x1=0.1:0.1:20;
[m,n] = size(x1);
YMatrix1 = zeros(m,n);
YMatrix1(1,:)= gam_pdf(x1,1.3416,3);
YMatrix1(2,:)= gam_pdf(x1,1.0954,3);
YMatrix1(3,:)= gam_pdf(x1,0.8944,3);
YMatrix1(4,:)= gam_pdf(x1,0.6325,3);
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
%
% Create multiple lines using matrix input to plot
plot1 = plot(x1,YMatrix1,'Parent',axes1);
set(plot1(1),'DisplayName','b = 1.35  v=   3');
set(plot1(2),'DisplayName','b = 1.1   v=   3');
set(plot1(3),'DisplayName','b = 0.9   v=   3');
set(plot1(4),'DisplayName','b = 0.65  v=   3');
%
% Create xlabel
xlabel('magnitudes of the variable');
%
% Create ylabel
ylabel({'PDF Gamma','(b,v)'});
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