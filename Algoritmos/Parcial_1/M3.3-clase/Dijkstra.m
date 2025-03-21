function [r,c,A] = dijkstra(G,initialNode,finalNode)
%%
%Another single-function implementation of Dijkstra's Algorithm for shorter path finding in a directed matrix-graph
%Didactic reference: https://youtu.be/bZkzH5x0SKU
%
%[route, cost, M] = dijkstra(G, initialNode, finalNode)
%
%Interpretation of the columns of the Dijkstra matrix M
%Node number | best previous node | cumulative path cost | node visited
%
%Example: G(a,b)=z defines a directional link from (only) the node a to b, use G(b,a)=w to link from b to a
% G = [;
%      0     1     0     0     0     0     0;
%      0     0     1     0     0    10     0;
%      2     0     0     1     0     0     0;
%      0     0     2     0     1     0     0;
%      0     0     0     2     0     1     0;
%      0     0     0     0     2     0     1;
%      0     0     0     0     0     2     0;
%      ];
%
% [r,c,W] = dijkstra(G,1,7)
% [r,c,W] = dijkstra(G,7,2)
% Author : Jordi Palacín
% Version: 1.0
% Web    : http://robotica.udl.cat
    % initialize
    numNodes = length(G);
    Empty = 0;
    A = zeros(numNodes,4);
    % matrix with
    % A(:,1) = first column is the Node number
    number = 1;
    % A(:,2) = second column is the best previous node
    previous = 2;
    % A(:,3) = third columnsis the score
    score = 3;
    % A(:,4) = fourth column is the visited status of the node
    visited = 4;
    for iNode = 1:1:numNodes
        A(iNode,number)   = iNode;
        A(iNode,score)    = Inf;
        A(iNode,visited)  = false;
        A(iNode,previous) = Empty;
    end
    
    % Check for isolated nodes and assign as visited
    for iNode = 1:1:numNodes
        if (sum(G(iNode,:)) == 0) && (sum(G(:,iNode)) == 0)
            A(iNode,visited)  = true;
        end
    end
    
    % Assign a score of 0 to the initial node
    A(initialNode,score) = 0;
    
    while 1
        % Select the unvisited node with the lowest score as the next node to be explored
        bestScoreNode = [];
        bestScore = Inf;
        for iNode = 1:1:numNodes
            if (A(iNode,visited) == 0) && (A(iNode,score) < bestScore)
                bestScoreNode = iNode;
                bestScore = A(iNode,score);
            end
        end
        
        if ~isempty(bestScoreNode)
            % Set the node selected as visited
            A(bestScoreNode,visited) = true;
            % Generate a list of unvisited linked nodes from the active node
            nodeList = [];
            for iNode = 1:1:numNodes
                if A(iNode,visited) == false
                    % is there any link
                    if (G(bestScoreNode,iNode) > 0)
                        nodeList = [nodeList iNode];
                    end
                end
            end
            % Are there any unvisited linked node unprocessed ?
            while ~isempty(nodeList)
                % Select a node from the list of unvisited nodes and remove from the list
                uvn = nodeList(1);
                nodeList(1) = [];
                % Compute a cumulative score for the unvisited node
                cumulativescore = A(bestScoreNode,score) + G(bestScoreNode,uvn);
                % Update the score of the unvisited node if it is lower that its current score
                if cumulativescore < A(uvn,score)
                    A(uvn,score) = cumulativescore;
                    A(uvn,previous) = bestScoreNode;
                end
                % Select the node processed as visited
                %A(uvn,visited) = true;
            end
        else
            break;
        end
        
        % Are there any node unvisited ?
        if (numNodes == sum(A(:,visited)))
            break;
        end
    end
    % Is the destination node visited ?
    if A(finalNode,visited) == true
        % Yes
        % Cost
        c = A(finalNode,score);
        
        % decode the path found
        % decoding estarting at the finalNode
        % but the decoded route starts at the initialNode
        r = [];
        iNode = finalNode;
        while (iNode ~= initialNode)
            r = [iNode r];
            iNode = A(iNode,previous);
        end
        r = [initialNode r];
        
    else
        % no path found
        r = [];
        c = [];
    end        
end