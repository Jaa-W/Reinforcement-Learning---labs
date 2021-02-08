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
gamma           = 0.995;                 % współczynnik dyskontowania
alpha           = 0.1;                 % współczynnik aktualizacji funkcji Q
beta            = 0.05;                % współczynnik aktualizacji funkcji r_srednia
lambda          = 0.99;                 % współczynnik świeżości funkcji Q

Q_lambda_learning

Q_lambda_proby_2 = [proby ans(1)];
Q_lambda_czasy_2 = [czasy ans(2)];

%% Standardowe
gamma           = 0.995;               % współczynnik dyskontowania
alpha           = 0.1;                 % współczynnik aktualizacji funkcji Q
beta            = 0.05;                % współczynnik aktualizacji funkcji r_srednia
lambda          = 0.9;                 % współczynnik świeżości funkcji Q

R_lambda_learning

R_lambda_proby = [proby ans(1)];
R_lambda_czasy = [czasy ans(2)];

%% Zmienione
gamma           = 0.995;                 % współczynnik dyskontowania
alpha           = 0.1;                 % współczynnik aktualizacji funkcji Q
beta            = 0.05;                % współczynnik aktualizacji funkcji r_srednia
lambda          = 0.99;                 % współczynnik świeżości funkcji Q

R_lambda_learning

R_lambda_proby_2 = [proby ans(1)];
R_lambda_czasy_2 = [czasy ans(2)];
%% Standardowe
gamma           = 0.995;               % współczynnik dyskontowania
alpha           = 0.1;                 % współczynnik aktualizacji funkcji Q
beta            = 0.05;                % współczynnik aktualizacji funkcji r_srednia
lambda          = 0.9;                 % współczynnik świeżości funkcji Q

AHC_lambda_learning

AHC_lambda_proby = [proby ans(1)];
AHC_lambda_czasy = [czasy ans(2)];

%% Zmienione
gamma           = 0.995;                 % współczynnik dyskontowania
alpha           = 0.1;                 % współczynnik aktualizacji funkcji Q
beta            = 0.05;                % współczynnik aktualizacji funkcji r_srednia
lambda          = 0.99;                 % współczynnik świeżości funkcji Q

AHC_lambda_learning

AHC_lambda_proby_2 = [proby ans(1)];
AHC_lambda_czasy_2 = [czasy ans(2)];

%%
figure(1)
plot(Q_lambda_proby,Q_lambda_czasy,'r*-',Q_lambda_proby_2,Q_lambda_czasy_2,'b-s',...
    R_lambda_proby,R_lambda_czasy,'m-o',R_lambda_proby_2,R_lambda_czasy_2,'c-p',...
    AHC_lambda_proby,AHC_lambda_czasy,'g-d',AHC_lambda_proby_2,AHC_lambda_czasy_2,'y-^');   
legend('Q(λ)-learning λ = 0.9','Q(λ)-learning λ = 0.99',...
    'R(λ)-learning λ = 0.9','R(λ)-learning λ = 0.99',...
    'AHC(λ)-learning λ = 0.9','AHC(λ)-learning λ = 0.99');
title("Kulka balansująca na równoważni (γ = 0.995, α = 0.1, β = 0.05, λ = var)");
%γ = 0.995, α = 0.1, β = 0.05, λ = 0.9
xlabel("próby");
ylabel("czas");