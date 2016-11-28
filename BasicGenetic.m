%pdist2 求汉明距离的方法
%自己写个求汉明距离的方法 Hamming_distance

function [Task,Sample_M,Fitness_M,R_prod_pool,Crossover_M]= BasicGenetic(Cible_M)
%Possibiity of mutation
pos_mut = 0.1;
%number of repetition
repetition=1000;
%Initialize Task
%DataString=round(rand(1,100));
%Cible_M=round(rand(7,7));
Task=reshape(Cible_M,1,prod(size(Cible_M)));
Sample_M=round(rand(10,prod(size(Cible_M))));
[rang,colonne]=size(Sample_M);
for P=1:repetition
    
   % Fitness_M=zeros(rang,1);
    for R=1:rang
        Fitness_M(R,:) =Hamming_distance(Sample_M(R,:),Task);
    end

    %Resort fitness for each line of DataString_M    
    
    min_tmp=min(Fitness_M);
    avg_tmp=mean(Fitness_M);
   % Fitness_Category=zeros(10,1);
        for I=1:rang
            if Fitness_M(I,:)==min_tmp
                Fitness_Category(I,:)=3;
            elseif ((Fitness_M(I,:)<=avg_tmp)&&(Fitness_M(I,:)>min_tmp))
                Fitness_Category(I,:)=2;
            else
                Fitness_Category(I,:)=1;
            end
        end
      %=========================================Reproduction Pool =================================================
        % Reproduction Pool start
       R_prod_pool=Sample_M;
        for Q=1:rang
            if(Fitness_Category(Q,:)==1)
               R_prod_pool(Q,:)=Sample_M(Q,:);
            elseif(Fitness_Category(Q,:)==2)
                R_prod_pool=[R_prod_pool;Sample_M(Q,:)];
            else
                R_prod_pool=[R_prod_pool;Sample_M(Q,:);Sample_M(Q,:)];
            end
        end
      % Reproduction Pool end
 
      
      %=========================================Crossover Pool =================================================
      %Selection top 10% of original sample pool and rest 90% from R_prod_pool
        Sample_with_fitness=[Sample_M Fitness_M];
        Sample_with_fitness=sortrows(Sample_with_fitness,colonne+1);
        selection_rang=round(rang*0.1)+1;
        Sample_top=Sample_with_fitness(1:selection_rang,1:colonne);
        [toprang,topcol]=size(Sample_top);
       %Crossover start
       [rang_rpr_pool,colonne_rpr_pool]=size(R_prod_pool);
        tmp_colonne_breakpoint=round(rand()*(colonne_rpr_pool-1)+1);
        head=R_prod_pool(:,1:tmp_colonne_breakpoint);
        tail=R_prod_pool(:,tmp_colonne_breakpoint+1:colonne_rpr_pool);
        tail=(tail(randperm(rang_rpr_pool),:));
        Cr_tmp_Mixe=[head tail];
       for R=1:(rang-toprang)
          tmp_line=round(rand()*(rang_rpr_pool-1)+1);
          tmp_Cros_line=Cr_tmp_Mixe(tmp_line,1:colonne_rpr_pool);
          Crossover_bottom(R,:)=tmp_Cros_line;
          
       end
          
       %Crossover end
       
%=========================================Mutation Pool =================================================
        [i,j]=size(Crossover_bottom);
        muta_line=round(rand()*(i-1)+1);
        muta_colonne=round(rand()*(j-1)+1);
       % for I=1:i
      %      for J=1;j
                %if rand<pos_mut
                    if(Crossover_bottom(muta_line,muta_colonne)==1)
                        Crossover_bottom(muta_line,muta_colonne)=0;
                    else
                        Crossover_bottom(muta_line,muta_colonne)=1;
                    end
                %end
           % end
     %   end
       Crossover_M=[Sample_top;Crossover_bottom];
       Sample_M=Crossover_M;
       best_sample=Crossover_M(1,:);
       image=reshape(best_sample,7,7);
       imagesc(image);
       drawnow;
    
    end
       
 end
