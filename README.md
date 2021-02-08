# Reinforcement Learning - labs
#### Files created to the needs Intelligent Control Systems labs

## Description of the models:
### 1. Ball beam

Ball & Beam is a continuous object modeling task to failure. The problem consists of maneuvering the beam in such a way that the ball stays on the beam for as long as possible. State variables of the balance ball system are position of the ball 𝑥 and its velocity 𝑥̇.

Kulka balansująca na równoważni to model obiektu ciągłego modelujący zadanie do porażki. Problem polega na manewrowaniu belką w taki sposób, aby kulka utrzymała się jak najdłużej na jej powierzchni. Zmiennymi stanu układu kulki balansującej na równoważni jest położenie kulki 𝑥 i jej prędkość 𝑥̇.

### 2. Inverted pendulum

Inverted pendulum is another classic problem. The problem consists of moving a carriage with a hinged mounted pendulum in such a way that the pendulum is kept upright. 
State space consists of angle 𝜃 = [-6, 6] (°) (which is zero when the pendulum is perfectly vertical) and angular velocity 𝜃̇ = [-50, 50] (°/𝑠).The action space is discrete and consists of two forces 𝐹 = {-10, 10} (Newton), which can be applied to the carriage to swing the pendulum.

Odwrócone wahadło to kolejny klasyczny problem. Problem polega na przesuwaniu wózka z zamontowanym na zawiasie wahadłem w taki, aby utrzymać wahadło utrzymywało się w pozycji pionowej. 
Przestrzeń stanu składa się z kąta 𝜃 = [−6, 6] (°) (który wynosi zero, gdy wahadło jest ustawione idealnie pionowo) i prędkość kątowa 𝜃̇ = [−50, 50] (°/𝑠).Przestrzeń akcji jest dyskretna i składa się z dwóch sił 𝐹 = {−10, 10} (Newton), które możnazastosować na wózek, aby wychylić wahadło.

### 3. Mountain car

Mountain car is classical reinforcement learning problem and object modeling a success task. This problem was first described by Andrew Moore and it's defined as follows: a car is moving across a landscape of two hills. The car's engine doesn't have enough power to drive over the steep hills. Driver must find out how to reach the top.

Obiekt samochodu wjeżdżającego na wzniesienie to klasyczny problem z uczeniem się wzmocnieniem oraz obiekt modelujący zadanie do sukcesu. Ten problem został po raz pierwszy opisany przez Andrew Moore'a i jest zdefiniowany w następujący sposób: samochód porusza się po krajobrazie dwóch wzgórz. Silnik samochodu nie ma wystarczającej mocy, aby przejechać przez strome wzniesienie. Kierowca musi znaleźć sposób, aby dotrzeć na szczyt wzgórza.
