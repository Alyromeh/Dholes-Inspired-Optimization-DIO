%___________________________________________________________________%
%  Dholes-Inspired Optimization (DIO) Algorithm - Version 1.0       %
%                                                                   %
%  Developed in MATLAB R2023a                                       %
%                                                                   %
%  Author and programmer: Ali El Romeh                              %
%                                                                   %
%         e-Mail: ali.elromeh@torrens.edu.au                        %
%                                                                   %
%       GitHub Repository:                                          %
%       https://github.com/Alyromeh/Dholes-Inspired-Optimization-DIO
%                                                                   %
%       MATLAB File Exchange:                                       %
%       https://au.mathworks.com/matlabcentral/fileexchange/181141-dholes-inspired-optimization-dio
%
%   Main Paper:                                                     %
%   "Dholes-Inspired Optimization (DIO): A Nature-Inspired          %
%   Algorithm for Engineering Optimization Problems"                %
%   Authors: Ali El Romeh, Vaclav Snasel, Seyedali Mirjalili        %
%   DOI: []                                                         %
%                                                                   %
%___________________________________________________________________%
%

function [lb,ub,dim,fobj] = Get_Functions_details(F)


switch F
    case 'F1'
        fobj = @F1;
        lb=-100;
        ub=100;
        dim=2;
     
       
    case 'F10'
        fobj = @F10;
        lb=-32;
        ub=32;
        dim=30;        
    
    case 'F15'
        fobj = @F15;
        lb=-5;
        ub=5;
        dim=4;
       
        
    case 'F23'
        fobj = @F23;
        lb=0;
        ub=10;
        dim=4;            
end

end

% F1

function o = F1(x)
o=sum(x.^2);
end



% F10

function o = F10(x)
dim=size(x,2);
o=-20*exp(-.2*sqrt(sum(x.^2)/dim))-exp(sum(cos(2*pi.*x))/dim)+20+exp(1);
end



% F15

function o = F15(x)
aK=[.1957 .1947 .1735 .16 .0844 .0627 .0456 .0342 .0323 .0235 .0246];
bK=[.25 .5 1 2 4 6 8 10 12 14 16];bK=1./bK;
o=sum((aK-((x(1).*(bK.^2+x(2).*bK))./(bK.^2+x(3).*bK+x(4)))).^2);
end



% F23

function o = F23(x)
aSH=[4 4 4 4;1 1 1 1;8 8 8 8;6 6 6 6;3 7 3 7;2 9 2 9;5 5 3 3;8 1 8 1;6 2 6 2;7 3.6 7 3.6];
cSH=[.1 .2 .2 .4 .4 .6 .3 .7 .5 .5];

o=0;
for i=1:10
    o=o-((x-aSH(i,:))*(x-aSH(i,:))'+cSH(i))^(-1);
end
end

function o=Ufun(x,a,k,m)
o=k.*((x-a).^m).*(x>a)+k.*((-x-a).^m).*(x<(-a));
end