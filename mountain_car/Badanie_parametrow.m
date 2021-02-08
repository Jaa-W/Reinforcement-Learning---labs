clear all
close all
format short g

%% Standardowe
gamma           = 0.995;               % współczynnik dyskontowania
alpha           = 0.1;                 % współczynnik aktualizacji funkcji Q
beta            = 0.05;                % współczynnik aktualizacji funkcji r_srednia
lambda          = 0.9;                 % współczynnik świeżości funkcji Q


Q_lambda_learning

Q_lambda_proby = [proby ans(1)];
Q_lambda_czasy = [czasy ans(2)];

%% Zmienione
gamma           = 0.995;               % współczynnik dyskontowania
alpha           = 0.1;                 % współczynnik aktualizacji funkcji Q
beta            = 0.05;                % współczynnik aktualizacji funkcji r_srednia
lambda          = 0.9;                 % współczynnik świeżości funkcji Q

Q_lambda_learning

Q_lambda_proby_2 = [proby ans(1)];
Q_lambda_czasy_2 = [czasy ans(2)];

%%
figure(1)
plot(Q_lambda_proby,Q_lambda_czasy,'r*-',Q_lambda_proby_2,Q_lambda_czasy_2,'b-s');   
legend('Q(λ)-learning α = 0.1','Q(λ)-learning α = 0.1');
title("Wahadło odwrócone (γ = 0.995, α = 0.1, β = 0.05, λ = 0.9)");
%γ = 0.995, α = 0.1, β = 0.05, λ = 0.9
xlabel("próby");
ylabel("czas");