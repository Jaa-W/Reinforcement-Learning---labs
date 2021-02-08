% Q(lambda)-learning dla ball-beam
% clear all
% close all
% format short g

BOX_COUNT       = 25;
MAX_PROBA       = 10000;                 % maksymalna liczba prob na dany zestaw wsp�czynnik�w uczenia

A = [-1, 0, 1];	% zbi�r akcji

Q               = zeros(BOX_COUNT,length(A));   % funkcja warto�ci akcji
e               = zeros(BOX_COUNT,length(A));   % �lad aktywno�ci dla funkcji Q
                                          
gamma           = 0.995;               % wsp�czynnik dyskontowania
alpha           = 0.1;                 % wsp�czynnik aktualizacji funkcji Q
lambda          = 0.9;

epsilon           = 0.1;

rand('state',sum(100*clock));         % inicjacja generatora liczb pseudolosowych

%stan pocz�tkowy ball_beam
x               = 0;        % pocz�tkowe po�o�enie w�zka
x_dot           = 0;        % pocz�tkowa pr�dko�� w�zka

nextbox = get_box(x, x_dot);

proba = 1;
proby = [];
czas = 0;
krok = 1;
czasy = [];

wynik = [];

while proba<MAX_PROBA
    % dyskretyzacja aktualnego stanu
    box = nextbox;
    [maxQ, sizeQ] = max(Q(box, :));
   
    akcje_zach = [];
    for n = 1:length(A),
        if Q(box, n) == maxQ,
            akcje_zach = [akcje_zach n];
        end
    end
    
    if rand > epsilon,
        % wybierz losowo jedn� z akcji zach�annych
        % z prawdopobobie�stwem 1 - epsilon
        i_app_action = floor(rand*(length(akcje_zach)- 0)) + 1;
        app_action = akcje_zach(i_app_action);
   else
        % wybierz akcj� losowo z prawdopodobie�stwem epsilon
         i_app_action = floor(rand*(length(A)) + 1);
         app_action = A(i_app_action);
    end
   % koniec wyboru akcji
      
   e(box, i_app_action) = e(box, i_app_action) + 1;    %accumulative trace
%     e(box, i_app_action) = 1;    %replacing trace
          
   % aktualizacja po�o�enia
   [x, x_dot] = mountain_car(app_action, x, x_dot);   
   nextbox = get_box(x, x_dot);
    
    if x >= 0.5
        r = 1;
        delta = r - Q(box,i_app_action);
    else
        r = -0.1;
        krok = krok + 1;
        czas = krok*0.02;
        [maxQ, index] = max(Q(nextbox, :));
        delta = r + gamma*maxQ - Q(box,i_app_action);    % b��d TD
        proba = proba + 1;
    end

    % aktualizacja funkcji Q
    Q = Q + alpha*delta*e; % regu�a TD            
    if r < 0
        e = zeros(BOX_COUNT,length(A));
    else
        e = gamma * lambda*e;
    end
    
    wynik = [proba, x, x_dot, A(i_app_action)];

    if x>=0.5
        break; 
    end

end

[proba czas]
proby = [proby proba];
czasy = [czasy czas];

