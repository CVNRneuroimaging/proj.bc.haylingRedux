# per Bruce's request: within cluster t-tests for old vs young B-A values (independent samples, unequal variance)
t.test(individualAUC~GROUP, alternative='two.sided', conf.level=.95, var.equal=FALSE, data=clust1.BminusA)
t.test(individualAUC~GROUP, alternative='two.sided', conf.level=.95, var.equal=FALSE, data=clust2.BminusA)
t.test(individualAUC~GROUP, alternative='two.sided', conf.level=.95, var.equal=FALSE, data=clust3.BminusA)
t.test(individualAUC~GROUP, alternative='two.sided', conf.level=.95, var.equal=FALSE, data=clust4.BminusA)
t.test(individualAUC~GROUP, alternative='two.sided', conf.level=.95, var.equal=FALSE, data=clust7.BminusA)

# per Bruce's request: within cluster t-tests for TaskA vs Task B (paired within participant):
# ...for the young:
t.test(clust1.young.A.And.B.wide$TaskB, clust1.young.A.And.B.wide$TaskA, alternative='two.sided', conf.level=.95, paired=TRUE)
t.test(clust2.young.A.And.B.wide$TaskB, clust2.young.A.And.B.wide$TaskA, alternative='two.sided', conf.level=.95, paired=TRUE)
t.test(clust3.young.A.And.B.wide$TaskB, clust3.young.A.And.B.wide$TaskA, alternative='two.sided', conf.level=.95, paired=TRUE)
t.test(clust4.young.A.And.B.wide$TaskB, clust4.young.A.And.B.wide$TaskA, alternative='two.sided', conf.level=.95, paired=TRUE)
t.test(clust7.young.A.And.B.wide$TaskB, clust7.young.A.And.B.wide$TaskA, alternative='two.sided', conf.level=.95, paired=TRUE)
# ...and for the old:
t.test(clust1.old.A.And.B.wide$TaskB, clust1.old.A.And.B.wide$TaskA, alternative='two.sided', conf.level=.95, paired=TRUE)
t.test(clust2.old.A.And.B.wide$TaskB, clust2.old.A.And.B.wide$TaskA, alternative='two.sided', conf.level=.95, paired=TRUE)
t.test(clust3.old.A.And.B.wide$TaskB, clust3.old.A.And.B.wide$TaskA, alternative='two.sided', conf.level=.95, paired=TRUE)
t.test(clust4.old.A.And.B.wide$TaskB, clust4.old.A.And.B.wide$TaskA, alternative='two.sided', conf.level=.95, paired=TRUE)
t.test(clust7.old.A.And.B.wide$TaskB, clust7.old.A.And.B.wide$TaskA, alternative='two.sided', conf.level=.95, paired=TRUE)
