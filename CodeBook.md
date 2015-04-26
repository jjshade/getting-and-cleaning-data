Code Book
=========

Study Design
------------

This work seeks to summarise the data provided by the UCI Machine Learning Repository study:
Human Activity Recognition Using Smartphones Data Set.

Further details of the study design and the data set providing the basis for this work can be
found here:

[http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones]

I won't duplicate the full details of the original data capture here, however key point are:

* 30 volunteers ("subjects") in the age range 19-48
* 6 activities - WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING

All carried out while wearing a smartphone on their waist.

Feature Selection (modified from the information provided by the original study)
--------------------------------------------------------------------------------

The features selected for this database come from the accelerometer and gyroscope 
3-axial raw signals timeAcceleration-XYZ and timeGyro-XYZ. These time domain signals 
(prefix 'time' to denote time) were captured at a constant rate of 50 Hz. 
Then they were filtered using a median filter and a 3rd order low pass 
Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, 
the acceleration signal was then separated into body and gravity
acceleration signals (timeBodyAcceleration-XYZ and timeGravityAcceleration-XYZ) using another low 
pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in
time to obtain Jerk signals (timeBodyAccelerationJerk-XYZ and timeBodyGyroJerk-XYZ). Also the
magnitude of these three-dimensional signals were calculated using the Euclidean 
norm (timeBodyAccelerationMagnitude, timeGravityAccelerationMagnitude, 
timeBodyAcceletationJerkMagnitude, timeBodyGyroMagnitude, timeBodyGyroJerkMagnitude). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing
frequencyBodyAcceleration-XYZ, frequencyBodyAccelerationJerk-XYZ, frequencyBodyGyro-XYZ, 
frequencyBodyAccJerkMag, frequencyBodyGyroMag, frequencyBodyGyroJerkMag. (Note the 
'frequency' prefix to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern: 

'-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

* timeBodyAcceleration-XYZ
* timeGravityAcceleration-XYZ
* timeBodyAccelerationJerk-XYZ
* timeBodyGyro-XYZ
* timeBodyGyroJerk-XYZ
* timeBodyAccelerationMagnitude
* timeGravityAccelerationMagnitude
* timeBodyAccelerationJerkMagnitude
* timeBodyGyroMagnitude
* timeBodyGyroJerkMagnitude
* frequencyBodyAcceleration-XYZ
* frequencyBodyAccelerationJerk-XYZ
* frequencyBodyGyro-XYZ
* frequencyBodyAccelerationMagnitude
* frequencyBodyAccelerationJerkMagnitude
* frequencyBodyGyroMagnitude
* frequencyBodyGyroJerkMagnitude

The set of variables that were estimated from these signals are: 

* mean(): Mean value
* std(): Standard deviation

Finally, where we had several observations for each subject and activity, the average of these
was taken to produce the final tidy data set, hence in the data dictionary below, we have both
means of means and means of standard deviations.


Data Dictionary
---------------

Number | Variable Name | Description
------ | ------------- | -----------
1. | **subject** | The id of the subject (volunteer)
2. | **activity** | The activity being carried out
3. | **timeBodyAccelerationMeanX** | The mean body acceleration in the time domain along the phone's X-axis
4. | **timeBodyAccelerationMeanY** | The mean body acceleration in the time domain along the phone's Y-axis
5. | **timeBodyAccelerationMeanZ** | The mean body acceleration in the time domain along the phone's Z-axis
6. | **timeBodyAccelerationStdX** | The mean standard deviation body acceleration in the time domain along the phone's X-axis
7. | **timeBodyAccelerationStdY** | The mean standard deviation body acceleration in the time domain along the phone's Y-axis
8. | **timeBodyAccelerationStdZ** | The mean standard deviation body acceleration in the time domain along the phone's Z-axis
9. | **timeGravityAccelerationMeanX** | The mean gravity acceleration in the time domain along the phone's X-axis
10. | **timeGravityAccelerationMeanY** | The mean gravity acceleration in the time domain along the phone's Y-axis
11. | **timeGravityAccelerationMeanZ** | The mean gravity acceleration in the time domain along the phone's Z-axis
12. | **timeGravityAccelerationStdX** | The mean standard deviation gravity acceleration in the time domain along the phone's X-axis
13. | **timeGravityAccelerationStdY** | The mean standard deviation gravity acceleration in the time domain along the phone's Y-axis
14. | **timeGravityAccelerationStdZ** | The mean standard deviation gravity acceleration in the time domain along the phone's Z-axis
15. | **timeBodyAccelerationJerkMeanX** | The mean body acceleration jerk in the time domain along the phone's X-axis
16. | **timeBodyAccelerationJerkMeanY** | The mean body acceleration jerk in the time domain along the phone's Y-axis
17. | **timeBodyAccelerationJerkMeanZ** | The mean body acceleration jerk in the time domain along the phone's Z-axis
18. | **timeBodyAccelerationJerkStdX** | The mean standard deviation body acceleration jerk in the time domain along the phone's X-axis
19. | **timeBodyAccelerationJerkStdY** | The mean standard deviation body acceleration jerk in the time domain along the phone's Y-axis
20. | **timeBodyAccelerationJerkStdZ** | The mean standard deviation body acceleration jerk in the time domain along the phone's Z-axis
21. | **timeBodyGyroMeanX** | The mean body gyro in the time domain along the phone's X-axis
22. | **timeBodyGyroMeanY** | The mean body gyro in the time domain along the phone's Y-axis
23. | **timeBodyGyroMeanZ** | The mean body gyro in the time domain along the phone's Z-axis
24. | **timeBodyGyroStdX** | The mean standard deviation body gyro in the time domain along the phone's X-axis
25. | **timeBodyGyroStdY** | The mean standard deviation body gyro in the time domain along the phone's Y-axis
26. | **timeBodyGyroStdZ** | The mean standard deviation body gyro in the time domain along the phone's Z-axis
27. | **timeBodyGyroJerkMeanX** | The mean body gyro jerk in the time domain along the phone's X-axis
28. | **timeBodyGyroJerkMeanY** | The mean body gyro jerk in the time domain along the phone's Y-axis
29. | **timeBodyGyroJerkMeanZ** | The mean body gyro jerk in the time domain along the phone's Z-axis
30. | **timeBodyGyroJerkStdX** | The mean standard deviation body gyro jerk in the time domain along the phone's X-axis
31. | **timeBodyGyroJerkStdY** | The mean standard deviation body gyro jerk in the time domain along the phone's Y-axis
32. | **timeBodyGyroJerkStdZ** | The mean standard deviation body gyro jerk in the time domain along the phone's Z-axis
33. | **timeBodyAccelerationMagnitudeMean** | The mean body acceleration magnitude in the time domain 
34. | **timeBodyAccelerationMagnitudeStd** | The mean standard deviation body acceleration magnitude in the time domain 
35. | **timeGravityAccelerationMagnitudeMean** | The mean body acceleration magnitude in the time domain 
36. | **timeGravityAccelerationMagnitudeStd** | The mean standard deviation body acceleration magnitude in the time domain 
37. | **timeBodyAccelerationJerkMagnitudeMean** | The mean body acceleration magnitude in the time domain 
38. | **timeBodyAccelerationJerkMagnitudeStd** | The mean standard deviation body acceleration magnitude in the time domain 
39. | **timeBodyGyroMagnitudeMean** | The mean body gyro magnitude in the time domain 
40. | **timeBodyGyroMagnitudeStd** | The mean standard deviation body gyro magnitude in the time domain 
41. | **timeBodyGyroJerkMagnitudeMean** | The mean body gyro jerk magnitude in the time domain 
42. | **timeBodyGyroJerkMagnitudeStd** | The mean standard deviation body gyro jerk magnitude in the time domain 
43. | **frequencyBodyAccelerationMeanX** | The mean body acceleration in the frequency domain along the phone's X-axis
44. | **frequencyBodyAccelerationMeanY** | The mean body acceleration in the frequency domain along the phone's Y-axis
45. | **frequencyBodyAccelerationMeanZ** | The mean body acceleration in the frequency domain along the phone's Z-axis
46. | **frequencyBodyAccelerationStdX** | The mean standard deviation body acceleration in the frequency domain along the phone's X-axis
47. | **frequencyBodyAccelerationStdY** | The mean standard deviation body acceleration in the frequency domain along the phone's Y-axis
48. | **frequencyBodyAccelerationStdZ** | The mean standard deviation body acceleration in the frequency domain along the phone's Z-axis
49. | **frequencyBodyAccelerationJerkMeanX** | The mean body acceleration jerk in the frequency domain along the phone's X-axis
50. | **frequencyBodyAccelerationJerkMeanY** | The mean body acceleration jerk in the frequency domain along the phone's Y-axis
51. | **frequencyBodyAccelerationJerkMeanZ** | The mean body acceleration jerk in the frequency domain along the phone's Z-axis
52. | **frequencyBodyAccelerationJerkStdX** | The mean standard deviation body acceleration jerk in the frequency domain along the phone's X-axis
53. | **frequencyBodyAccelerationJerkStdY** | The mean standard deviation body acceleration jerk in the frequency domain along the phone's Y-axis
54. | **frequencyBodyAccelerationJerkStdZ** | The mean standard deviation body acceleration jerk in the frequency domain along the phone's Z-axis
55. | **frequencyBodyGyroMeanX** | The mean body gyro in the frequency domain along the phone's X-axis
56. | **frequencyBodyGyroMeanY** | The mean body gyro in the frequency domain along the phone's Y-axis
57. | **frequencyBodyGyroMeanZ** | The mean body gyro in the frequency domain along the phone's Z-axis
58. | **frequencyBodyGyroStdX** | The mean standard deviation body gyro in the frequency domain along the phone's X-axis
59. | **frequencyBodyGyroStdY** | The mean standard deviation body gyro in the frequency domain along the phone's Y-axis
60. | **frequencyBodyGyroStdZ** | The mean standard deviation body gyro in the frequency domain along the phone's Z-axis
61. | **frequencyBodyAccelerationMagnitudeMean** | The mean body acceleration magnitude in the frequency domain 
62. | **frequencyBodyAccelerationMagnitudeStd** | The mean standard deviation body acceleration magnitude in the frequency domain 
63. | **frequencyBodyAccelerationJerkMagnitudeMean** | The mean body acceleration jerk magnitude in the frequency domain 
64. | **frequencyBodyAccelerationJerkMagnitudeStd** | The mean standard deviation body acceleration jerk magnitude in the frequency domain 
65. | **frequencyBodyGyroMagnitudeMean** | The mean body gyro magnitude in the frequency domain 
66. | **frequencyBodyGyroMagnitudeStd** | The mean standard deviation body gyro magnitude in the frequency domain 
67. | **frequencyBodyGyroJerkMagnitudeMean** | The mean body gyro jerk magnitude in the frequency domain 
68. | **frequencyBodyGyroJerkMagnitudeStd** | The mean standard deviation body gyro jerk magnitude in the frequency domain 

