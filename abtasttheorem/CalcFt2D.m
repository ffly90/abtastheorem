function [AbsStruc, ArgStruc]=CalcFt2D(FuncStruc, kVec)
%
%
%
%
FuncMatrix = FuncStruc.Matrix;
Delta = FuncStruc.Delta;
%
kFuncMatrix=zeros(length(kVec), length(kVec));
kxVec = kVec;
kyVec = kVec;
for ikx = 1:length(kxVec)
    for iky = 1:length(kyVec)
        %
        kx = kxVec(ikx);
        ky = kyVec(iky);
        Value = 0;
        for ix=1:length(FuncMatrix(:,1))
            for iy=1:length(FuncMatrix(1,:))
                xOffset = (ix-0.5)*Delta;
                yOffset = (0.5-iy)*Delta;
                intValue = FtShiftSquare2D(kx,ky, xOffset, yOffset, Delta);
                intValue = intValue*FuncMatrix(ix,iy);
                intValue = intValue*Delta^2;
                %
                Value = Value + intValue;
                endfor
                endfor
                % fprintf("%d-%d", ikx, iky);
        kFuncMatrix(ikx,iky) = Value; 
        %
        endfor
        endfor
        %
 AbsStruc.xVec = kxVec;
 AbsStruc.yVec = kyVec;
 AbsStruc.Number = 3;
 AbsStruc.ImageMatrix = abs(kFuncMatrix);
 %
 ArgStruc = AbsStruc;
 ArgStruc.Number = 4;
 ArgStruc.ImageMatrix = arg(kFuncMatrix);
 end
    
