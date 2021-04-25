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

7.7811    30.5672
8.796    30.5215
9.853    30.5182
10.8678    30.5151
11.9248    30.5118
12.9819    30.5086
14.0389    30.5053
15.096    30.502
16.153    30.4988
17.1677    30.5383
18.2248    30.4924
19.2819    30.4891
20.3389    30.4859
21.3537    30.4828
22.4106    30.5222
23.4677    30.5189
25.0744    30.5139
26.0891    30.5108
27.1462    30.5076
28.1187    30.5046
29.0913    30.4589
30.1059    30.4984
31.163    30.4952
32.1353    30.5348
33.1924    30.5316
34.2072    30.5284
35.2641    30.5678
36.3211    30.5646
37.3359    30.5614
38.3507    30.5583
39.4077    30.5551
40.3379    30.5522
41.395    30.5489
42.452    30.5457
43.4668    30.5426
44.5238    30.5393
45.5809    30.536
46.6379    30.5328
47.695    30.5295
48.7096    30.569
49.7245    30.5233
50.7814    30.5627
51.7962    30.5595
52.811    30.5564
53.868    30.5531
54.9251    30.5499
55.9821    30.5466
57.0392    30.5434
58.0962    30.5401
59.1531    30.5795
60.168    30.5337
61.2251    30.5305
62.282    30.5699
63.2969    30.5241
64.3538    30.5635
65.411    30.5176
66.468    30.5143
67.4828    30.5112
68.5398    30.5079
69.4699    30.5477
70.527    30.5445
71.5841    30.4985
72.5988    30.5381
73.6558    30.5348
74.6706    30.5317
75.6854    30.5286
76.7423    30.5679
77.6726    30.5224
78.7296    30.5618
79.7866    30.5586
80.7591    30.5556
81.8161    30.5523
82.8309    30.5492
83.8879    30.5459
84.9451    30.5
85.9598    30.5395
87.0168    30.5363
88.0315    30.5758
89.0462    30.5727
90.1034    30.5268
91.1182    30.5236
92.1328    30.5632
93.19    30.5173
94.2046    30.5568
95.2617    30.5535
96.3187    30.5503
97.3758    30.547
98.4328    30.5437
99.4899    30.5405
100.5047    30.4947
101.5194    30.5342
102.534    30.5737
103.5488    30.5706
104.5214    30.525
105.5783    30.5644
106.6354    30.5611
107.6503    30.5153
108.6226    30.555
109.6797    30.5517
110.7367    30.5485
111.7516    30.5027
112.7663    30.5422
113.7389    30.4966
114.7535    30.5361
115.6838    30.4906
116.6984    30.5727
117.7555    30.5268
118.7279    30.5665
119.7428    30.5207
120.7998    30.5175
121.8144    30.5996
122.829    30.6391
123.8012    30.7214
124.8158    30.8036
125.788    30.8859
126.8024    31.0107
127.8168    31.1355
128.8311    31.303
129.8453    31.5131
130.8171    31.7234
131.7891    31.8909
132.7609    32.1438
133.7327    32.3967
134.7043    32.6923
135.6759    32.9878
136.6477    33.2407
137.6192    33.5789
138.5485    33.9172
139.4777    34.2555
140.2378    34.5943
141.1668    35.0179
142.1381    35.4414
143.0668    35.9503
143.9957    36.4166
144.9243    36.9681
145.8107    37.5198
146.6549    38.029
152.941    42.9141
153.7423    43.6366
154.459    44.3594
155.2179    45.1247
155.9346    45.8901
156.6937    46.5702
157.4104    47.293
158.2119    47.9728
159.0133    48.6527
159.8148    49.29
160.6587    49.9271
161.5025    50.5642
162.3888    51.1159
163.2752    51.6676
164.2039    52.1765
165.0903    52.7281
166.0192    53.1944
166.9906    53.5752
167.9618    53.9987
168.9755    54.3794
169.9469    54.7603
170.9187    55.0131
171.9327    55.2659
172.9468    55.5187
173.961    55.6861
174.9753    55.8536
175.9476    55.9359
176.9622    55.9754
178.0193    55.9721
179.0764    55.9262
180.0914    55.8378
181.064    55.7922
182.0792    55.6611
183.0945    55.4447
184.11    55.1857
185.1255    54.9267
186.099    54.5825
187.0725    54.1957
188.0462    53.7662
189.0199    53.3368
189.9516    52.8221
190.8831    52.3501
191.7303    51.7931
192.6197    51.2786
193.467    50.6789
194.2722    50.0367
195.1196    49.3944
195.8825    48.7523
196.6458    47.9823
197.4088    47.2976
198.172    46.5276
198.8929    45.8004
199.6138    45.0305
200.2925    44.2608
200.7164    43.8757
201.4796    43.1483
202.2428    42.3783
203.0058    41.6936
203.8111    41.0087
204.6164    40.3239
205.4638    39.6816
206.269    39.0394
207.1163    38.4397
208.006    37.8399
208.8533    37.2402
209.7849    36.7256
210.6744    36.1684
211.6061    35.6538
212.5376    35.1818
213.469    34.7525
214.4004    34.3231
215.0355    34.0226
216.0091    33.6358
216.9828    33.2063
217.9562    32.8622
218.9297    32.518
219.9453    32.2163
220.9187    31.8721
221.9341    31.6558
222.9073    31.3969
223.8805    31.138
224.8535    30.9644
225.0651    30.8785
226.0804    30.7048
227.0956    30.531
228.1109    30.3573
229.126    30.2262
230.0989    30.0953
231.156    30.0494
232.171    29.961
233.1861    29.8726
234.2009    29.8268
235.1735    29.7811
235.8501    29.7791
236.8649    29.7333
237.8374    29.7303
238.8523    29.6845
239.8671    29.6814
240.882    29.6356
241.8967    29.6325
242.9116    29.5867
243.9687    29.5834
244.8989    29.5806
245.9559    29.5773
246.9708    29.5315
248.0279    29.5283
249.0005    29.4826
250.0152    29.4795
251.0724    29.4336
252.0872    29.4305
253.0598    29.3848
254.1168    29.3816
255.1317    29.3358
256.1464    29.3753
257.1614    29.2869
258.1761    29.2838
259.1908    29.3233
260.2057    29.2775
261.2205    29.2317
262.2776    29.2285
263.2079    29.183
264.2227    29.1798
265.2376    29.1341
266.2523    29.1309
267.2672    29.0852
268.2397    29.0822
269.2545    29.079
270.2271    29.0334
271.2842    28.9875
272.3414    28.9416
273.3561    28.9811
274.3288    28.8928
275.3436    28.8897
276.3584    28.8439
277.4155    28.8407
278.4304    28.7949
279.4874    28.7916
280.5446    28.7457
281.6016    28.7425
282.5743    28.6968
283.5045    28.6939
284.5193    28.6482
285.1536    28.6462
286.1685    28.6004
287.2255    28.5972
288.198    28.5942
289.2129    28.5484    
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