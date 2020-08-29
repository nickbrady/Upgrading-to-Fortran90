PROGRAM demo_array_intrinsics

  INTEGER, DIMENSION(2, 3) :: array_a
  INTEGER, DIMENSION(2, 3) :: array_b
  INTEGER :: i, j

  array_a(1, 1) = 1;  array_a(1, 2) = 2;  array_a(1, 3) = 3
  array_a(2, 1) = 4;  array_a(2, 2) = 5;  array_a(2, 3) = 6

  array_a = array_a + 2                   ! add a scalar to an array

  PRINT "(A)", " Adding 2 to array_a yields:"
  DO i = 1, 2
    PRINT "(13X, 3I5)", (array_a(i,j), j = 1, 3)
  END DO

  array_b(1, 1) = -2;  array_b(1, 2) =  3;  array_b(1, 3) = 2
  array_b(2, 1) =  1;  array_b(2, 2) = -1;  array_b(2, 3) = 0

  array_a = array_a * array_b             ! Multiply corresponding elements

  PRINT "(A)", " Multiplying each element of array_a times"
  PRINT "(A)", " corresponding element of array_b yields:"
  DO i = 1, 2
    PRINT "(13X, 3I5)", (array_a(i,j), j = 1, 3)
  END DO

  array_a = ABS(array_a)                  ! take abs value of each element

  PRINT "(A)", " Taking absolute value of array_a yields:"
  DO i = 1, 2
    PRINT "(13X, 3I5)", (array_a(i,j), j = 1, 3)
  END DO

END PROGRAM demo_array_intrinsics
