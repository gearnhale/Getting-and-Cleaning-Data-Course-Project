# This CodeBook is made by Ahdrian Camilo C. Gernale


The data set that this code book pertains to is located in the `tidyData.txt` file of this repository.
Also, the readme contains other informations regarding the run_analysis.R file

The dataset is the result of cleaning and selecting data from data from an experiment in which measurements were collected from the accelerometer and gyroscope
from the Samsung Galaxy S smartphone used by 30 subjects carrying out a variety of 6 activities located in:
http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones 

The tidyData.txt has labels: Subject and Activity, which is the ID of the test subject and the measurement corresponding activities performed.

The summary of run_analysis R is:
1. There are 30 Subjects excluding the first variable `subject`
2. There are 6 activities, namely: WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING & LAYING

After running the script, the following have been observed:

- the `-`, `()` has been removed and the corresponding time domain becomes, i.e, `tBodyAcc-mean()-X` to `tBodyAccMeanX`, `fBodyBodyGyroMag-mean()` to `fBodyGyroMeanX` and other follows


