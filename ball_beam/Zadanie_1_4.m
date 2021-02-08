clear all
close all
format short g

%% Globalne parametry
gamma           = 0.995;               % współczynnik dyskontowania
alpha           = 0.1;                 % współczynnik aktualizacji funkcji Q
beta            = 0.05;                % współczynnik aktualizacji funkcji r_srednia
lambda          = 0.9;                 % współczynnik świeżości funkcji Q

%%
Q_lambda_learning

Q_lambda_proby = [proby ans(1)];
Q_lambda_czasy = [czasy ans(2)];

%%
Q_0_learning

Q_0_proby = [proby ans(1)];
Q_0_czasy = [czasy ans(2)];

%%
R_lambda_learning

R_lambda_proby = [proby ans(1)];
R_lambda_czasy = [czasy ans(2)];

%%
R_0_learning

R_0_proby = [proby ans(1)];
R_0_czasy = [czasy ans(2)];

%%
AHC_lambda_learning

AHC_lambda_proby = [proby ans(1)];
AHC_lambda_czasy = [czasy ans(2)];

%%
AHC_0_learning

AHC_0_proby = [proby ans(1)];
AHC_0_czasy = [czasy ans(2)];

%%
figure(1)
plot(Q_lambda_proby,Q_lambda_czasy,'r*-',Q_0_proby,Q_0_czasy,'m-s',...
     R_lambda_proby,R_lambda_czasy,'y-o',R_0_proby,R_0_czasy,'c-p',...
     AHC_lambda_proby,AHC_lambda_czasy,'b-<',AHC_0_proby,AHC_0_czasy,'g-d');   
legend('Q(λ)-learning','Q(0)-learning','R(λ)-learning','R(0)-learning','AHC(λ)-learning','AHC(0)-learning');
title("Kulka balansująca na równoważni (γ = 0.995, α = 0.1, β = 0.05, λ = 0.9)");
xlabel("próby");
ylabel("czas");