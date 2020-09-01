SUBROUTINE get_stats(n, x, mean, std_dev)

  INTEGER :: n

  REAL, DIMENSION(n)  :: x

  REAL  :: mean, std_dev

  mean = SUM(x) / n

  std_dev = SQRT( SUM( (x - mean)**2) / (n - 1) )

END SUBROUTINE get_stats



PROGRAM test_get_stats

  REAL, DIMENSION(5) :: sample = (/ 3.0, 3.4, 3.1, 3.5, 3.2 /)

  REAL :: avg, std_deviation

  CALL get_stats (5, sample, avg, std_deviation)

  PRINT "(A, E14.6)", "               mean = ", avg
  PRINT "(A, E14.6)", " standard deviation = ", std_deviation

END PROGRAM test_get_stats



! Note:   The effect of this subroutine is exactly the same as that of the
!         subroutine list above

! Warning:  The assumed-size array is not recommended for use in Fortran 90
!           except under unusual circumstances

SUBROUTINE get_stats_1(n, x, mean, std_dev)

  INTEGER :: n

  REAL, DIMENSION(n)  :: x

  REAL  :: mean, std_dev

  mean = SUM(x) / n

  std_dev = SQRT( SUM( (x - mean)**2) / (n - 1) )

END SUBROUTINE get_stats_1
