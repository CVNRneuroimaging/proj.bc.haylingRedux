Bruce's t-tests matching his requested plots
==============================================


1. Five t-tests comparing B-A within cluster
-----------------------------------------------
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



2. Five t-tests comparing within-cluster young: TaskA vs TaskB
-----------------------------------------------

```
t.testt(individualAUC~CONDITION, alternative='two.sided', conf.level=.95, var.equal=FALSE, data=clust1.young.A.and.B)

   Welch Two Sample t-test

   data:  individualAUC by CONDITION
   t = -3.0615, df = 25.899, p-value = 0.00508
   alternative hypothesis: true difference in means is not equal to 0
   95 percent confidence interval:
    -2.5817695 -0.5073142
    sample estimates:
    mean in group TaskA mean in group TaskB 
            -0.08546793          1.45907393 


```
```
t.test(individualAUC~CONDITION, alternative='two.sided', conf.level=.95, var.equal=FALSE, data=clust2.young.A.and.B)

   Welch Two Sample t-test

   data:  individualAUC by CONDITION
   t = -4.0683, df = 25.107, p-value = 0.0004128
   alternative hypothesis: true difference in means is not equal to 0
   95 percent confidence interval:
    -3.972566 -1.302644
    sample estimates:
    mean in group TaskA mean in group TaskB 
              -1.312639            1.324965 


```
```
t.test(individualAUC~CONDITION, alternative='two.sided', conf.level=.95, var.equal=FALSE, data=clust3.young.A.and.B)

   Welch Two Sample t-test

   data:  individualAUC by CONDITION
   t = -2.4356, df = 27.977, p-value = 0.02149
   alternative hypothesis: true difference in means is not equal to 0
   95 percent confidence interval:
    -1.5174856 -0.1310003
    sample estimates:
    mean in group TaskA mean in group TaskB 
             -0.2996914           0.5245516 


```
```
t.test(individualAUC~CONDITION, alternative='two.sided', conf.level=.95, var.equal=FALSE, data=clust4.young.A.and.B)

   Welch Two Sample t-test

   data:  individualAUC by CONDITION
   t = -2.8906, df = 27.892, p-value = 0.007366
   alternative hypothesis: true difference in means is not equal to 0
   95 percent confidence interval:
    -3.4647783 -0.5905039
    sample estimates:
    mean in group TaskA mean in group TaskB 
              0.3547997           2.3824409 


```
```
t.test(individualAUC~CONDITION, alternative='two.sided', conf.level=.95, var.equal=FALSE, data=clust7.young.A.and.B)

   Welch Two Sample t-test

   data:  individualAUC by CONDITION
   t = -2.6781, df = 27.999, p-value = 0.01225
   alternative hypothesis: true difference in means is not equal to 0
   95 percent confidence interval:
    -5.4857068 -0.7308329
    sample estimates:
    mean in group TaskA mean in group TaskB 
               3.070309            6.178579 
```


3. Five t-tests comparing within-cluster old: TaskA vs TaskB
-----------------------------------------------

```
t.test(individualAUC~CONDITION, alternative='two.sided', conf.level=.95, var.equal=FALSE, data=clust1.old.A.and.B)

   Welch Two Sample t-test

   data:  individualAUC by CONDITION
   t = 2.5908, df = 27.314, p-value = 0.01519
   alternative hypothesis: true difference in means is not equal to 0
   95 percent confidence interval:
    0.1497293 1.2868719
    sample estimates:
    mean in group TaskA mean in group TaskB 
              0.2185007          -0.4997999 


```
```
t.test(individualAUC~CONDITION, alternative='two.sided', conf.level=.95, var.equal=FALSE, data=clust2.old.A.and.B)

   Welch Two Sample t-test

   data:  individualAUC by CONDITION
   t = -0.9944, df = 28, p-value = 0.3286
   alternative hypothesis: true difference in means is not equal to 0
   95 percent confidence interval:
    -1.7414916  0.6032721
    sample estimates:
    mean in group TaskA mean in group TaskB 
               1.606542            2.175652 


```
```
t.test(individualAUC~CONDITION, alternative='two.sided', conf.level=.95, var.equal=FALSE, data=clust3.old.A.and.B)

   Welch Two Sample t-test

   data:  individualAUC by CONDITION
   t = 1.0369, df = 26.569, p-value = 0.3091
   alternative hypothesis: true difference in means is not equal to 0
   95 percent confidence interval:
    -0.9462701  2.8766879
    sample estimates:
    mean in group TaskA mean in group TaskB 
             -0.9203529          -1.8855618 


```
```
t(individualAUC~CONDITION, alternative='two.sided', conf.level=.95, var.equal=FALSE, data=clust4.old.A.and.B)

   Welch Two Sample t-test

   data:  individualAUC by CONDITION
   t = -0.1481, df = 26.959, p-value = 0.8833
   alternative hypothesis: true difference in means is not equal to 0
   95 percent confidence interval:
    -1.217291  1.053376
    sample estimates:
    mean in group TaskA mean in group TaskB 
               1.191410            1.273367 


```
```
t.test(individualAUC~CONDITION, alternative='two.sided', conf.level=.95, var.equal=FALSE, data=clust7.old.A.and.B)

   Welch Two Sample t-test

   data:  individualAUC by CONDITION
   t = 0.7104, df = 27.443, p-value = 0.4835
   alternative hypothesis: true difference in means is not equal to 0
   95 percent confidence interval:
    -3.566099  7.347353
    sample estimates:
    mean in group TaskA mean in group TaskB 
               3.379796            1.489169 
```
