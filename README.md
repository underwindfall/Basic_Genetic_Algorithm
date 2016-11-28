# Basic_Genetic_Algorithm
一个给基因遗传算法写的东西
---
![](https://github.com/underwindfall/Basic_Genetic_Algorithm/blob/master/achievement.jpg)
---

## 遗传算法
在这个算法中，使用的是最基本的学习模式。首先，算法随机生成一定数量的个体。在每一代中，都会评价每一个体，并通过计算适应度函数得到适应度数值。
这里用的是Hamming Distance.

-   进行按照适应度排序种群个体，适应度高的在前面。产生***Reproduction Pool***.
-   选取适应度最好的百分之十作为新的***Crossover Pool*** 的Top选项。
-   随机选取***Reproduction Pool***的两行数据，在随机断点处分割交换。目的是为了打乱这个剩余***Crossover Pool***的剩下序列
-   获得临时矩阵***Cross_tmp***
-   对出top之外的临时矩阵***Cross_tmp***进行突变（mutation），一般遗传算法都有一个固定的突变常数（又称为变异概率），通常是0.1或者更小，这代表变异发生的概率。根据这个概率，新个体的染色体随机的突变，通常就是改变染色体的一个字节（0变到1，或者1变到0）。

