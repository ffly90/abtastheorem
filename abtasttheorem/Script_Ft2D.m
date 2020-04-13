function [] = Script_Ft2D(L,N,MaxK)
%
printf("[Discretize ---")
[DiscreteF, FuncStruc, DFunStruc] = DiscretizeFunc(L,N);
printf("]\n")
printf("[Create plots ---");
close all;
f1 = MySurfPlot(FuncStruc);
f2 = MySurfPlot(DFunStruc);
saveas(f1,strcat(num2str(N), "_OrigFunction"),"png");
saveas(f2,strcat(num2str(N), "_DiscFunction"),"png");
printf("]\n");
printf("[FT ---");
[AbsStruc, ArgStruc]=CalcFt2D(DiscreteF, [(-1)*MaxK:1:MaxK]);
printf("]\n");
printf("[Create plots ---");
close all;
f3 = MySurfPlot(AbsStruc);
f4 = MySurfPlot(ArgStruc);
saveas(f3,strcat(num2str(N),"_FtAbsolut"),"png");
saveas(f4,strcat(num2str(N),"_FtArgument"),"png");
close all;
% save -binary ScriptResults.mat DiscreteF AbsStruc ArgStruc 
printf("]\n");
% 
