MODULE metric_english_conversions

  IMPLICIT NONE

  REAL, PARAMETER :: cm_in_1_ft       = 30.48006096
  REAL, PARAMETER :: ft_in_1_cm       =  0.03280833
  REAL, PARAMETER :: inches_in_1_m    = 39.37000000
  REAL, PARAMETER :: lb_in_1_kg       =  2.204622341
  REAL, PARAMETER :: kg_in_1_lb       =  0.4535924277

END MODULE metric_english_conversions



PROGRAM demo_metric_english

  USE metric_english_conversions    ! gives main program acces to all names in module

  IMPLICIT NONE

  PRINT "(A, E13.6)", " centimeters in 1 foot = ", cm_in_1_ft

  PRINT "(A, E13.6)", " feet in 1 centimeter  = ", ft_in_1_cm

  PRINT "(A, E13.6)", " inches in 1 meter     = ", inches_in_1_m

  PRINT "(A, E13.6)", " pounds in 1 kilogram  = ", lb_in_1_kg

  PRINT "(A, E13.6)", " kilograms in 1 pound  = ", kg_in_1_lb

END PROGRAM demo_metric_english
