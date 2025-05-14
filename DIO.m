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

function [best_score, best_pos, Convergence_curve, D_positions, fitness_history] = DIO(SearchAgents_no, Max_iter, lb, ub, dim, fobj)

    % Initialization
    D = repmat(lb, SearchAgents_no, 1) + repmat((ub-lb), SearchAgents_no, 1) .* rand(SearchAgents_no, dim);
    lead_vocalizer_pos = zeros(1, dim);
    lead_vocalizer_score = inf;
    Convergence_curve = zeros(1, Max_iter);
    D_positions = zeros(Max_iter, SearchAgents_no, dim);
    fitness_history = zeros(SearchAgents_no, Max_iter);

    t = 0;
    while t < Max_iter
        % Evaluate the fitness of each agent and update the lead vocalizer
        for i = 1:SearchAgents_no
            Flags = D(i,:) > ub | D(i,:) < lb;
            D(i,:) = (D(i,:) .* (~Flags)) + ((lb + rand(1,dim).*(ub-lb)) .* Flags);
            fitness = fobj(D(i,:));
            fitness_history(i, t+1) = fitness; % Store fitness
            if fitness < lead_vocalizer_score
                lead_vocalizer_score = fitness;
                lead_vocalizer_pos = D(i,:);
            end
        end
        D_positions(t+1, :, :) = D; % Store positions
        V = 2 - t * (2 / Max_iter);
        fprintf('At iteration %d the best score obtained so far is %g\n', t, lead_vocalizer_score);

        % Determine phase (0 for exploration, 1 for exploitation)
        phase = mod(floor(t / (Max_iter / 4)), 2);

        % Update positions based on phase
        for i = 1:SearchAgents_no
            if phase == 0  % Exploration phase
                if rand() < 0.5
                    % Random Exploration for half of the agents
                    D(i,:) = lb + rand(1, dim) .* (ub-lb);
                else
                    % Follow the lead vocalizer with added noise
                    r = rand();
                    B = V * r^2 - V;
                    C = r + sin(r * pi);
                    D_lead = abs(C * lead_vocalizer_pos.^2 - D(i,:).^2);
                    X_lead = lead_vocalizer_pos - B * sqrt(abs(D_lead));
                    neighbors_influence = mean(D) - D(i,:);

                    % Variable random weights for leader and neighbors influence
                    w1 = rand();
                    w2 = 1 - w1;

                    D(i,:) = w1 .* X_lead + w2 .* neighbors_influence + randn(1, dim) .* (ub - lb) * 0.1;
                end
            else  % Exploitation phase
                r = rand();
                B = V * r^2 - V;
                C = r + sin(r * pi);
                D_lead = abs(C * lead_vocalizer_pos.^2 - D(i,:).^2);
                X_lead = lead_vocalizer_pos - B * sqrt(abs(D_lead));
                neighbors_influence = mean(D) - D(i,:);

                % Variable random weights for leader and neighbors influence
                w1 = rand();
                w2 = 1 - w1;

                D(i,:) = w1 .* X_lead + w2 .* neighbors_influence;
            end
        end

        Convergence_curve(t+1) = lead_vocalizer_score;
        t = t + 1;
    end
    
    best_score = lead_vocalizer_score;
    best_pos = lead_vocalizer_pos;
    
    display(['The best solution obtained by DIO is : ', num2str(best_pos)]);
    display(['The best optimal value of the objective function found by DIO is : ', num2str(best_score)]);
end
