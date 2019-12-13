function MatingPool = MatingSelection(PopObj)
% The mating selection of PeEA

    N  = size(PopObj,1);
    
    [Fitness,extreme] = CalFitness(PopObj);
    Parents1   = randi(N,1,N);
    Parents2   = randi(N,1,N);
    Dominate   = any(PopObj(Parents1,:)<PopObj(Parents2,:),2) - any(PopObj(Parents1,:)>PopObj(Parents2,:),2);
    MatingPool = [Parents1(Dominate==1),...
                  Parents2(Dominate==-1),...
                  Parents1(Dominate==0 & Fitness(Parents1)<=Fitness(Parents2)),...
                  Parents2(Dominate==0 & Fitness(Parents1)>Fitness(Parents2))];
end
