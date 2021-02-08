clear all
close all
format short g

gamma           = 0.995;               % współczynnik dyskontowania
alpha           = 0.1;                 % współczynnik aktualizacji funkcji Q
beta            = 0.05;                % współczynnik aktualizacji funkcji r_srednia
lambda          = 0.9;                 % współczynnik świeżości funkcji Q


%% lambda

Q_lambda_learning

Q_lambda_proby = [proby ans(1)];
Q_lambda_czasy = [czasy ans(2)];

%% zero

Q_0_learning

Q_0_proby = [proby ans(1)];
Q_0_czasy = [czasy ans(2)];

%%
figure(1)
plot(Q_lambda_proby,Q_lambda_czasy,'r*-',...
    Q_0_proby,Q_0_czasy,'b-p');   
legend('Q(λ)-learning','Q(0)-learning');
title("Samochód wjeżdżający na wzniesienie (γ = var, α = 0.1, β = 0.05, λ = 0.9)");
%γ = 0.995, α = 0.1, β = 0.05, λ = 0.9
xlabel("próby");
ylabel("czas");