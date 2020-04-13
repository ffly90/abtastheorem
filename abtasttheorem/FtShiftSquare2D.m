function [result]=FtShiftSquare2D(kx,ky,xOffset, yOffset, Delta)
%
%
result=FtSquare2D(kx,ky,Delta);
result=result*exp(i*(-1)*kx*xOffset);
result=result*exp(i*(-1)*ky*yOffset);
end
