PROGRAM demo_array_named_constants

  INTEGER :: i

  CHARACTER(9), DIMENSION(12), PARAMETER :: Month_name =        &
        (/ "January  ", "February ", "March    ", "April    ",  &
           "May      ", "June     ", "July     ", "August   ",  &
           "September", "October  ", "November ", "December " /)

  INTEGER, DIMENSION(12), PARAMETER :: Days_in_month =          &
        (/ 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 /)

  DO i = 1, 12
    PRINT "(1X, A, I5)", Month_name(i), Days_in_month(i)
  END DO

END PROGRAM demo_array_named_constants
