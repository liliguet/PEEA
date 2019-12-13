function PEEA(Global)
% <algorithm> <P>
% PEEA 
   
    %% Generate random population
    
    Population = Global.Initialization();
    [Fitness,extreme]    = CalFitness(Population.objs);
    
    %% Optimization
    while Global.NotTermination(Population)
       
       [Fitness,extreme]    = CalFitness(Population.objs);
        MatingPool = MatingSelection(Population.objs);
        Offspring  = GA(Population(MatingPool));
        Population = EnvironmentalSelection([Population,Offspring],Global.N); 
        
    end
end