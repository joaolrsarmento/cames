% Instituto Tecnológico de Aeronáutica
% Engenharia Mecânica-Aeronáutica
% MPD-11 - Dinâmica de máquinas
% Aluno: João Luís Rocha Sarmento
% 
% Laboratório 2 - Cinemática de cames
% 
%% Inicialização

clear;
close all;
clc;

%% Dados digitalizados correspondentes à curva obtida experimentalmente,
%  expressos em milímetros

data = [ 

7.4028    35.6131
8.3764    35.6983
9.35    35.6985
10.4083    35.6988
11.4244    35.6141
12.4403    35.6568
13.4986    35.657
14.5569    35.6573
15.6152    35.6575
16.6735    35.6577
17.0636    35.7161
17.7318    35.658
18.7901    35.7007
19.8484    35.6585
20.8644    35.7012
21.9227    35.7014
22.981    35.7017
23.9969    35.7444
25.0552    35.7871
26.0289    35.7448
27.0872    35.7026
28.1032    35.7453
29.1615    35.7456
30.2197    35.7883
31.278    35.7885
32.3364    35.7463
33.3523    35.789
34.4106    35.7892
35.4266    35.7895
36.4849    35.8322
37.5432    35.8324
38.6014    35.8752
39.6174    35.8754
40.6758    35.8332
41.7341    35.8334
42.7924    35.8336
43.8083    35.8339
44.8243    35.8766
45.8826    35.8768
46.9409    35.9195
47.9569    35.8773
49.0151    35.92
50.0734    35.9203
51.1317    35.9205
52.1477    35.9207
53.206    35.8785
54.222    35.9212
55.2803    35.9215
56.3386    35.9217
57.3969    35.9644
58.4129    35.9222
59.4288    35.9649
60.4448    35.9226
61.5031    35.9229
62.5191    35.9656
63.5774    35.9234
64.5934    35.9236
65.6517    35.9238
66.71    35.9241
67.726    35.8818
68.7843    35.8821
69.8426    35.8823
70.8162    35.8826
71.8745    35.8828
72.8905    35.883
73.9488    35.8833
75.0071    35.8835
76.0654    35.8838
77.0814    35.799
78.1397    35.7993
79.1557    35.7995
80.214    35.7573
81.2301    35.7151
82.2884    35.6728
83.3043    35.7155
84.3626    35.7583
85.4209    35.716
86.4792    35.7587
87.4952    35.8014
88.5534    35.8866
89.6117    35.9293
90.6276    36.057
91.6012    36.0997
92.5747    36.2698
93.6329    36.355
94.6065    36.4826
95.6223    36.6528
96.6382    36.7804
97.6541    36.9505
98.6276    37.1207
99.601    37.3757
100.6169    37.5458
101.6327    37.716
102.6062    37.9286
103.5797    38.1411
104.9764    38.5237
105.9922    38.7363
107.008    38.9914
107.9815    39.2889
108.9972    39.6289
110.013    39.9265
110.9864    40.2665
112.0021    40.564
112.9755    40.9465
113.9489    41.329
114.9646    41.669
115.9379    42.094
116.8689    42.5189
117.8423    42.9014
118.8156    43.3263
119.789    43.7513
120.7623    44.1762
121.7356    44.6437
122.6666    45.0686
123.64    45.4511
124.6134    45.8336
125.5867    46.2585
126.5601    46.641
127.5334    47.066
128.5068    47.406
129.4802    47.7884
130.4536    48.1709
131.4693    48.5109
132.4427    48.8509
133.4161    49.2334
134.4318    49.531
135.4476    49.8285
136.421    50.126
137.4368    50.4236
138.4102    50.7211
139.426    50.9762
140.4418    51.2313
141.4153    51.4438
142.4311    51.6989
143.4469    51.9115
144.4627    52.1241
145.4786    52.2942
146.4944    52.5068
147.5103    52.6345
148.5262    52.7621
149.5844    52.9323
150.5579    53.0174
151.6161    53.1451
152.6744    53.1878
153.6903    53.273
154.7486    53.3157
155.8069    53.3584
156.8228    53.4011
157.8811    53.4014
158.9395    53.3592
159.9978    53.3594
161.0138    53.3172
162.0298    53.2324
163.0458    53.1477
164.1042    53.063
165.1202    52.9783
166.1363    52.8511
167.1947    52.724
168.2108    52.5543
169.2269    52.3846
170.243    52.1725
171.2591    52.0029
172.2752    51.7907
173.2913    51.5786
174.2652    51.2815
175.2813    51.0694
176.2974    50.8148
177.2713    50.5177
178.2874    50.2631
179.3037    49.9235
180.2775    49.6264
181.2514    49.3294
182.1829    48.9898
183.1568    48.6502
184.0883    48.3107
185.0199    47.9286
185.9515    47.5891
186.9254    47.1645
187.8146    46.825
188.7885    46.4429
189.6778    46.0184
190.6094    45.6364
191.541    45.2119
192.4726    44.7873
193.4042    44.3628
194.2935    43.9383
195.2251    43.4713
196.1143    43.0893
197.0883    42.7072
197.9775    42.2827
198.9091    41.9007
199.883    41.5611
200.4335    41.3489
201.4074    40.9244
202.3812    40.6273
203.3975    40.2453
204.3714    39.9057
205.3452    39.6086
206.3614    39.3115
207.3352    39.0144
208.3514    38.7174
209.3676    38.4628
210.3837    38.2082
211.3999    37.996
212.3737    37.7414
213.3899    37.4443
214.3636    37.3171
215.3797    37.1475
216.4381    36.9778
217.4542    36.8082
218.4703    36.6385
219.4864    36.4689
220.5024    36.3417
221.5185    36.2145
222.5769    36.1298
223.5929    36.0026
224.6513    35.9604
225.6673    35.8757
226.7257    35.791
227.784    35.7912
228.7577    35.7065
229.816    35.7067
230.8319    35.707
231.8902    35.7072
232.9485    35.7074
234.0068    35.7077
235.0228    35.7079
236.0811    35.7082
237.1394    35.7084
238.1977    35.7087
239.256    35.7089
240.272    35.7516
241.3303    35.7094
242.3463    35.7521
243.3622    35.7523
244.4205    35.7526
245.4788    35.7528
246.4948    35.753
247.5531    35.7108
248.569    35.796
249.6274    35.7538
250.6434    35.754
251.7016    35.7967
252.7176    35.7969
253.7336    35.7972
254.7919    35.7974
255.8502    35.7977
256.9085    35.7979
257.9244    35.8406
258.9404    35.7984
259.9987    35.7986
261.057    35.7989
262.1153    35.7991
263.1736    35.8418
264.1896    35.7571
265.2479    35.7998
266.3062    35.8001
267.3645    35.8003
268.4228    35.8005
269.4388    35.8008
270.4971    35.801
271.5554    35.8013
272.6137    35.8015
273.6297    35.8017
274.688    35.802
275.7463    35.8022
276.8046    35.8025
277.8629    35.8452
278.8789    35.8029
279.9372    35.8032
280.9955    35.8034
282.0538    35.8037
283.1121    35.8039
284.1704    35.8042
285.2287    35.8044
286.287    35.7622
287.2606    35.8049
288.3189    35.8051
289.3349    35.7629
290.3933    35.7631
291.4516    35.7634    
];

%% Extrair as componentes x e y

x = data(:,1);
y = data(:,2);

%% Garantir que o primeiro ponto está na borda esquerda do papel, e
%  que o último está em sua borda direita

x = [ 0 ; x ; 297 ];
y = [ y(1) ; y ; y(end) ];

%% Plocar a curva digitalizada e uma reta ligando o primeiro e último
%  pontos

figure;
plot(x,y, '-.', 'Color', 'Black');
grid on;
hold on;
plot(x([1,end]),y([1,end]), 'Color', 'Blue');
xlabel('Deslocamento da came [mm]','Interpreter','latex')
ylabel('Deslocamento do seguidor [mm]','Interpreter','latex')
axis equal;
xtickformat('$%g$');
ytickformat('$%g$');
set(gca,'XLim',[0,297],'TickLabelInterpreter','latex');

%% Determinar o ângulo associado com a reta que liga o primeiro e último
%  pontos

ang = atand((y(end)-y(1))/(x(end)-x(1)));

%% Rotacionar a curva digitalizada para garantir que o primeiro e último
%  pontos estejam alinhados na vertical ...

rot = [ cosd(ang) , sind(ang) ; -sind(ang) , cosd(ang) ];
r = [ x(1) ; y(1) ] + rot*([ x.' ; y.' ] - [ x(1) ; y(1) ]);

x = r(1,:).';
y = r(2,:).';

%% ... e plotar a nova curva, rotacionada/corrigida

plot(x,y, 'Color', 'Red');

%% Subtrair o deslocamento vertical associado com a digitalização

y = y - y(1);

%% Fazer com que o máximo da curva para o deslocamento do seguidor
%  seja observado para uma rotação da came igual a 180 graus

[ ~ , pos ] = max(y);

delta = x(pos) - 297/2;

idx = x < delta;
x = [ x(~idx) - delta ; x(idx) - delta + 297 ];
y = [ y(~idx) ; y(idx) ];

%% Construir um vetor de posições para reamostrar os dados digitalizados

n_pontos = 1e3 + 1;

x_novo = linspace(0,297,n_pontos).';

%% Correspondente a estes, há um vetor de ângulos

theta = linspace(0,360,n_pontos).';

%% Reamostrar a curva digitalizada corrigida, usando ou interpolação
%  cúbica por partes, ou spline

y_novo = pchip(x,y,x_novo);
% y_novo = spline(x,y,x_novo);

%% Filtrar o resultado obtido, usando média móvel. O valor passado para a
%  função determina o quanto a curva será suavizada ...

y_novo = smoothdata(y_novo,'movmean','SmoothingFactor',0.0025);

%% Plotar a curva corrigida e suavizada, para verificar se ela não foi
%  muito distorcida

figure;
plot(x_novo,y_novo, '-.', 'Color', 'Black');
hold on;
plot(x,y,'Color', 'Blue');
xlabel('Deslocamento da came [mm]','Interpreter','latex');
ylabel('Deslocamento do seguidor [mm]','Interpreter','latex');
legend('Dados processados','Dados digitalizados',...
    'Interpreter','latex');
% axis equal;
xtickformat('$%g$');
ytickformat('$%g$');
set(gca,'YLim',[-5,50],'XLim',[0,297],'TickLabelInterpreter','latex');

figure;
plot(theta,y_novo, '-.', 'Color', 'Black');
hold on;
plot(x*360/297,y, 'Color', 'Blue');
xlabel('Deslocamento angular da came [graus]','Interpreter','latex');
ylabel('Deslocamento do seguidor [mm]','Interpreter','latex');
legend('Dados processados','Dados digitalizados',...
    'Interpreter','latex');
% axis equal;
xtickformat('$%g$');
ytickformat('$%g$');
set(gca,'XTick',0:30:360,'YLim',[-5,50],'XLim',[0,360],...
    'TickLabelInterpreter','latex');

%% Entrar com os valores dos raios do rolete e do círculo base

r_rolete = 1.125*25.4/2;    % AJUSTAR !!!

r_base = 2.375*25.4/2;      % AJUSTAR !!!

r_principal = r_base + r_rolete;

%% Estabelecer a trajetória do ponto traçado

R = r_principal + y_novo;

%% Passar para cordenadas polares; o -90 é para fazer com que o 'calombo'
%  da came resulte para cima no gráfico final...

x = R.*cosd(theta - 90);
y = R.*sind(theta - 90);

%% Calcular a derivada para cada ponto, usando diferenças finitas 
%  centradas -- a derivada em questão é uma aproximação para o 
%  coeficiente angular da reta tangente à trajetória do ponto traçado,
%  em cada ponto

diff_fin_centrada = @(x,y) ...
    (y(3:end) - y(1:end-2))./(x(3:end) - x(1:end-2));

x_cent = [ x(end-1) ; x ; x(2) ];
y_cent = [ y(end-1) ; y ; y(2) ];

dy_dx = diff_fin_centrada(x_cent,y_cent);

%% Determinar o coeficiente angular associado à curva normal
%  para cada ponto da curva do ponto traçado (cf. geometria analítica)

coef_angular_normal = -1./dy_dx;

%% Pré-alocar variáveis para armazenar os pontos que compõem o perfil
%  da came

x_came = zeros(n_pontos,1);
y_came = zeros(n_pontos,1);

for ii = 1:(n_pontos - 1)
    
    % Montar um sistema de equações que corresponde à intersecção
    % de um círculo centrado no ponto traçado, com raio igual ao 
    % do rolete, com uma reta ao longo da direção normal
    
    % O ponto Q situa-se nesta reta, no local da intersecção de
    % interesse
    
    eqs = @(Q) [ (Q(2) - y(ii)) - coef_angular_normal(ii)*(Q(1) - x(ii)) ; ...
                 (Q(1) - x(ii))^2 + (Q(2) - y(ii))^2 - r_rolete^2 ];
    
    % Observação: a notação @(Q) faz com que a expressão armazenada na
    % variável 'eqs' seja tratada como uma função de Q; trata-se de uma
    % função dita 'implícita' 
    
    % Para a primeira solução, usar uma estimativa inicial próxima 
    % ao ponto inicial; e para as demais, usar a última solução
    % obtida
    
    if ii == 1
        dx = -1;    % AJUSTAR !!! 
                    % Pode ser que seja necessário utilizar -1 ou +1 !!!
        Q0 = [ x(ii) + dx ; y(ii) + coef_angular_normal(ii)*dx ];
    else
        Q0 = [ x_came(ii-1) ; y_came(ii-1) ];
    end
    
    % Resolver o sistema de equações não lineares em Q(1) e Q(2),
    % usando rotina disponível no próprio MATLAB. Poderia-se usar
    % o método de Newton-Raphson, também, ou algum outro adequado
    % para este propósito
    
    solu = fsolve(eqs,Q0,optimoptions(@fsolve,'Display','none'));
    
    % Armazenar as soluções encontradas ...
    
    x_came(ii) = solu(1);
    y_came(ii) = solu(2);
    
    % ... e repetir o procedimento para todos os pontos, menos o último,
    % pois é igual ao primeiro
    
end

%% Assim, forçar que o último ponto é coincidente com o primeiro ...

x_came(end) = x_came(1);
y_came(end) = y_came(1);

%% ... e plotar os perfis do ponto traçado e da came

figure;
plot(x,y, 'Color', 'Black');
hold on;
plot(x_came,y_came, 'Color', 'Blue');
xlabel('x [mm]','Interpreter','latex')
ylabel('y [mm]','Interpreter','latex')
legend('Curva primitiva','Perfil da came',...
    'Interpreter','latex');
axis equal;
xtickformat('$%g$');
ytickformat('$%g$');
set(gca,'TickLabelInterpreter','latex');

%% Cálculo da velocidade e aceleração

theta = theta * pi / 180;
w = 750 * 2 * pi / 60; 
dt = (360 / w) / (n_pontos - 1);
t = linspace(0, 360/w, n_pontos);

theta_cent = [ theta(end-1) ; theta ; theta(2) ];
y_cent = [ y_novo(end-1) ; y_novo ; y_novo(2) ];

dydtheta = diff_fin_centrada(theta_cent,y_cent);
dydtheta_smooth = smoothdata(dydtheta,'movmean','SmoothingFactor',0.0025);
dydtheta_cent = [ dydtheta_smooth(end-1) ; dydtheta_smooth ; dydtheta_smooth(2) ];
d2ydtheta2 = diff_fin_centrada(theta_cent,dydtheta_cent);
d2ydtheta2_smooth = smoothdata(d2ydtheta2,'movmean','SmoothingFactor',0.0025);

dydt = dydtheta .* w;
dydt_smooth = smoothdata(dydt,'movmean','SmoothingFactor',0.0025);
d2ydt2 = d2ydtheta2 .* w ^ 2;
d2ydt2_smooth = smoothdata(d2ydt2,'movmean','SmoothingFactor',0.0025);

figure
plot(t, dydt, '-.', 'Color', 'Black');
hold on
plot(t, dydt_smooth, 'Color', 'Blue');
title('Velocidade da came 1', 'FontSize', 16,'Interpreter','latex')
legend('Velocidade calculada','Velocidade suavizada',...
    'Interpreter','latex');
xlabel('$t [s]$', 'FontSize', 12,'Interpreter','latex')
ylabel("$\dot{y}_{4} [mm s^{-1}]$", 'FontSize', 12,'Interpreter','latex')
set(gca,'TickLabelInterpreter','latex')
xlim([0 360/w]);

figure
plot(t, d2ydt2, '-.', 'Color', 'Black');
hold on
plot(t, d2ydt2_smooth, 'Color', 'Blue');
title('Acelera\c{c}\~{a}o da came 1', 'FontSize', 16,'Interpreter','latex')
legend('Acelera\c{c}\~{a}o calculada','Acelera\c{c}\~{a}o suavizada',...
    'Interpreter','latex');
xlabel('$t [s]$', 'FontSize', 12,'Interpreter','latex')
ylabel("$\ddot{y}_{4} [mm s^{-2}]$", 'FontSize', 12,'Interpreter','latex')
set(gca,'TickLabelInterpreter','latex')
xlim([0 360/w]);