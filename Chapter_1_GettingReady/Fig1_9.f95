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

  m = SUM ((x - x_avg) * (y - y_avg)) / SUM ((x - x_avg) ** 2)    ! compute slope - m
  b = y_avg - m * x_avg                                           ! compute intercept - b

END SUBROUTINE find_best_fit_line
