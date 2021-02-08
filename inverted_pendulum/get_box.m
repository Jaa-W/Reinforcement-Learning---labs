function [box] = get_box(x, x_dot, theta, theta_dot)

box	= 0;
if abs(x)>2.4,	
   box = -1;	
   return		% wczeœniejszy powrót z funkcji
end

if      x<-0.8,			box = 1 ;
elseif 	x< 0.8,			box = 2 ;
else                    box = 3 ;
end

if      x_dot<-0.5
elseif 	x_dot< 0.5,		box = box + 3 ;
else                    box = box + 6 ;
end

if      theta<-6.0
elseif 	theta<-1.0,			box = box + 9 ;
elseif 	theta< 0.0,			box = box + 18 ;
elseif 	theta< 1.0,			box = box + 27 ;
elseif 	theta< 6.0,			box = box + 36 ;
else                        box = box + 45 ;
end

if      theta_dot<-50
elseif 	theta_dot<-10,			box = box + 54 ;
elseif 	theta_dot< 10,			box = box + 108;
elseif 	theta_dot< 50,			box = box + 162 ;
else                            box = box + 216 ;

end