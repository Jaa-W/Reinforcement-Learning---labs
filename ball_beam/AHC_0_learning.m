% Q(lambda)-learning dla ball-beam
% clear all
% close all
% format short g

BOX_COUNT       = 25;
MAX_TIME        = 2000;                 % maksymalny czas eksperymentu w sekundach
MAX_PROBA       = 1000;                 % maksymalna liczba prob na dany zestaw wspó³czynników uczenia

A=[-pi/4;   -pi/8;  0;  pi/8;   pi/4];	% zbiór akcji

mi               = zeros(BOX_COUNT,length(A));   % funkcja wartoœci strategii
V                = ones(5,5);
                                          
% gamma           = 0.995;               % wspó³czynnik dyskontowania
% alpha           = 0.1;                 % wspó³czynnik aktualizacji funkcji mi
% beta            = 0.05;                 % wspó³czynnik aktualizacji funkcji V

%stan pocz¹tkowy ball_beam
x               = 0;        % pocz¹tkowe po³o¿enie wózka
x_dot           = 0;        % pocz¹tkowa prêdkoœæ wózka

nextbox = get_box(x, x_dot);
krok = 1;
proba = 1;
czas = 0;
maxczas = 0.02;
proby = [];
czasy = [];

while czas < MAX_TIME,
    % dyskretyzacja aktualnego stanu
	box = nextbox;
        [maxMi, sizeMi] = max(mi(box, :));
        %wyznacz zbiory akcji optymalnych i nieoptymalnych
        akcje_opt   = zeros(1,length(A)   ); %tablica akcji optymalnych, moze zawierac maksymalnie length(A) elementy
        akcje_nopt  = zeros(1,length(A)-1 ); %tablica akcji nieoptymalnych, moze zawierac maksymalnie length(A)-1 elementów
        licz_opt = 1;
        licz_nopt = 1;
        for index=1:length(A),
          if mi(box, index) == maxMi,
             akcje_opt(licz_opt) = index;
             licz_opt = licz_opt + 1;
          else
             akcje_nopt(licz_nopt) = index;
             licz_nopt = licz_nopt + 1;
          end
        end
        %jesli wszystkie akcje w danym stanie sa optymalne, to nalezy wpisac do 
        %tablicy akcji nieoptymalnych jeden element, aby w przypadku wylosowania
        %pr <= epsilon mozliwy byl wybor jakiejs akcji
        if licz_nopt == 1,
          akcje_nopt(licz_nopt) = floor(rand(1)*(licz_opt - 1)) + 1;
          licz_nopt = licz_nopt + 1;
        end
        action = akcje_opt(1); % wybierz pierwsz¹ z akcji optymalnych - bez losowoœci
    % koniec wyboru akcji   
             
    % aktualizacja po³o¿enia
    [x, x_dot] = ball_beam(A(action), x, x_dot);   
    nextbox = get_box(x, x_dot);
    
    if nextbox > 0,
        % przyznaj nagrodê za unikniêcie pora¿ki
        r = 0;
        krok = krok + 1;
        %[maxQ, index] = max(Q(nextbox, :));
        delta = r + gamma*V(nextbox) - V(box);	% b³¹d TD
        czas = krok*0.02;
    else
        % przyznaj nagrodê za pora¿kê i powróæ do stanu pocz¹tkowego
        r = -1;
        x = 0;
        x_dot = 0;
      
        nextbox = get_box(x, x_dot);
        delta = r - V(box); % b³¹d TD
        czas = krok*0.02;
        if czas > maxczas,
            maxczas = czas;
        end
        %[proba czas maxczas]
        proby = [proby proba];
        czasy = [czasy czas];
        %plot(proby, czasy)
        %pause(1e-5);
        krok = 1;
        proba = proba + 1;
        if proba == MAX_PROBA, break, end;
	end

    % aktualizacja funkcji mi i V
    mi(box,action) = mi(box,action) + beta * delta; % regu³a TD            
    V(box) = V(box) + alpha * delta; % regu³a TD 
    
end

[proba czas]
proby = [proby proba];
czasy = [czasy czas];
% plot(proby, czasy)
