function [x, x_dot] = mountain_car(a, x, x_dot)

% a -> A = {-1, 0, 1} -> "jazda do ty³u", "luz" i "jazda do przodu"

x =	x +	x_dot ;
x_dot =	x_dot +	0.001 * a - 0.0025 * cos(3 * x);
