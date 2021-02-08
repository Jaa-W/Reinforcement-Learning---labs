function [box] = get_box(x, x_dot)

box	=	0 ;
% if abs(x)>1 ,	
%    box = -1;	
%    return		% wczeœniejszy powrót z funkcji gdy kulka spadnie z pochylni
% end ;

if (x>=-1.2 && x<-0.86)       box = 1;
elseif (x>=-0.86 && x<-0.52)  box = 2;
elseif (x>=-0.52 && x<-0.18)  box = 3;
elseif (x>=-0.18 && x<-0.16)  box = 4;
elseif (x>=-0.16 && x<=0.5)   box = 5;
end

if (x_dot>=-0.07 && x_dot<-0.042)       ;
elseif (x_dot>=-0.042 && x_dot<-0.014)  box = box + 5;
elseif (x_dot>=-0.014 && x_dot<0.014)   box = box + 10;
elseif (x_dot>=0.014 && x_dot<0.042)    box = box + 15;
elseif (x_dot>=0.042 && x_dot<=0.07)    box = box + 20;
end
