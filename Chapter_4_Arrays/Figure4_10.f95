PROGRAM demo_reshape

  INTRINSIC RESHAPE, MATMUL

  ! Set initial values for array of rank greater than one.
  REAL, DIMENSION(2, 3) :: a = RESHAPE( (/ 1.0, 2.0, 3.0, 4.0, 5.0, 6.0 /), (/ 2, 3 /) )

  REAL, DIMENSION(3, 2) :: b
  REAL, DIMENSION(2, 2) :: c
  INTEGER               :: i
  INTEGER, DIMENSION(2) :: shape_

  ! Copy vlaues from a to b, even though shapes differ.
  b = RESHAPE (a, (/ 3, 2 /))

  ! Multiply a times be using matrix multiplication as in math texts and add
  ! 2 x 2 result to constant 2 x 2 array.
  c = MATMUL(a, b) + RESHAPE( (/ 1.0, 2.0, 3.0, 4.0 /), (/ 2, 2 /) )

  DO i = 1, 2
    PRINT "(2F6.1)", c(i, :)              ! Display one row of c.
  END DO

END PROGRAM demo_reshape
