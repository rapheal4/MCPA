clearvars
clearvars -GLOBAL
close all
set(0,'DefaultFigureWindowStyle', 'docked')
global C

global Efield

global Vvector 

C.q_0 = 1.60217653e-19;             % electron charge
C.hb = 1.054571596e-34;             % Dirac constant
C.h = C.hb * 2 * pi;                    % Planck constant
C.m_0 = 9.10938215e-31;             % electron mass
C.kb = 1.3806504e-23;               % Boltzmann constant
C.eps_0 = 8.854187817e-12;          % vacuum permittivity
C.mu_0 = 1.2566370614e-6;           % vacuum permeability
C.c = 299792458;                    % speed of light
C.g = 9.80665;                      % metres (32.1740 ft) per s²


x = 0;

px = 0;
Vpx = 0;
V1 = 0;
vavgerage = 0;
Efield = 0.4e01;
Pd = 0.05; % Probability of electron deflection
tSimulation = 400;
% State variables
%Ne = 100; % Number of electroncs

%E_p = zeros(Ne, 1); % Electron position
%E_v = zeros(Ne, 1); % Electron velocity

dt = 1e-6; % Timestep



Vvector;
    
% Simulation loop
for i = 2:tSimulation
 % Calculate time step
 xx1=(C.q_0 * Efield)/(C.m_0 );
    V1 = Vpx + (xx1*(dt));
    x = px + Vpx*dt;
    
    T1 = i-1; % T1= --i
    T2 = i;
 
    % Scatter electrons
    Pscat = rand(1)*1;
    if(Pscat <= Pd) % or E_v(rand(,1) < Pd) = 0;
      
        V1 = 0;
    end
    
    % Calculate Drift velocity
    %Vvector = horzcat(Vvector,V1);
    Vvector = vertcat(Vvector,V1);
    %Vvector1 =[ Vvector;Vx];
    vavgerage = mean (Vvector);
      % plot position
    subplot(3,1,1) 
    plot ([T1 T2],[Vpx V1],'r');
    plot ([T1 T2],[vavgerage-1 vavgerage], 'g');
    %plot(repmat([T1 T2],[Vpx Vx]),'r');
    drawnow;
    xlabel('time');
    ylabel('velocity');
    legend(sprintf('The Drift Velocity = %0.5f',vavgerage));
    hold all
     % Plot velocity
    subplot(3,1,2)
    plot ([px x],[Vpx V1],'y');
    plot ( [px x],[vavgerage-1 vavgerage], 'g');
    drawnow;
    xlabel('position');
    ylabel('velocity');
    legend(sprintf('The Drift Velocity = %0.5f',vavgerage));
    hold on
    % Plot drift velocity
    subplot(3,1,3)
    plot ([T1 T2],[px x],'b');
    drawnow;
    xlabel('time');
    ylabel('position');
    hold on
    
    
    Vpx = V1;
    px = x;
    %display x;
%  
%   
    pause(0.01);
end


