!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
! Note: Caller must supply an interface body when using find_best_fit_line as  !
!       an external subroutine because it has dummy arguments that are         !
!       assumed-shape arrays.                                                  !
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

SUBROUTINE find_best_fit_line (x, y, m, b)

  REAL, DIMENSION(:), INTENT (IN)   :: x, y     ! assumed-shape dummy array arguments
  REAL,               INTENT (OUT)  :: m, b

  REAL :: x_avg, y_avg


  x_avg = SUM(x) / SIZE(x)
  y_avg = SUM(y) / SIZE(y)

  m = SUM ( (x - x_avg) * (y - y_avg) ) / SUM ( (x - x_avg) ** 2 )    ! compute slope - m
  b = y_avg - m * x_avg                                               ! compute intercept - b

END SUBROUTINE find_best_fit_line



PROGRAM test_least_squares

  IMPLICIT NONE

  INTERFACE             ! Interface block containing one interface body follows

    SUBROUTINE find_best_fit_line (x, y, m, b)          ! Interface body for
      REAL, DIMENSION(:), INTENT (IN)   :: x, y         ! subroutine of Figure 1.9a
      REAL,               INTENT (OUT)  :: m, b
    END SUBROUTINE find_best_fit_line

  END INTERFACE


  REAL, DIMENSION(4) :: u = (/  5.0, 4.0,  6.0,  8.0 /)
  REAL, DIMENSION(4) :: v = (/ 14.0, 9.0, 16.0, 23.0 /)

  REAL :: slope, intercept


  CALL find_best_fit_line (u, v, slope, intercept)

  PRINT "(A, F6.3)", " slope     = ", slope
  PRINT "(A, F6.3)", " intercept = ", intercept

END PROGRAM test_least_squares
