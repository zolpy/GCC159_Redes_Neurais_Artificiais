//Pratica 1 colocar cabeçario
//Luiz Carlos Brandão Junior
//And
//f(u)=1 se u>0 e f(u)=0 se u <0
//y=[0 0 0 1]
clear;
clc;
b=-0.6;
//w1=0.4;
//w2=0.4;
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
x=[0 1 0 1;0 0 1 1];// matriz AND
w=[0.7 0.8];

////b=[];
y=yperceptron(x,w,b);
disp(y)
