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
7.8468    30.3485
8.8633    30.3037
9.9222    30.3016
10.9388    30.2995
11.9977    30.2974
13.0567    30.2952
14.1156    30.2931
15.1745    30.2909
16.2335    30.2888
17.2501    30.3294
18.309    30.2845
19.3679    30.2824
20.4268    30.2802
21.4434    30.2782
22.5024    30.3187
23.5613    30.3165
25.1709    30.3133
26.1875    30.3112
27.2464    30.3091
28.2206    30.3071
29.1948    30.2624
30.2114    30.303
31.2704    30.3009
32.2446    30.3416
33.3036    30.3394
34.3202    30.3374
35.3791    30.3779
36.4381    30.3757
37.4547    30.3737
38.4712    30.3716
39.5302    30.3694
40.462    30.3675
41.5209    30.3654
42.5799    30.3632
43.5965    30.3612
44.6554    30.359
45.7143    30.3569
46.7733    30.3547
47.8322    30.3526
48.8488    30.3932
49.8653    30.3484
50.9243    30.389
51.9409    30.3869
52.9575    30.3848
54.0164    30.3827
55.0753    30.3805
56.1343    30.3784
57.1932    30.3762
58.2521    30.3741
59.3111    30.4146
60.3276    30.3698
61.3866    30.3677
62.4456    30.4082
63.4621    30.3635
64.5211    30.404
65.5799    30.3592
66.6389    30.357
67.6555    30.355
68.7144    30.3528
69.6463    30.3936
70.7052    30.3914
71.7641    30.3466
72.7807    30.3872
73.8397    30.3851
74.8563    30.383
75.8728    30.3809
76.9318    30.4214
77.8636    30.3769
78.9226    30.4174
79.9815    30.4152
80.9558    30.4133
82.0147    30.4111
83.0313    30.4091
84.0902    30.4069
85.1491    30.3621
86.1657    30.4027
87.2246    30.4005
88.2413    30.4411
89.2579    30.4391
90.3167    30.3942
91.3333    30.3922
92.3499    30.4328
93.4088    30.388
94.4254    30.4286
95.4844    30.4264
96.5433    30.4243
97.6022    30.4221
98.6612    30.42
99.7201    30.4178
100.7366    30.3731
101.7532    30.4137
102.7699    30.4543
103.7865    30.4522
104.7606    30.4076
105.8196    30.4481
106.8785    30.4459
107.8951    30.4012
108.8693    30.4419
109.9283    30.4397
110.9872    30.4376
112.0037    30.3928
113.0203    30.4335
113.9945    30.3888
115.0111    30.4294
115.9429    30.3848
116.9596    30.4681
118.0185    30.4233
118.9928    30.464
120.0093    30.4193
121.0682    30.4171
122.0849    30.5004
123.1016    30.541
124.0759    30.6243
125.0926    30.7076
126.0669    30.791
127.0837    30.9169
128.1004    31.0429
129.1173    31.2115
130.1341    31.4228
131.1087    31.6342
132.0831    31.8029
133.0577    32.0569
134.0323    32.311
135.0069    32.6077
135.9816    32.9044
136.9561    33.1584
137.9308    33.4978
138.8632    33.8373
139.7955    34.1768
140.5584    34.5166
141.4909    34.9414
142.4657    35.3661
143.3983    35.8763
144.3308    36.3438
145.2635    36.8966
146.1538    37.4495
147.0016    37.9599
153.3198    42.8542
154.1256    43.578
154.8467    44.3019
155.6103    45.0684
156.3314    45.8351
157.0948    46.5162
157.8159    47.2402
158.6217    47.9213
159.4274    48.6024
160.2331    49.2408
161.0812    49.8792
161.9292    50.5175
162.8195    51.0704
163.7098    51.6233
164.6424    52.1335
165.5327    52.6864
166.4652    53.1539
167.44    53.536
168.4148    53.9607
169.4319    54.3427
170.4067    54.7247
171.3812    54.9788
172.3982    55.2327
173.4151    55.4867
174.4319    55.6553
175.4487    55.8239
176.4231    55.9073
177.4397    55.9479
178.4987    55.9457
179.5575    55.9009
180.574    55.8135
181.5481    55.7689
182.5645    55.6388
183.5808    55.4234
184.597    55.1653
185.6132    54.9072
186.587    54.5638
187.5606    54.1778
188.5343    53.7491
189.5079    53.3204
190.439    52.8065
191.3702    52.3352
192.2166    51.7788
193.1053    51.2649
193.9516    50.6658
194.7555    50.0241
195.6018    49.3823
196.3633    48.7407
197.1246    47.9711
197.8861    47.2868
198.6474    46.5171
199.3665    45.7903
200.0855    45.0207
200.7621    44.2513
201.1851    43.8664
201.9465    43.1394
202.7079    42.3698
203.4693    41.6855
204.2732    41.0011
205.077    40.3168
205.9232    39.675
206.7271    39.0333
207.5734    38.4342
208.4621    37.835
209.3084    37.2359
210.2395    36.7219
211.1282    36.1654
212.0593    35.6514
212.9905    35.1802
213.9218    34.7516
214.8531    34.3229
215.488    34.023
216.4617    33.6369
217.4353    33.2083
218.409    32.8649
219.3828    32.5216
220.3989    32.2208
221.3726    31.8774
222.3889    31.662
223.3628    31.404
224.3366    31.146
225.3106    30.9733
225.5223    30.8876
226.5386    30.7148
227.5549    30.5421
228.5713    30.3693
229.5877    30.2392
230.5617    30.1093
231.6206    30.0644
232.637    29.977
233.6535    29.8896
234.67    29.8449
235.6441    29.8002
236.3219    29.7989
237.3384    29.7541
238.3126    29.7521
239.3291    29.7074
240.3457    29.7053
241.3622    29.6606
242.3788    29.6585
243.3953    29.6138
244.4542    29.6116
245.3861    29.6097
246.445    29.6076
247.4615    29.5629
248.5205    29.5607
249.4946    29.5161
250.5112    29.514
251.5701    29.4692
252.5866    29.4671
253.5608    29.4225
254.6197    29.4203
255.6362    29.3756
256.6529    29.4162
257.6693    29.3288
258.6859    29.3267
259.7025    29.3673
260.7191    29.3226
261.7356    29.2778
262.7945    29.2757
263.7263    29.2311
264.7429    29.229
265.7594    29.1843
266.776    29.1822
267.7925    29.1375
268.7667    29.1355
269.7833    29.1335
270.7574    29.0888
271.8163    29.044
272.8752    28.9992
273.8918    29.0398
274.8659    28.9524
275.8825    28.9504
276.899    28.9056
277.9579    28.9035
278.9744    28.8588
280.0334    28.8566
281.0922    28.8118
282.1512    28.8096
283.1253    28.765
284.0572    28.7631
285.0737    28.7183
285.7091    28.7171
286.7256    28.6723
287.7845    28.6702
288.7587    28.6682
289.7752    28.6235
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

r_rolete = 1.125*15.4/2;    % ajustei aqui

r_base = 2*28/2;      % ajustei aqui

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
        dx = 1;    % AJUSTAR !!! 
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
title('Velocidade da came 2', 'FontSize', 16,'Interpreter','latex')
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
title('Acelera\c{c}\~{a}o da came 2', 'FontSize', 16,'Interpreter','latex')
legend('Acelera\c{c}\~{a}o calculada','Acelera\c{c}\~{a}o suavizada',...
    'Interpreter','latex');
xlabel('$t [s]$', 'FontSize', 12,'Interpreter','latex')
ylabel("$\ddot{y}_{4} [mm s^{-2}]$", 'FontSize', 12,'Interpreter','latex')
set(gca,'TickLabelInterpreter','latex')
xlim([0 360/w]);