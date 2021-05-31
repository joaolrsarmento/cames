% Instituto Tecnológico de Aeronáutica
% Engenharia Mecânica-Aeronáutica
% MPD-11 - Dinâmica de máquinas
% Aluno: João Sarmento
% 
% Laboratório 3 - Dinâmica de cames
% 
%% Inicialização

clear;
close all;
clc;

%% Velocidade de rotação crítica determinada experimentalmente

velocidade_critica = 154;   % [rpm]

%% Aceleração da gravidade

g = 9.81;                   % [m/s²]

%% Valor da massa do elo 4 (suportada pelo seguidor)
%  (medida com balança, conforme foto)

m_4 = 1.825;                % [kg]

%% Dados relativos à mola
%  (medidos/estimados com paquímetro, com nônio - resolução de 0,02 mm)

L = 65e-3;                  % Comprimento da mola instalada [m]
L0 = 70e-3;                 % Comprimento livre da mola     [m]

delta_0 = abs(L - L0);      % Compressão inicial da mola    [m]

%% Pesos aplicados para caracterização da mola
%  (foram usadas massas 'padrão' - com valores indicados nas mesmas)

W = [  2 ;
       3 ;
       4 ;      % 2 + 2
       5 ;      % 2 + 3
       7 ;      % 5 + 2
       8 ;      % 5 + 3
       9 ;      % 5 + 2 + 2
      10 ;      % 5 + 2 + 3
      12 ]*g;   % 5 + 2 + 2 + 3         % [N]

%% Comprimentos da mola comprimida devido à aplicação de carga sobre 
%  a mesma (medidos/estimados usando um compasso interno e paquímetro,
%  com nônio - com resolução de 0,02 mm)

L = [ 66.00 ;
      63.72 ;
      61.50 ;
      59.40 ;
      54.80 ;
      52.80 ;
      50.48 ;
      48.34 ;
      44.18 ]*1e-3;                     % [m]

%% Deformação da mola durante o ensaio para sua caracterização

delta_L = abs(L - L0);

%% Gráfico com os dados coletados para caracterização da mola

figure(1);
plot(delta_L,W,'o');

%% Tipo de ajuste a ser considerado para os dados coletados

ft = fittype({'x'});    % função do tipo y = a*x
% ft = 'poly1';           % função do typo y = a*x + b

%% Determinar o ajuste do modelo escolhido aos dados experimentais

[cf, G] = fit(delta_L,W,ft);
cf

%% Determinar os coeficientes a/b relacionados ao ajuste realizado

coeficientes_ajuste = coeffvalues(cf);

%% O coeficiente angular do ajuste (a) corresponde ao valor da 
%  rigidez da mola (em N/m, por conta das unidades de delta_L e W)

k_mola = coeficientes_ajuste(1);

%% Plotar na mesma figura a reta ajustada, bem como os limites
%  de confiança associados ao ajuste (95%)

hold on;
plot(cf,'predobs');

%% Enfeitar a figura com legenda, eixos, malha, etc.

xlabel('$\Delta L$ (compress\~{a}o) (m)','Interpreter','latex');
ylabel('$F_{\mathrm{mola}}$ (N)','Interpreter','latex');

set(gca,'TickLabelInterpreter','latex');
grid on;
legend off;

%% Diretório e nomes dos arquivos salvos usando o software LabVIEW
%  (ajustar de acordo com sua necessidade; '..\' significa diretório
%   acima; se desejado, os arquivos podem ser colocados na mesma pasta
%   que este código .m - neste caso, a variável 'data_dir' deve ser 
%   alterada para '')

data_dir = '';
% data_dir = '';
filenames = {'Lab_3_Baixa_Velocidade.xlsx',...
             'Lab_3_Velocidade_Critica.xlsx',...
             'Lab_3_Alta_Velocidade.xlsx'};

%% Identificador para escolher qual dos arquivos será importado

file_nb = 1;

%% Leitura da tabela contendo os dados experimentais

T = readtable([data_dir,filenames{file_nb}],'basic',true);

%% Extrair os dados da tabela salva na variável 'T'

data = T.Variables;

%% Armazenar os dados experimentais em variáveis mnemônicas

vet_tempo = data(:,1);      % Vetor com instantes de tempo  [s]
vet_acel = data(:,2);       % Dados do acelerômetro         [m/s²]
vet_desloc = data(:,4);     % Dados do laser                [mm]

%% Para visualização dos dados coletados de forma 'bruta',
%  completos, descomentar as linhas seguintes...

% figure;
% plot(vet_tempo,vet_desloc);
% hold on;
% plot(vet_tempo,vet_acel);

%% Identificar os picos na resposta medida pelo laser

[ pks , locs ] = ...
    findpeaks(vet_desloc,vet_tempo,'MinPeakHeight',0.8*max(vet_desloc));

%% Calcular o período do sinal periódico usando a localização dos picos
%  identificados

periodo = mean(diff(locs));

%% A partir do período, obter a velocidade angular e a velocidade de
%  rotação em rpm para os dados coletados e importados

omega = 2*pi/periodo;       % [rad/s]
n = omega*60/(2*pi);        % [rpm]

%% Escolher um dos picos do sinal do laser para realizar contas necessárias
%  Os picos são bastante semelhantes entre si. Pode-se escolher desde o se-
%  gundo até o penúltimo sem problemas. O primeiro e o último não necessa-
%  riamente contém um período completo do sinal periódico...

id = 2;
% id = length(pks) - 1;

%% Determinar os instantes de tempo mínimo e máximo que contém o período
%  de interesse

t_min = locs(id) - periodo/2;
t_max = locs(id) + periodo/2;

%% Construir um vetor booleano (de zeros e uns) para selecionar os dados
%  de interesse

idx = vet_tempo >= t_min & vet_tempo <= t_max;

%% Determinar o número de pontos experimentais contidos num período do 
%  sinal do laser

n_pts_periodo = sum(idx);

%% Construir um vetor com os ângulos de rotação do came

theta = linspace(0,2*pi,n_pts_periodo).';

%% Filtrar os dados do deslocamento do laser (selecionar apenas aqueles
%  que estão no intervalo de tempo de interesse - um único período)

y = vet_desloc(idx)*1e-3;       % dividir por 10³ para obter o 
                                % resultado em metros

%% Filtrar os dados do acelerômetro (selecionar apenas aqueles
%  que estão no intervalo de tempo de interesse - um único período)

acel = vet_acel(idx)/(omega^2); % dividir por omega² para obter a derivada
                                % segunda do deslocamento do seguidor com
                                % respeito à orientação do came

%% Fazer com que o menor valor do deslocamento do seguindor seja igual a
%  zero

y = y - min(y);

%% Carregar os dados do Lab. 2 associados ao came 2; os mesmos compreendem
%  a orientação angular do came e o deslocamento do seguidor (suavizado)

vars = load('Lab_2_Came_2.mat');

theta_ = vars.theta;  
y_ = vars.y_desired*1e-3;          % passar o deslocamento para metros

%% Numa figura, plotar o deslocamento do seguidor

figure(2);
plot(theta*180/pi,y, 'LineWidth', 2);           % medida do laser
hold on
plot(theta_*180/pi,y_, 'LineWidth', 2);         % medida do Lab. 2

%% Filtrar os deslocamentos

y_smooth = smoothdata(y,'movmean','SmoothingFactor',0.0005);
y_smooth_ = smoothdata(y_,'movmean','SmoothingFactor',0.0005);

%% ... e plotar os dados suavizados

plot(theta*180/pi,y_smooth, 'LineWidth', 2);
plot(theta_*180/pi,y_smooth_, 'LineWidth', 2);

%% Enfeitar a figura com legenda, eixos, malha, etc.

xlabel('$\theta$ (graus)','Interpreter','latex');
ylabel('$y_{4}$ (m)','Interpreter','latex');

set(gca,'TickLabelInterpreter','latex',...
    'XTick',0:30:360,'XLim',[0,360]);
grid on;
legend('Laser','Lab. 2','Laser - suavizado','Lab. 2 - suavizado',...
    'Interpreter','latex');

%% Descartar os dados originais pelos suavizados

y = y_smooth;
y_ = y_smooth_;

%% Derivar os dados associados ao laser com respeito à orientação angular
%  do came

diff_fin_centrada = @(x,y) ...
    (y(3:end) - y(1:end-2))./(x(3:end) - x(1:end-2));

th_cent = [ theta(end-1) ; theta ; theta(2) ];
y_cent = [ y(end-1) ; y ; y(2) ];

dy = diff_fin_centrada(th_cent,y_cent);

% dy = diff(y)./diff(theta);
% dy(end+1) = dy(1);          % a derivada para o último ponto deve ser 
%                             % igual à derivada do primeiro, já que a
%                             % função é periódica

%% Derivar os dados obtidos no Lab. 2 com respeito à orientação angular
%  do came

th__cent = [ theta_(end-1) ; theta_ ; theta_(2) ];
y__cent = [ y_(end-1) ; y_ ; y_(2) ];

dy_ = diff_fin_centrada(th__cent,y__cent);

% dy_ = diff(y_)./diff(theta_);
% dy_(end+1) = dy_(1);        % a derivada para o último ponto deve ser 
%                             % igual à derivada do primeiro, já que a
%                             % função é periódica

%% Numa figura, plotar a derivada primeira do deslocamento do seguidor
%  com respeito à orientação do came

figure(3);
plot(theta*180/pi,dy, 'LineWidth', 2);      % dados associados com o laser
hold on;
plot(theta_*180/pi,dy_, 'LineWidth', 2);    % dados associados com o Lab. 2

%% Filtrar as derivadas calculadas

dy_smooth = smoothdata(dy,'movmean','SmoothingFactor',0.000005);
dy_smooth_ = smoothdata(dy_,'movmean','SmoothingFactor',0.000005);

%% ... e plotar o resultado na mesma figura

plot(theta*180/pi,dy_smooth, 'LineWidth', 2);
plot(theta_*180/pi,dy_smooth_, 'LineWidth', 2);

%% Enfeitar a figura com legenda, eixos, malha, etc.

xlabel('$\theta$ (graus)','Interpreter','latex');
ylabel('$y_{4}^{\prime}$ (m$/$rad)','Interpreter','latex');

set(gca,'TickLabelInterpreter','latex',...
    'XTick',0:30:360,'XLim',[0,360]);
grid on;
legend('Laser','Lab. 2','Laser - suavizado','Lab. 2 - suavizado',...
    'Interpreter','latex');

%% Descartar os derivadas calculadas por aquelas suavizadas

dy = dy_smooth;
dy_ = dy_smooth_;

%% Derivar os dados associados ao laser com respeito à orientação angular
%  do came uma segunda vez

dy_cent = [ dy(end-1) ; dy ; dy(2) ];

d2y = diff_fin_centrada(th_cent,dy_cent);

% d2y = diff(dy)./diff(theta);
% d2y(end+1) = d2y(1);

%% Derivar os dados obtidos no Lab. 2 com respeito à orientação angular
%  do came uma segunda vez

dy__cent = [ dy_(end-1) ; dy_ ; dy_(2) ];

d2y_ = diff_fin_centrada(th__cent,dy__cent);

% d2y_ = diff(dy_)./diff(theta_);
% d2y_(end+1) = d2y_(1);

%% Numa figura, plotar a derivada segunda do deslocamento do seguidor
%  com respeito à orientação do came

figure(4);
plot(theta*180/pi,d2y, 'LineWidth', 1);     % dados associados com o laser
hold on;
plot(theta_*180/pi,d2y_, 'LineWidth', 1);   % dados associados com o Lab. 2
plot(theta*180/pi,acel, 'LineWidth', 1);    % dados associados com o acelerômetro

%% Filtrar as derivadas calculadas e os dados coletados pelo acelerômetro

d2y_smooth = smoothdata(d2y,'movmean','SmoothingFactor',0.1);
d2y_smooth_ = smoothdata(d2y_,'movmean','SmoothingFactor',0.1);
acel_smooth = smoothdata(acel,'movmean','SmoothingFactor',0.1);

%% ... e plotar o obtido na mesma figura

plot(theta*180/pi,d2y_smooth, 'LineWidth', 1);
plot(theta_*180/pi,d2y_smooth_, 'LineWidth', 1);
plot(theta*180/pi,acel_smooth, 'LineWidth', 1);

%% Enfeitar a figura com legenda, eixos, malha, etc.

xlabel('$\theta$ (graus)','Interpreter','latex');
ylabel('$y_{4}^{\prime\prime}$ (m$/$rad$^{2}$)','Interpreter','latex');

set(gca,'TickLabelInterpreter','latex',...
    'XTick',0:30:360,'XLim',[0,360]);
grid on;
legend('Laser','Lab. 2','Aceler\^{o}metro',...
    'Laser - suavizado','Lab. 2 - suavizado','Aceler\^{o}metro - suavizado',...
    'Interpreter','latex');

%% Calcular a velocidade crítica teórica, na qual a força de contato
%  vertical torna-se nula. Fazer isto para cada ângulo do came. Em 
%  alguns deles, a velocidade crítica calculada pode resultar imaginária,
%  o que significa que é impossível ocorrer flutuação do seguidor se uti-
%  lizado com o came considerada, na orientação em questão. A velocidade
%  crítica real é aquela que tem o menor valor (não-nulo). O ângulo asso-
%  ciado a tal velocidade é aquele no qual o seguidor 'salta'.

d2y = d2y_smooth;       % utilizar dados do laser suavizados
d2y = acel_smooth;      % utilizar dados do acelerômetro suavizados
d2y = acel;             % utilizar dados do acelerômetro sem suavizá-los

d2y_ = d2y_smooth_;     % utilizar dados do Lab. 2 suavizados

% omg_cr = sqrt((m_4*g + feval(cf,(y + delta_0)))./(-m_4*d2y));
% omg_cr_ = sqrt((m_4*g + feval(cf,(y_ + delta_0)))./(-m_4*d2y_));
omg_cr = sqrt((m_4*g + k_mola*(y + delta_0))./(-m_4*d2y));
omg_cr_ = sqrt((m_4*g + k_mola*(y_ + delta_0))./(-m_4*d2y_));

%% Numa figura, plotar o valor crítico de velocidade angular (em rpm)
%  em função da orientação do came

figure;
plot(theta*180/pi,real(omg_cr)*60/(2*pi),'.');      % laser / acelerômetro
hold on;
plot(theta_*180/pi,real(omg_cr_)*60/(2*pi),'.');    % Lab. 2

%% Enfeitar a figura com legenda, eixos, malha, etc.

xlabel('$\theta$ (graus)','Interpreter','latex');
ylabel('$n_{\mathrm{critico}}$ (rpm)','Interpreter','latex');

set(gca,'TickLabelInterpreter','latex',...
    'XTick',0:30:360,'XLim',[0,360],'YLim',[0,300]);
grid on;
legend('Laser','Lab. 2','Interpreter','latex');
