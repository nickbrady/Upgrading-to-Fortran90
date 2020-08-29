PROGRAM demo_zero_sized_array

  INTRINSIC SUM
  INTEGER, DIMENSION(4) :: x = (/ 4, 3, 2, 1 /)
  INTEGER               :: i, total

  DO i = 1, 4
    total = SUM(x(i+1:4))       ! When i is 4, x(i+1:4) is a zero-sized array.

    PRINT "(2I5)", i, total
  END DO

END PROGRAM demo_zero_sized_array
