MODULE julian_dates

  IMPLICIT NONE

  INTEGER, DIMENSION(12), PARAMETER ::  &
      Days_per_mon_in_nonleap = (/ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 /)
                                !   1   2   3   4   5   6   7   8   9  10  11  12

  ! days_per_mon will be set to number of days per month.
  INTEGER, DIMENSION(12)  :: days_per_mon

CONTAINS

  ! Convert month & day to Julian day for given year.
  FUNCTION conv_to_jul (mon, day, yr)  RESULT (jul_day)
    INTEGER               :: jul_day
    INTEGER, INTENT(IN)   :: mon, day, yr

    days_per_mon = Days_per_mon_in_nonleap
    IF (is_leap (yr)) days_per_mon(2) = 29    ! Invoke module procedure (is_leap)

    jul_day = SUM(days_per_mon(1:mon-1)) + day
  END FUNCTION conv_to_jul

  ! Convert Julian Day in given year to month & day.
  SUBROUTINE conv_to_cal (jul_day, yr, mon, day)
    INTEGER, INTENT(IN)   :: jul_day, yr
    INTEGER, INTENT(OUT)  :: mon, day

    days_per_mon = Days_per_mon_in_nonleap
    IF (is_leap (yr)) days_per_mon(2) = 29    ! Invoke module procedure (is_leap)

    DO mon = 1, 12
      IF (jul_day <= SUM(days_per_mon(1:mon))) EXIT
    END DO

    day = jul_day - SUM(days_per_mon(1:mon-1))
  END SUBROUTINE conv_to_cal


  ! Return .TRUE. if leap year, .FALSE. if not.
  FUNCTION is_leap(yr)    RESULT(its_a_leap)
    LOGICAL             :: its_a_leap
    INTEGER, INTENT(IN) :: yr

    its_a_leap = .FALSE.
    IF (MOD(yr, 4)   == 0 .AND.   &
        MOD(yr, 100) /= 0 .OR.    &
        MOD(yr, 400) == 0           ) THEN

        its_a_leap = .TRUE.
    END IF
  END FUNCTION is_leap

END MODULE julian_dates



PROGRAM demo_julian_date_procedures

  USE julian_dates            ! Access conv_to_jul, conv_to_cal

  IMPLICIT NONE
  INTEGER :: month, day

  PRINT "(A, I3)", " Julian day for May 21, 1991, is ", conv_to_jul(5, 21, 1991)

  CALL conv_to_cal (231, 1992, month, day)    ! month, day are results

  PRINT "(A, I1, A, I2)",     &
        " For day 231 of 1992, month = ", month, ", day = ", day

END PROGRAM demo_julian_date_procedures
