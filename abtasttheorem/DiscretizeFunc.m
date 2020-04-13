function [DiscFun, FuncStruc, DFunStruc] = DiscretizeFunc(L,N)
% Diskretisierung einer Funktion.
% Ergebnis:
% =========
% FuncMatrix: Matrix mit Eintraegen der Funktionswerte an den
% Stuetzstellen;
% Delta: berechnete Intervallgroesse;
%
% Parameter:
% ==========
% L: Seitenlaenge Bereich Funktion ungleich Null;
% N: Zahl der Intervalle;
% PlotFlag: Info ob Funktionen gezeichnet werden sollen.
%
FuncMatrix = zeros(N,N);
Delta = L/N;
for ix=1:N
    for iy=1:N
        xValue = (ix-0.5)*Delta;
        yValue = (0.5-iy)*Delta;
        %
        %
        xP = xValue-L/2;
        yP = yValue+L/2;
        % FuncMatrix(ix,iy)=exp((-1)*((xP*5)^2+(yP*5)^2));
        % FuncMatrix(ix,iy)=exp((-1)*sqrt((xP*10)^2+(yP*10)^2));
        FuncMatrix(ix,iy)=1/exp(1+(0.5*xP)^2+(0.5*yP)^2);
        %
        %
        endfor
        endfor
DiscFun.Delta = Delta;
DiscFun.Matrix =  FuncMatrix;
%
%
%
x = [0:Delta/10:L];
y = [0:(-1)*Delta/10:(-1)*L];
FuncStruc.xVec = x;
FuncStruc.yVec = y;
Func = zeros(length(x), length(y));
DFunc = Func;
for ix=1:1:length(x)-1
    for iy=1:1:length(y)-1
        %
        %
        xP=x(ix)-L/2;
        yP=y(iy)+L/2;
        Func(ix,iy)=1/exp(1+(0.5*xP)^2+(2*(0.5*yP)^2));
        %
        DFunc(ix,iy)=FuncMatrix(1+floor(x(ix)/Delta),1+floor((-1)*y(iy)/Delta));
        %
        %
        endfor
        endfor
FuncStruc.ImageMatrix = Func;
FuncStruc.Number = 1;
%
DFunStruc = FuncStruc;
DFunStruc.ImageMatrix = DFunc;
DFunStruc.Number = 2;
end
