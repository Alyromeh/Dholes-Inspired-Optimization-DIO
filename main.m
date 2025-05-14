
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
% Usage:
% -------
% [Best_score, Best_pos, Convergence_curve, D_positions, fitness_history] = ...
%     DIO(SearchAgents_no, Max_iter, lb, ub, dim, fobj)
%
% Parameters:
% ------------
% SearchAgents_no   - Number of search agents (dholes in the pack)
% Max_iter          - Maximum number of iterations
% lb                - Lower bound (scalar or vector)
% ub                - Upper bound (scalar or vector)
% dim               - Dimensionality of the problem
% fobj              - Objective function handle
%
% Returns:
% --------
% Best_score        - Best objective value found
% Best_pos          - Best solution vector
% Convergence_curve - Array storing the best score per iteration
% D_positions       - Matrix storing positions of all dholes over time
% fitness_history   - Fitness values of all agents per iteration
%
% Description:
% ------------
% This algorithm is inspired by the cooperative hunting, vocalization,
% and territorial behavior of the Asiatic wild dog (dhole).
% It balances exploration and exploitation adaptively and is suitable
% for both unimodal and multimodal optimization problems.
%
% 
% 



clear all
clc

SearchAgents_no=100;
Function_name='F15';
Max_iteration=100;
[lb,ub,dim,fobj]=Get_Functions_details(Function_name);
[Best_score,Best_pos,DIO_cg_curve, D_positions, fitness_history] = DIO(SearchAgents_no,Max_iteration,lb,ub,dim,fobj);

figure('Position',[454   445   894   297])
% Draw search space
subplot(1,5,1);
func_plot(Function_name);
title('Parameter space')
xlabel('x_1');
ylabel('x_2');
zlabel([Function_name,'( x_1 , x_2 )'])

% Plotting search history
subplot(1,5,2);
hold on
for k1 = 1: size(D_positions,1)
    for k2 = 1: size(D_positions,2)
        plot(D_positions(k1,k2,1),D_positions(k1,k2,2),'.','markersize',1,'MarkerEdgeColor','k','markerfacecolor','k');
    end
end
plot(Best_pos(1),Best_pos(2),'.','markersize',10,'MarkerEdgeColor','r','markerfacecolor','r');
title('Search history (x1 and x2 only)')
xlabel('x1')
ylabel('x2')
box on
axis tight

% Plotting trajectory of 1st search agent
subplot(1,5,3);
hold on
plot(squeeze(D_positions(:, 1, 1)))
title('Trajectory of 1st Dhole')
xlabel('Iteration#')
box on
axis tight

% Plotting average fitness of all search agents
subplot(1,5,4);
hold on
plot(mean(fitness_history))
title('Average fitness of all Dholes')
xlabel('Iteration#')
box on
axis tight

% Draw objective space
subplot(1,5,5);
semilogy(DIO_cg_curve,'Color','r')
title('Convergence curve')
xlabel('Iteration');
ylabel('Best score obtained so far');
box on
axis tight
legend('DIO')

display(['The best solution obtained by DIO is : ', num2str(Best_pos)]);
display(['The best optimal value of the objective funciton found by DIO is : ', num2str(Best_score)]);
