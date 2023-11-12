%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% main_plan.m 
%%% for main function for simulation
%%% 
%%% 2.10.2023 First edit: R.Takemura
%%% 9.19.2023 Last edit: R.Takemura
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all;
close all;
set(0,'DefaultAxesFontSize', 18, 'DefaultAxesFontName', 'Arial');%フォント
set(0,'DefaultAxesLinewidth',2); %枠の太さ
set(0,'DefaultLineLinewidth',2); %グラフの太さ

uav_spec = UAVSpec(12,6);
map = Map(250, 250, 'maps/imageMap2.png', uav_spec);
map.gen_pq_map(map.map);

plan_num = 1;
cost_l = [];
E_l = [];
PQ_l = [];
t_l = [];

planner = BidirectionalRRTStarClass(map, uav_spec);
for i=1:1:plan_num
    disp("Repeat num.: "+i)
    
    tree = planner.initRRT(30, 30, 0, 230, 230);
    [tree goal_id] = planner.do_plan(tree);
    %disp(tree);
    disp(goal_id);
    if goal_id ~= -1
        [cost E PQ t] = planner.plot_v_E_P_result(tree, goal_id);
        cost_l = [cost_l cost];
        E_l = [E_l E];
        PQ_l = [PQ_l PQ];
        t_l = [t_l t];
    end
end

if goal_id ~= -1
    planner.final_smoother(tree, goal_id);
    planner.plot_v_E_P_result(tree, goal_id);
end

% EOF ------------------------------------------------------------

