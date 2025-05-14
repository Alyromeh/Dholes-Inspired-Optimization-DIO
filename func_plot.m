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
function func_plot(func_name)

[lb,ub,dim,fobj]=Get_Functions_details(func_name);

switch func_name 
    case 'F1' 
        x=-100:2:100; y=x; %[-100,100]
     
    case 'F10' 
        x=-20:0.5:20; y=x;%[-500,500]
    case 'F15' 
        x=-5:0.1:5; y=x;%[-5,5]
     
    case 'F23' 
        x=-5:0.1:5; y=x;%[-5,5]  
end    

    

L=length(x);
f=[];

for i=1:L
    for j=1:L
        if strcmp(func_name,'F15')==0 && strcmp(func_name,'F23')==0
            f(i,j)=fobj([x(i),y(j)]);
        end
        if strcmp(func_name,'F15')==1
            f(i,j)=fobj([x(i),y(j),0,0]);
        end
              
        if strcmp(func_name,'F23')==1
            f(i,j)=fobj([x(i),y(j),0,0]);
        end          
    end
end

surfc(x,y,f,'LineStyle','none');

end

