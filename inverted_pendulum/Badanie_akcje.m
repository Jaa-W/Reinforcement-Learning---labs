clear all
close all
format short g

gamma           = 0.995;               % współczynnik dyskontowania
alpha           = 0.1;                 % współczynnik aktualizacji funkcji Q
beta            = 0.05;                % współczynnik aktualizacji funkcji r_srednia
lambda          = 0.9;                 % współczynnik świeżości funkcji Q

A=[-10; 10];
Q_lambda_learning

A=[-10; -5; 0; 5; 10];
Q_lambda_learning
