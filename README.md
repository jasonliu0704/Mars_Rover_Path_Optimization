# Mars Rover routes Optimization Using Gradient Descent
			
## Project Background

The Mars rover Spirit needs to transit to its next exploration area. The straight line, as the crow flies, distance is 13 [km]. However a high and steep mountain and deep crater lie in the direct path. Ascending and descending terrain expend significant energy and therefore require the rover to stop more often to recharge its batteries. The task at hand is to find a path for the rover that balances the distance travelled and elevation change such that the total transit time is minimized.

## Project overview (see details in project report)

This project I focus on tuning my gradient descent algorithm by analyzing various parameters and convergence of steepest descent and conjuage gradient to optimize routes for mars Rover given cost functions bellow. My model has been trained on four different 3D terrain with high accuracies. 
![alt text](https://github.com/jasonliu0704/Mars_Rover_Path_Optimization/blob/master/formula.png "Logo Title Text 1")


Task1. basic calculations for specified rover paths given 3D telemetry data
  * Compute the distance and elevation profiles based on a direct path using 250 points.
  * Repeat step one for three specified paths using 100 steps per segment.
  * Make a table of the time, distance and total elevation gained and lost for the four paths.
  * Plot the elevation versus along-track distance for each path. (x-y) plots
  * Plot the tracks (x,y,h) on a three-dimensional surface plot.


![alt text](https://github.com/jasonliu0704/Mars_Rover_Path_Optimization/blob/master/99.png "Logo Title Text 1")
These arrows indicate the direction of the change of elevation along the horizontal distance.

Some questions for part1 in report:
* Include and succinctly discuss the tables and figures for parts A-E of Task 1. Make sure all the figures are have axis labels and legends where appropriate.
* Re-compute the paths with 200%, 50% and 25% and 10% of the points per segment and discuss the difference. You many find tabulating the results a useful departure point for the discussion.
* Add arrows to a surface or contour plot in the direction of- grad(h) with appropriate magnitude along the path. Discuss what significance these arrows have with respect to an ideal path.


Task2. Find the optimal route based on the cost function
*A. Compute the cost (evaluate J) for all the paths in Task 1.
*B. Optimize the direct path using the 500 optimization cycles with both the conjugate gradient flag on and off. Plot the cost versus optimizer cycle for both.
*C. Repeat B for path 1.
*D. Put each path from Task 1 through the optimizer with the conjugate gradient option turned on and 500 cycles.
  *1. Make a table of the cost before and after the optimization and the number of cycles needed for the optimized to converge. The table should include all the same quantities as the table in Task 1C for both the original and optimal paths, as well as the min and max elevations on the path for both the original and optimized paths.
  *2. Plot the elevation versus along-track distance for each path both original and optimized. (x-y) plots. Each Path should be in a separate plot.
  *3. Plot both the original and optimal paths on a three-dimensional surface plot.

![alt text](https://github.com/jasonliu0704/Mars_Rover_Path_Optimization/blob/master/40.png "Logo Title Text 1")
This figure is Cost v. Optimization cycles for the Direct Path.For the direct path,the conjugate gradient and steepest descent does not converge within 500 cycles.

![alt text](https://github.com/jasonliu0704/Mars_Rover_Path_Optimization/blob/master/41.png "Logo Title Text 1")
This is Cost v. Optimization cycles for the Path1.For the path1, the conjugate gradient and steepest descent converges at around 80 cycles.

This table shows that for direct path and path3, optimized paths take less time ,distance,+elevation,-elevation than non-optimized path. All the optimized path have smaller max and min than the non-optimized one. Although the optimized path1 and path2 take longer time, distance, all the optimized path actually take smaller +elevation and -elevation, which means they consume less energy and expend less money.

Route	Time(s)	Distance(km)	plusElev.	minusElev.	max(h)	min(h)	
Direct	1.93E+06	17.84787666	5.473723422	5.559382255	1.263315724	-2.042469512	
Paht1	1.97E+06	19.67570946	2.974675037	3.06033387	1.151881256	-0.499168831	
Paht2	1.92E+06	19.16072202	3.852238329	3.937897162	1.124103121	-1.130899753	
Path3	2.11E+06	21.09318814	5.512815453	5.598474286	1.401906785	-1.055579823	
Direct_opt	1.88E+03	18.83762911	5.411817973	5.497476806	1.226172204	-2.011619304	
Paht1_opt	2.02E+03	20.18039032	2.592727074	2.678385908	0.471390065	-0.239225834	
Paht2_opt	1.98E+03	19.76292818	3.735353881	3.821012715	1.110282567	-0.9705264	
Path3_opt	2.08E+03	20.82995785	4.25763123	4.343290063	1.140757534	-0.897474664	

This table shows the cost of paths before and after optimized. From the table, we can see that optimized path saves costs.

Route	cost						
Direct	3.04E+02						
Paht1	1.48E+02						
Paht2	2.04E+02						
Path3	3.46E+02						
Direct_opt	77.16008049						
Paht1_opt	37.86562883						
Paht2_opt	51.73211448						
Path3_opt	59.91508154						
							
This table show the number of convergence cycle and for both steepest descent and conjugate gradient path. The steepest descent optimization takes more cycles to converge to an optimized path compared to the conjugate gradient, as evidenced by comparing the data, and the blue line and the green line. However, both converge to about the same value.

Route	converge cycle						
Direct_st	630						
Paht1_st	80						
Paht2_st	84						
Path3_st	1230						
Direct_cg	465						
Paht1_cg	50						
Paht2_cg	50						
Path3_cg	850			

Plot both the original and optimal paths on a three-dimensional surface plot.
![alt text](https://github.com/jasonliu0704/Mars_Rover_Path_Optimization/blob/master/30.png "Logo Title Text 1")
![alt text](https://github.com/jasonliu0704/Mars_Rover_Path_Optimization/blob/master/31.png "Logo Title Text 1")
![alt text](https://github.com/jasonliu0704/Mars_Rover_Path_Optimization/blob/master/33.png "Logo Title Text 1")

Plot the elevation versus along-track distance for each path both original and optimized
![alt text](https://github.com/jasonliu0704/Mars_Rover_Path_Optimization/blob/master/21.png "Logo Title Text 1")
![alt text](https://github.com/jasonliu0704/Mars_Rover_Path_Optimization/blob/master/22.png "Logo Title Text 1")
![alt text](https://github.com/jasonliu0704/Mars_Rover_Path_Optimization/blob/master/23.png "Logo Title Text 1")
![alt text](https://github.com/jasonliu0704/Mars_Rover_Path_Optimization/blob/master/24.png "Logo Title Text 1")

Task3. Account for specified regions that the rover cannot enter on the path
Because the terrain data is only known on the 10 [km] x 10 [km] grid it is desirable to keep the rover away from the edges. The rover is no longer allowed within 0.15 kilometers from any boundary.
Additional regions where the rover is not allowed are terrain dependent and must be read in from a constaints.ini file. There may be one or more regions specified in the file. A sample constraints file is given on the next slide. They are specified a circular regions defined by xc, yc and r. Where xc and yc and the center of the circle and r is the radius.

Here is my implementation to keep routes away from edges:
![alt text](https://github.com/jasonliu0704/Mars_Rover_Path_Optimization/blob/master/untitled.png "Logo Title Text 1")

## Future TODO
improve the accuracy of the interpolation by using bicubic instead of bilinear and the accuracy of the gradients of the terrain by using 4th order central- differencing.

