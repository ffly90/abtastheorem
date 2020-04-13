function [result]=FtSquare2D(kx,ky,Delta)
%
%
if (kx!=0 && ky!=0)
    result=sin(kx*Delta/2)/(kx*Delta/2);
    result=result*sin(ky*Delta/2)/(ky*Delta/2);
    result=result*2/pi;
elseif (kx==0 && ky != 0)
    result=sin(ky*Delta/2)/(ky*Delta/2);
    result=result*2/pi;
elseif (kx!=0 && ky==0)
    result=sin(kx*Delta/2)/(kx*Delta/2);
    result=result*2/pi;
else
    result=2/pi;
end
