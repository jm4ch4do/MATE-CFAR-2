function [ samples_t, tp ] = add_targets( samples, freq, space, tar_ty , SNR,tar_par )
% ADD_TARGETS Add targets to a set of clutter samples
% -----------------------------------------------------------------------
%   samples : data with clutter samples                   (column vector)
%      freq : frequency of ocurrence of targets                 (1 value)
%     space : spaces (cells) with clutter between targets       (1 value)
%    tar_ty : type of target to be generated                    (1 value)
%       SNR : signal to noise ratio of targets                  (1 value)
%   tar_par : target parameter                                  (1 value)
% ---------   -----------------------------------------------------------
% samples_t : samples with added targets                  (column vector)
%        tp : target profile                              (column vector)
% ---------   ----------------(example)----------------------------------
% [ samples_t, tp ] = add_targets( [1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1]', 25, 2, 1 , 5,1);
% ----------------------------(example)----------------------------------

% --- initial
[m,n] = size(samples);
last_target = 0; % position of the last added target
ME = mean(samples);
tp = zeros(m,1);

% --- looping
for m_1 = 1:m
   if m_1-last_target > space
       if rand<freq/100
          last_target = m_1;
          tp(m_1) = 1;
          if tar_ty == 1 % Swerling V
              samples(m_1) = ME*SNR*1;
          elseif tar_ty == 2 % Swerling I (Rayleigh)
              m1 = tar_par*(sqrt(pi/2));
              samples(m_1) = ME*SNR*ray_gen( 1, tar_par )/m1;
          elseif tar_ty == 3 % Swerling III (Exponential)
              m1 = 2*tar_par^2;
              samples(m_1) = ME*SNR*exp_gen( 1, tar_par )/m1;
          end
      end
   end
end

samples_t = samples;

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