Boxplots
==========
Using [whole-brain analysis][], Bruce identified five [clusters surviving family-wise error correction][clusters]. To describe the within-cluster relationships, Bruce originally [requested][] barplots of aggregate means, but I suggested that box-and-whisker plots might give a little more information in the same space.

Using the [Boxplot function][] provided by the R package [car][], I [generated][] standard Tukey boxplots, which show:
- the median as a thick line within the box, surrounded by
- the first and third [quartiles][] forming the top and bottom of the box (or "hinges"), and
- whiskers extending to ["the most extreme data point which is no more than 1.5 times the interquartile range from the box"][whiskers].


[whole-brain analysis]: https://github.com/CVNRneuroimaging/proj.bc.haylingRedux/tree/master/01.projectDesign/scripts/2014forPoster/crossonRequested/01.wholebrainTtests

[clusters]: https://github.com/CVNRneuroimaging/proj.bc.haylingRedux/tree/master/03.derivedData/analysisHigherLevel/2014forPoster/crossonRequested/01.wholebrainTtests/finalClustersForPoster-endorsedByBruce20140812

[requested]: https://github.com/CVNRneuroimaging/proj.bc.haylingRedux/blob/f416d779dbe34b057038546d5bcfcdf32a89a2fd/04.deliverables/01.figuresAndTables/examplesToEmulate/Evernote_Snapshot_20140812_110323.jpg

[Boxplot function]: http://www.inside-r.org/packages/cran/car/docs/Boxplot

[car]: http://cran.r-project.org/web/packages/car/

[generated]: https://github.com/CVNRneuroimaging/proj.bc.haylingRedux/blob/f416d779dbe34b057038546d5bcfcdf32a89a2fd/01.projectDesign/scripts/2014forPoster/crossonRequested/02.ttestsOnDerivedClusters/boxplots.r

[quartiles]: http://stat.ethz.ch/R-manual/R-devel/library/grDevices/html/boxplot.stats.html

[whiskers]: http://stat.ethz.ch/R-manual/R-devel/library/graphics/html/boxplot.html

