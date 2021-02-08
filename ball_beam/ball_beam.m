function [x, x_dot] = ball_beam(theta, x, x_dot)

%parameters for simulation
GRAVITY				=	9.8 ;
TAU				=	0.02 ;	% SECONDS BETWEEN STATE UPDATES

% Update the two state variable using Euler's method.
x	=	x				+	TAU	*	x_dot ;
x_dot	=	x_dot			+	TAU	*	GRAVITY * sin(theta) ;
