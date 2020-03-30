% Mestrando: Luiz Carlos Brandão Junior
% Data 28/10/2017
% Pratica 2

clear all;close all;clc;tic;warning off

%% Declaração das Variaveis

Xin    = [0 0 1 1;...
          0 1 0 1];                 % Declaração de Xin
YinAnd = [0 0 0 1];                 % Declaração de YinAnd
YinOr  = [0 1 1 1];                 % Declaração de YinOr
YinXoR = [0 1 1 0];                 % Declaração de YinXoR
alfa = 1.2;
MaxEpocas = 15;
Tolerancia = 0.000001;
W = rand(1,2);
b = rand(1,1);

%% Pesos Randomicos
fprintf("Pesos randômicos = [%f %f]\n",W(1,1),W(1,2));
fprintf("Bias randômico   = [%f]\n\n",b);


%% CHAMA À FUNÇÃO treina_perceptron 
[W_and, b_and, ErroEpocaAnd ] = treina_perceptron(W, b, Xin, YinAnd, alfa, MaxEpocas, Tolerancia);
[W_or,  b_or,  ErroEpocaOr  ] = treina_perceptron(W, b, Xin, YinOr,  alfa, MaxEpocas, Tolerancia);
[W_xor, b_xor, ErroEpocaXoR ] = treina_perceptron(W, b, Xin, YinXoR, alfa, MaxEpocas, Tolerancia);

% imprimindo os Pesos Treinados
fprintf("\nPesos treinados em And = [%f %f]\n",W_and(1,1),W_and(1,2));
fprintf("Pesos treinados em Or  = [%f %f]\n",W_or(1,1),W_or(1,2));
fprintf("Pesos treinados em XoR = [%f %f]\n\n",W_xor(1,1),W_xor(1,2));

% imprimindo as Bias Treinadas
fprintf("Bias treinada em And  = [%f]\n",b_and);
fprintf("Bias treinada em Or   = [%f]\n",b_or);
fprintf("Bias treinada em XoR  = [%f]\n\n",b_xor);

%% Plota o grafico

subplot(2,2,1); plot(1:length(ErroEpocaAnd),ErroEpocaAnd,'Color','r');
grid on
title('And','Color', 'blue');
xlabel('Epoca','FontSize',12,'FontWeight','bold','Color','blue');
ylabel('SEQ','FontSize',12,'FontWeight','bold','Color','blue');

subplot(2,2,2); plot(1:length(ErroEpocaOr),ErroEpocaOr,'Color','r');
grid on
title('Or','Color', 'blue');
xlabel('Epoca','FontSize',12,'FontWeight','bold','Color','blue');
ylabel('SEQ','FontSize',12,'FontWeight','bold','Color','blue');

subplot(2,2,[3,4]); plot(1:length(ErroEpocaXoR),ErroEpocaXoR,'Color','r');
grid on
title('Xor','Color', 'blue');
xlabel('Epoca','FontSize',12,'FontWeight','bold','Color','blue');
ylabel('SEQ','FontSize',12,'FontWeight','bold','Color','blue');



%% CHAMA À FUNÇÃO YPerceptron
Y_and = YPerceptron(Xin,W_and,b_and);   fprintf("Y_and = [%d %d %d %d]\n",Y_and);
Y_or  = YPerceptron(Xin,W_or,b_or);     fprintf("Y_or  = [%d %d %d %d]\n",Y_or);
Y_xor = YPerceptron(Xin,W_xor,b_xor);   fprintf("Y_xor = [%d %d %d %d]\n",Y_xor);


%% FUNÇÃO YPerceptron

function y = YPerceptron(x,w,b)

[u]=(w*x)+b;

  fprintf("u = [%0.2f %0.2f %0.2f %0.2f]\t",u);
for i=1:length(u)
    if u(i)>=0
        y(i)=1;
    else
        y(i)=0;
    end

end

end


%% função treina_perceptron

function[w,b,erroEpocas] = treina_perceptron( w, b, xin, yin, alfa, maxepocas, tol)
epoca = 1;
erro2 = tol;
erroEpocas = [];                                    % inicializa o vetor da soma dos erros quadraticos
while (( epoca < maxepocas ) && ( erro2 >= tol ))
    erro2 = 0;                                      % inicializa o somatorio dos erros quadraticos de cada epoca
    for i = 1:size(xin,2)
        y = YPerceptron(xin(:,i) , w , b);          % retorna apenas um valor
        e = yin(i) - y;                             % erro do resultado
        w = w + alfa*e*(xin(:,i)');                 % atualiza os pesos
        b = b + alfa*e;                             % atualiza o bias
        erro2 = erro2 + (e^2);                      % soma dos erros quadraticos
    end
    erroEpocas(epoca) = erro2;                      % preenche vetor da soma dos erros quadraticos
    epoca = epoca + 1;
end
end





