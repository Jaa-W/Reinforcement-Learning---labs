function [x, x_dot, theta, theta_dot] = pendulum(action, x, x_dot, theta, theta_dot)

%parameters for simulation
GRAVITY				=	9.8 ;
MASSCART			=	1.0 ;
MASSPOLE			=	0.1 ;
TOTAL_MASS			=	MASSCART + MASSPOLE ;
LENGTH				=	0.5 ;
POLEMASS_LENGTH     =	MASSPOLE * LENGTH ;
FORCE_MAG			=	10.0 ;
TAU					=	0.02 ;	% SECONDS BETWEEN STATE UPDATES
FOURTHIRDS			=	4/3	;

if action>0
   force = FORCE_MAG;
else
   force = -FORCE_MAG;
end

costheta = cos(theta) ;
sintheta = sin(theta) ;

temp        =	(force + POLEMASS_LENGTH * theta_dot * theta_dot * sintheta) / TOTAL_MASS ;
thetaacc    = 	(GRAVITY * sintheta - costheta * temp) / ...
					(LENGTH * ( FOURTHIRDS - MASSPOLE * costheta * costheta / TOTAL_MASS)) ;
xacc        =	temp - POLEMASS_LENGTH * thetaacc * costheta /TOTAL_MASS ;

% Update the four state variable using Euler's method.
x				=	x				+	TAU	*	x_dot ;
x_dot			=	x_dot			+	TAU	*	xacc ;
theta			=	theta			+	TAU	*	theta_dot ;
theta_dot       =	theta_dot       +	TAU	*	thetaacc ;

