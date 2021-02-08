function [box] = get_box(x, x_dot, theta, theta_dot)

ONE_DEGREE      =	2  * pi / 360	;
SIX_DEGREES     =	6  * ONE_DEGREE ;
TWELVE_DEGREES	=	12 * ONE_DEGREE ;
FIFTY_DEGREES	=	50 * ONE_DEGREE ;

box	=	0 ;
if abs(x)>1 ,	
   box = -1;	
   return		% wczeœniejszy powrót z funkcji gdy kulka spadnie z pochylni
end ;

if      x<-0.5,			box = 1 ;
elseif 	x<-0.1,			box = 2 ;
elseif 	x< 0.1,			box = 3 ;
elseif 	x< 0.5,			box = 4 ;
else                    box = 5 ;
end ;

if      x_dot<-0.5,	;
elseif 	x_dot<-0.1,		box = box + 5 ;
elseif 	x_dot< 0.1,		box = box + 10 ;
elseif 	x_dot< 0.5,		box = box + 15 ;    
else                    box = box + 20 ;
end ;
