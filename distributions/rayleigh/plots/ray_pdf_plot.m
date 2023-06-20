function [  ] = ray_pdf_plot( )
%RAY_PDF_PLOT plots examples of PDF Rayleigh.
%---------------------------
%
%INICIATING VALUES-----------------------------------------------------
%  X1:  vector of x data
%  YMATRIX1:  matrix of y data
%
x1=0.01:0.01:8;
[m,n] = size(x1);
YMatrix1 = zeros(m,n);
YMatrix1(1,:)= ray_pdf(x1,0.5);
YMatrix1(2,:)= ray_pdf(x1,1);
YMatrix1(3,:)= ray_pdf(x1,2);
YMatrix1(4,:)= ray_pdf(x1,3);
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
set(plot1(1),'DisplayName','alfa = 0.5');
set(plot1(2),'DisplayName','alfa = 1');
set(plot1(3),'DisplayName','alfa = 2');
set(plot1(4),'DisplayName','alfa = 3');
%
% Create xlabel
xlabel('magnitudes of the variable');
%
% Create ylabel
ylabel({'Distribuci�n Rayleigh','(alfa)'});
%
% Create legend
legend1 = legend(axes1,'show');
set(legend1,'Location','NorthEast');
%

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