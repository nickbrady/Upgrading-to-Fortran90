MODULE point_type_def

  IMPLICIT NONE

  TYPE :: point_type
    REAL :: x, y            ! Cartesian coordinates of a point
  END TYPE point_type

END MODULE point_type_def



MODULE triangle_type_def

  USE point_type_def

  IMPLICIT NONE

  TYPE :: triangle_type
    TYPE(point_type) :: a, b, c     ! vertices of a triangle
  END TYPE triangle_type

END MODULE triangle_type_def



FUNCTION calc_perim(t)  RESULT(perimeter)

  USE triangle_type_def

  IMPLICIT NONE

  TYPE(triangle_type), INTENT(IN) :: t
  REAL                            :: perimeter

  REAL :: dist        ! external function to find distance between 2 points

  perimeter = dist(t%a, t%b) + dist(t%a, t%c) + dist(t%b, t%c)

END FUNCTION calc_perim



FUNCTION dist (pt_1, pt_2)  RESULT(d)

  USE point_type_def

  IMPLICIT NONE

  TYPE(point_type), INTENT(IN)  :: pt_1, pt_2
  REAL                          :: d

  d = SQRT( (pt_1%x - pt_2%x)**2 + (pt_1%y - pt_2%y)**2 )

END FUNCTION dist




PROGRAM demo_nest_modules

  USE triangle_type_def

  IMPLICIT NONE

  TYPE(triangle_type) :: triangle

  REAL :: calc_perim        ! func to find perimeter of triangle

  triangle%a%x = 0.0;   triangle%a%y = 0.0
  triangle%b%x = 3.0;   triangle%b%y = 0.0
  triangle%c%x = 3.0;   triangle%c%y = 4.0

  PRINT "(F8.3)", calc_perim(triangle)

END PROGRAM demo_nest_modules
