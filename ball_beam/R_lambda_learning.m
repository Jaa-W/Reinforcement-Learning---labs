% Q(lambda)-learning dla ball-beam
% clear all
% close all
% format short g

BOX_COUNT       = 25;
MAX_TIME        = 2000;                 % maksymalny czas eksperymentu w sekundach
MAX_PROBA       = 1000;                 % maksymalna liczba prob na dany zestaw wsp�czynnik�w uczenia

A=[-pi/4;   -pi/8;  0;  pi/8;   pi/4];	% zbi�r akcji

Q               = zeros(BOX_COUNT,length(A));   % funkcja warto�ci akcji
e               = zeros(BOX_COUNT,length(A));   % �lad aktywno�ci dla funkcji Q
                                          
% gamma           = 0.995;               % wsp�czynnik dyskontowania
% alpha           = 0.1;                 % wsp�czynnik aktualizacji funkcji Q
% beta           = 0.05;                % wsp�czynnik aktualizacji funkcji r_srednia
% lambda          = 0.9;                 % wsp�czynnik �wie�o�ci funkcji Q

r_srednia = 0;
nextaction = 0;


%stan pocz�tkowy ball_beam
x               = 0;        % pocz�tkowe po�o�enie w�zka
x_dot           = 0;        % pocz�tkowa pr�dko�� w�zka

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
        [maxQ, sizeQ] = max(Q(box, :));
        %wyznacz zbiory akcji optymalnych i nieoptymalnych
        akcje_opt   = zeros(1,length(A)   ); %tablica akcji optymalnych, moze zawierac maksymalnie length(A) elementy
        akcje_nopt  = zeros(1,length(A)-1 ); %tablica akcji nieoptymalnych, moze zawierac maksymalnie length(A)-1 element�w
        licz_opt = 1;
        licz_nopt = 1;
        for index=1:length(A),
          if Q(box, index) == maxQ,
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
        action = akcje_opt(1); % wybierz pierwsz� z akcji optymalnych - bez losowo�ci
    % koniec wyboru akcji
    nextaction = action;
   
    e(box,action) = e(box,action) + 1.0;
%     e(box,action) = 1.0;
          
    % aktualizacja po�o�enia
    [x, x_dot] = ball_beam(A(action), x, x_dot);   
    nextbox = get_box(x, x_dot);
    
    if nextbox > 0,
        % przyznaj nagrod� za unikni�cie pora�ki
        r = 0;
        krok = krok + 1;
        [maxQ, index] = max(Q(nextbox, :));
        delta = r - r_srednia + gamma*maxQ - Q(box,action);	% b��d TD
        czas = krok*0.02;
    else
        % przyznaj nagrod� za pora�k� i powr�� do stanu pocz�tkowego
        r = -1;
        x = 0;
        x_dot = 0;
      
        nextbox = get_box(x, x_dot);
        delta = r - Q(box,action); % b��d TD
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

    % aktualizacja funkcji Q
    Q = Q + alpha*delta*e; % regu�a TD            
    if r < 0
        e = zeros(BOX_COUNT,length(A));
    else
        e = lambda*e;
    end
    
    if action == argmax(Q(nextbox, nextaction))
        r_srednia = r_srednia + beta * (r - r_srednia + maxQ - max(Q(box, action))); 
    end

end

[proba czas]
proby = [proby proba];
czasy = [czasy czas];
% plot(proby, czasy)
