clear all
close all
format short g

gamma           = 0.995;               % współczynnik dyskontowania
alpha           = 0.1;                 % współczynnik aktualizacji funkcji Q
beta            = 0.05;                % współczynnik aktualizacji funkcji r_srednia
lambda          = 0.9;                 % współczynnik świeżości funkcji Q

A=[-pi/4;   -pi/8;  0;  pi/8;   pi/4];
Q_lambda_learning

A=[-pi/4; -pi/6;  -pi/8;  0;  pi/8; pi/6; pi/4];
Q_lambda_learning
