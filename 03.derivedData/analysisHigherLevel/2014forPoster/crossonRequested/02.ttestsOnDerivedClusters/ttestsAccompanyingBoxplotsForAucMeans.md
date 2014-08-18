Bruce's t-tests matching his requested plots
==============================================
Bruce requested these t-tests as quantative measures that help describe the relationships pictured in the poster's boxplots.


1. Five t-tests comparing B-A within cluster
-----------------------------------------------
Sign of t-statistics reflects old minus young.
```
t.test(individualAUC~GROUP, alternative='two.sided', conf.level=.95, var.equal=FALSE, data=clust1.BminuA)

   Welch Two Sample t-test

   data:  individualAUC by GROUP
   t = -4.9527, df = 19.192, p-value = 8.593e-05
   alternative hypothesis: true difference in means is not equal to 0
   95 percent confidence interval:
    -3.218485 -1.307198
    sample estimates:
      mean in group Old mean in group Young 
               -0.7183004           1.5445412 
```
```
t.test(individualAUC~GROUP, alternative='two.sided', conf.level=.95, var.equal=FALSE, data=clust2.BminusA)

   Welch Two Sample t-test

   data:  individualAUC by GROUP
   t = -5.0366, df = 22.855, p-value = 4.335e-05
   alternative hypothesis: true difference in means is not equal to 0
   95 percent confidence interval:
    -2.918372 -1.218616
    sample estimates:
      mean in group Old mean in group Young 
                0.5691075           2.6376019 


```
```
t.test(individualAUC~GROUP, alternative='two.sided', conf.level=.95, var.equal=FALSE, data=clust3.BminusA)

   Welch Two Sample t-test

   data:  individualAUC by GROUP
   t = -5.7106, df = 27.126, p-value = 4.475e-06
   alternative hypothesis: true difference in means is not equal to 0
   95 percent confidence interval:
    -2.432268 -1.146646
    sample estimates:
      mean in group Old mean in group Young 
               -0.9652123           0.8242444 


```
```
 t.test(individualAUC~GROUP, alternative='two.sided', conf.level=.95, var.equal=FALSE, data=clust4.BminusA)

   Welch Two Sample t-test

   data:  individualAUC by GROUP
   t = -4.5054, df = 25.823, p-value = 0.0001257
   alternative hypothesis: true difference in means is not equal to 0
   95 percent confidence interval:
    -2.833672 -1.057701
    sample estimates:
      mean in group Old mean in group Young 
               0.08195605          2.02764245 


```
```
t.test(individualAUC~GROUP, alternative='two.sided', conf.level=.95, var.equal=FALSE, data=clust7.BminusA)

   Welch Two Sample t-test

   data:  individualAUC by GROUP
   t = -6.2988, df = 25.557, p-value = 1.236e-06
   alternative hypothesis: true difference in means is not equal to 0
   95 percent confidence interval:
    -6.631580 -3.366204
    sample estimates:
      mean in group Old mean in group Young 
                -1.890625            3.108266 
```



2. Five t-tests comparing within-cluster young: TaskB vs TaskA paired within participant
-----------------------------------------------------------------------------------------
Signs of t-statistic and mean difference reflect TaskB minus TaskA.

```
> t.test(clust1.young.A.And.B.wide$TaskB, clust1.young.A.And.B.wide$TaskA, alternative='two.sided', conf.level=.95, paired=TRUE)

   Paired t-test

   data:  clust1.young.A.And.B.wide$TaskB and clust1.young.A.And.B.wide$TaskA
   t = 3.6912, df = 14, p-value = 0.002419
   alternative hypothesis: true difference in means is not equal to 0
   95 percent confidence interval:
    0.6470898 2.4419939
    sample estimates:
    mean of the differences 
                   1.544542 

```
```
> t.test(clust2.young.A.And.B.wide$TaskB, clust2.young.A.And.B.wide$TaskA, alternative='two.sided', conf.level=.95, paired=TRUE)

   Paired t-test

   data:  clust2.young.A.And.B.wide$TaskB and clust2.young.A.And.B.wide$TaskA
   t = 7.4798, df = 14, p-value = 2.968e-06
   alternative hypothesis: true difference in means is not equal to 0
   95 percent confidence interval:
    1.881293 3.393917
    sample estimates:
    mean of the differences 
                   2.637605 


```
```
> t.test(clust3.young.A.And.B.wide$TaskB, clust3.young.A.And.B.wide$TaskA, alternative='two.sided', conf.level=.95, paired=TRUE)

   Paired t-test

   data:  clust3.young.A.And.B.wide$TaskB and clust3.young.A.And.B.wide$TaskA
   t = 4.1066, df = 14, p-value = 0.001068
   alternative hypothesis: true difference in means is not equal to 0
   95 percent confidence interval:
    0.3937616 1.2547243
    sample estimates:
    mean of the differences 
                   0.824243 
```
```
> t.test(clust4.young.A.And.B.wide$TaskB, clust4.young.A.And.B.wide$TaskA, alternative='two.sided', conf.level=.95, paired=TRUE)

   Paired t-test

   data:  clust4.young.A.And.B.wide$TaskB and clust4.young.A.And.B.wide$TaskA
   t = 5.8453, df = 14, p-value = 4.253e-05
   alternative hypothesis: true difference in means is not equal to 0
   95 percent confidence interval:
    1.283655 2.771628
    sample estimates:
    mean of the differences 
                   2.027641 

```
```
> t.test(clust7.young.A.And.B.wide$TaskB, clust7.young.A.And.B.wide$TaskA, alternative='two.sided', conf.level=.95, paired=TRUE)

   Paired t-test

   data:  clust7.young.A.And.B.wide$TaskB and clust7.young.A.And.B.wide$TaskA
   t = 6.6639, df = 14, p-value = 1.072e-05
   alternative hypothesis: true difference in means is not equal to 0
   95 percent confidence interval:
    2.107867 4.108673
    sample estimates:
    mean of the differences 
                    3.10827 
```


3. Five t-tests comparing within-cluster old: TaskB vs TaskA paired within participant
---------------------------------------------------------------------------------------
Signs of t-statistic and mean difference reflect TaskB minus TaskA.

```
> t.test(clust1.old.A.And.B.wide$TaskB, clust1.old.A.And.B.wide$TaskA, alternative='two.sided', conf.level=.95, paired=TRUE)

   Paired t-test

   data:  clust1.old.A.And.B.wide$TaskB and clust1.old.A.And.B.wide$TaskA
   t = -3.9149, df = 14, p-value = 0.001556
   alternative hypothesis: true difference in means is not equal to 0
   95 percent confidence interval:
    -1.1118256 -0.3247756
    sample estimates:
    mean of the differences 
                 -0.7183006 

```
```
> t.test(clust2.old.A.And.B.wide$TaskB, clust2.old.A.And.B.wide$TaskA, alternative='two.sided', conf.level=.95, paired=TRUE)

   Paired t-test

   data:  clust2.old.A.And.B.wide$TaskB and clust2.old.A.And.B.wide$TaskA
   t = 2.7033, df = 14, p-value = 0.01715
   alternative hypothesis: true difference in means is not equal to 0
   95 percent confidence interval:
    0.1175764 1.0206431
    sample estimates:
    mean of the differences 
                  0.5691097 

```
```
> t.test(clust3.old.A.And.B.wide$TaskB, clust3.old.A.And.B.wide$TaskA, alternative='two.sided', conf.level=.95, paired=TRUE)

   Paired t-test

   data:  clust3.old.A.And.B.wide$TaskB and clust3.old.A.And.B.wide$TaskA
   t = -4.0111, df = 14, p-value = 0.001288
   alternative hypothesis: true difference in means is not equal to 0
   95 percent confidence interval:
    -1.4813231 -0.4490948
    sample estimates:
    mean of the differences 
                 -0.9652089 
```
```
> t.test(clust4.old.A.And.B.wide$TaskB, clust4.old.A.And.B.wide$TaskA, alternative='two.sided', conf.level=.95, paired=TRUE)

   Paired t-test

   data:  clust4.old.A.And.B.wide$TaskB and clust4.old.A.And.B.wide$TaskA
   t = 0.3186, df = 14, p-value = 0.7547
   alternative hypothesis: true difference in means is not equal to 0
   95 percent confidence interval:
    -0.4697622  0.6336768
    sample estimates:
    mean of the differences 
                 0.08195731 

```
```
> t.test(clust7.old.A.And.B.wide$TaskB, clust7.old.A.And.B.wide$TaskA, alternative='two.sided', conf.level=.95, paired=TRUE)

   Paired t-test

   data:  clust7.old.A.And.B.wide$TaskB and clust7.old.A.And.B.wide$TaskA
   t = -2.9445, df = 14, p-value = 0.01066
   alternative hypothesis: true difference in means is not equal to 0
   95 percent confidence interval:
    -3.2677634 -0.5134903
    sample estimates:
    mean of the differences 
                  -1.890627 

```
