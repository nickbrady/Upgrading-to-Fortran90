MODULE determinant_evaluator

CONTAINS

  RECURSIVE FUNCTION det(a)   RESULT(d)

    REAL, DIMENSION(:,:), INTENT(IN)  :: a
    REAL :: d

    INTEGER :: n      ! # rows = # cols in a
    INTEGER :: i      ! index over rows in a

    REAL, DIMENSION(SIZE(a,1)-1, SIZE(a,2)-1) :: a_less_row_i_and_col_1

    REAL :: minor

    n = SIZE(a, 1)

    IF (n > 1) THEN
      d = 0.0
      DO i = 1, n
        a_less_row_i_and_col_1(1:i-1, 1:n-1) = a(1:i-1, 2:n)
        a_less_row_i_and_col_1(i:n-1, 1:n-1) = a(i+1:n, 2:n)
        minor = det(a_less_row_i_and_col_1)
        d = d + (-1)**(i + 1) * a(i,1) * minor
      END DO
    ELSE
      d = a(1,1)
    END IF

  END FUNCTION det

END MODULE determinant_evaluator




PROGRAM test_determinant_evaluator

  USE determinant_evaluator       ! Gain access to det.

  REAL, DIMENSION(4,4) :: b

  b(1,1) = 2.0; b(1,2) = 5.0; b(1,3) = 4.0; b(1,4) = 3.0
  b(2,1) = 3.0; b(2,2) = 2.0; b(2,3) = 5.0; b(2,4) = 1.0
  b(3,1) = 4.0; b(3,2) = 0.0; b(3,3) = 2.0; b(3,4) = 1.0
  b(4,1) = 3.0; b(4,2) = 0.0; b(4,3) = 3.0; b(4,4) = 2.0

  PRINT *, det(b)                 ! invoke det

END PROGRAM test_determinant_evaluator
