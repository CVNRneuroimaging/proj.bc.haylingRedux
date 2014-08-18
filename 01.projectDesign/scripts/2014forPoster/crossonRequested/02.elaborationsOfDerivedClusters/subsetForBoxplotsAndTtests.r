# read in participant X ROI AUC means for each cluster
AUC <- read.table("/Users/stowler/Downloads/testAUC - testAUC.csv", 
  header=TRUE, sep=",", na.strings="NA", dec=".", strip.white=TRUE)

# subset into individual clusters:
clust1 <- subset(AUC, subset=CLUSTNUM == "clusterNumber1")
clust2 <- subset(AUC, subset=CLUSTNUM == "clusterNumber2")
clust3 <- subset(AUC, subset=CLUSTNUM == "clusterNumber3")
clust4 <- subset(AUC, subset=CLUSTNUM == "clusterNumber4")
clust7 <- subset(AUC, subset=CLUSTNUM == "clusterNumber7")

# subset B-A from other conditions for the sake of five B-A plots:
clust1.BminusA <- subset(clust1, subset=CONDITION == "TaskB-A")
clust2.BminusA <- subset(clust2, subset=CONDITION == "TaskB-A")
clust3.BminusA <- subset(clust3, subset=CONDITION == "TaskB-A")
clust4.BminusA <- subset(clust4, subset=CONDITION == "TaskB-A")
clust7.BminusA <- subset(clust7, subset=CONDITION == "TaskB-A")

# create a subset containing just TaskA and TaskB for the plots that compare condition within-group:
clust1.old.A.and.B <- subset(clust1, subset=(GROUP == "Old") & (CONDITION %in% c("TaskA","TaskB")))
clust2.old.A.and.B <- subset(clust2, subset=(GROUP == "Old") & (CONDITION %in% c("TaskA","TaskB")))
clust3.old.A.and.B <- subset(clust3, subset=(GROUP == "Old") & (CONDITION %in% c("TaskA","TaskB")))
clust4.old.A.and.B <- subset(clust4, subset=(GROUP == "Old") & (CONDITION %in% c("TaskA","TaskB")))
clust7.old.A.and.B <- subset(clust7, subset=(GROUP == "Old") & (CONDITION %in% c("TaskA","TaskB")))
clust1.young.A.and.B <- subset(clust1, subset=(GROUP == "Young") & (CONDITION %in% c("TaskA","TaskB")))
clust2.young.A.and.B <- subset(clust2, subset=(GROUP == "Young") & (CONDITION %in% c("TaskA","TaskB")))
clust3.young.A.and.B <- subset(clust3, subset=(GROUP == "Young") & (CONDITION %in% c("TaskA","TaskB")))
clust4.young.A.and.B <- subset(clust4, subset=(GROUP == "Young") & (CONDITION %in% c("TaskA","TaskB")))
clust7.young.A.and.B <- subset(clust7, subset=(GROUP == "Young") & (CONDITION %in% c("TaskA","TaskB")))
# ...and drop the now unused B-A factor level from the resulting subset
clust1.old.A.and.B$CONDITION<-factor(clust1.old.A.and.B$CONDITION)
clust2.old.A.and.B$CONDITION<-factor(clust2.old.A.and.B$CONDITION)
clust3.old.A.and.B$CONDITION<-factor(clust3.old.A.and.B$CONDITION)
clust4.old.A.and.B$CONDITION<-factor(clust4.old.A.and.B$CONDITION)
clust7.old.A.and.B$CONDITION<-factor(clust7.old.A.and.B$CONDITION)
clust1.young.A.and.B$CONDITION<-factor(clust1.young.A.and.B$CONDITION)
clust2.young.A.and.B$CONDITION<-factor(clust2.young.A.and.B$CONDITION)
clust3.young.A.and.B$CONDITION<-factor(clust3.young.A.and.B$CONDITION)
clust4.young.A.and.B$CONDITION<-factor(clust4.young.A.and.B$CONDITION)
clust7.young.A.and.B$CONDITION<-factor(clust7.young.A.and.B$CONDITION)

# dcast to wide format so paired t-tests can explicitly address TaskA and TaskB within participant:
# ...for the young:
clust1.young.A.And.B.wide <- dcast (clust1.young.A.and.B, CLUSTNUM + GROUP + PARTICIPANT ~ CONDITION, value.var="individualAUC")
clust2.young.A.And.B.wide <- dcast (clust2.young.A.and.B, CLUSTNUM + GROUP + PARTICIPANT ~ CONDITION, value.var="individualAUC")
clust3.young.A.And.B.wide <- dcast (clust3.young.A.and.B, CLUSTNUM + GROUP + PARTICIPANT ~ CONDITION, value.var="individualAUC")
clust4.young.A.And.B.wide <- dcast (clust4.young.A.and.B, CLUSTNUM + GROUP + PARTICIPANT ~ CONDITION, value.var="individualAUC")
clust7.young.A.And.B.wide <- dcast (clust7.young.A.and.B, CLUSTNUM + GROUP + PARTICIPANT ~ CONDITION, value.var="individualAUC")
# ...and for the old:
clust1.old.A.And.B.wide <- dcast (clust1.old.A.and.B, CLUSTNUM + GROUP + PARTICIPANT ~ CONDITION, value.var="individualAUC")
clust2.old.A.And.B.wide <- dcast (clust2.old.A.and.B, CLUSTNUM + GROUP + PARTICIPANT ~ CONDITION, value.var="individualAUC")
clust3.old.A.And.B.wide <- dcast (clust3.old.A.and.B, CLUSTNUM + GROUP + PARTICIPANT ~ CONDITION, value.var="individualAUC")
clust4.old.A.And.B.wide <- dcast (clust4.old.A.and.B, CLUSTNUM + GROUP + PARTICIPANT ~ CONDITION, value.var="individualAUC")
clust7.old.A.And.B.wide <- dcast (clust7.old.A.and.B, CLUSTNUM + GROUP + PARTICIPANT ~ CONDITION, value.var="individualAUC")
