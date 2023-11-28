classdef PEARRTstarclass < RRTStarClass
    properties
        tree_goal  % Additional property to store the goal tree
    end
    methods
        function obj = PEARRTstarclass(map, uav_spec)
            obj = obj@RRTStarClass(map, uav_spec);
            obj.tree_goal = [];
        end
        function [tree, tree_goal, goal_id] = do_bidirectional_plan(obj, tree, tree_goal)
            goal_id = -1;
            cost_opt = inf;
            for i = 1:1:obj.i_rrt
                % Expansion from the start tree
                [tree, goal_id] = obj.do_plan(tree);
                % Expansion from the goal tree
                [tree_goal, goal_id_goal] = obj.do_plan(tree_goal);
                % Check for intersection of trees
                [common_node, common_flag] = obj.check_intersection(tree, tree_goal);
                if common_flag
                    % Potential path found; construct the final path
                    final_path = obj.construct_final_path(tree, tree_goal, goal_id, goal_id_goal, common_node);
                    % Optimize the final path
                    final_path = obj.optimize_final_path(final_path);
                    % Visualization or other post-processing steps
                    obj.plot_final_path(final_path);
                    obj.plot_trees_expansion(tree, tree_goal);

                    return;
                end
            end
        end

        function [common_node, common_flag] = check_intersection(obj, tree, tree_goal)
            % Check if there is any common node between the two trees
            common_flag = false;
            common_node = [];
            for i = 1:size(tree, 1)
                for j = 1:size(tree_goal, 1)
                    % Check if the nodes are close enough (you can define a distance threshold)
                    dist = sqrt((tree(i, 1) - tree_goal(j, 1))^2 + (tree(i, 2) - tree_goal(j, 2))^2);
                    if dist < obj.goal_diff
                        common_flag = true;
                        common_node = [tree(i, 1), tree(i, 2)];
                        return;
                    end
                end
            end
        end
        function final_path = construct_final_path(obj, tree, tree_goal, goal_id, goal_id_goal, common_node)
            % Construct the final path by connecting the start and goal trees
            path_start = obj.construct_path(tree, goal_id, common_node);
            path_goal = obj.construct_path(tree_goal, goal_id_goal, common_node);
            % Concatenate the paths
            final_path = [flipud(path_start); path_goal(2:end, :)];
        end
        function path = construct_path(obj, tree, goal_id, common_node)
            % Construct a path from the root to the common node
            path = [];
            node_id = goal_id;
            while node_id ~= -1
                path = [path; tree(node_id, 1:2)];
                node_id = tree(node_id, 5);
            end
            % Add the common node to the path
            path = [path; common_node];
        end
        function final_path = optimize_final_path(obj, path)
            % Additional optimization steps specific to Bidirectional RRT*
            % You can implement further optimization or smoothing techniques here
            final_path = path;  % Placeholder; replace with actual optimization steps
        end
        function plot_final_path(obj, final_path)
            % Visualize the final optimized path
            figure;
            plot(final_path(:, 1), final_path(:, 2), 'r-', 'LineWidth', 2);
            hold on;
            scatter(final_path(:, 1), final_path(:, 2), 'b', 'filled');
            xlabel('X-axis');
            ylabel('Y-axis');
            title('Optimized Path');
            axis equal;
            grid on;
        end
    end
end
