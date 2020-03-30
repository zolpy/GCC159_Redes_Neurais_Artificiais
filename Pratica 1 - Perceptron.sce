//1a EXPERIÊNCIA: Perceptron
//Aluno de Mestrado: Luiz Carlos Brandão Junior
//f(u)=1 se u>0 e f(u)=0 se u <0
//y=[0 0 0 1] a saida para o AND

clear;
clc;

//Declaração das Variaveis e seus valores
b=-0.6;
w1=0.4;
w2=0.4;
w3=0.7;
w4=0.8;

//declaraçã das funções

function y = yperceptron(x,w,b)
    u=w*x+b;
    y=[];
    for i = 1:length(u)

        if (u(i)>0) then

            y=[y 1];

        elseif(u(i)<0)
            y=[y 0];

        end
    end
endfunction

//programa principal
x=[0 1 0 1;0 0 1 1];
w=[w1 w2];
y=yperceptron(x,w,b);
disp(y,"Matriz AND: ")


w=[w3 w4];
y=yperceptron(x,w,b);
disp(y,"Matriz OR: ")
