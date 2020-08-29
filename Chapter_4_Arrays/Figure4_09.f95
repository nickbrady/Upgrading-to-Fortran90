PROGRAM demo_array_constructor

  ! array constructor used in initialization
  REAL, DIMENSION(5) :: a = (/ 1.0, 2.0, 3.0, 4.0, 5.0 /)

  REAL :: x, y
  REAL, DIMENSION(2, 3) :: b, c
  INTEGER :: i = 2, j = 3
  INTEGER, DIMENSION(5) :: m

  PRINT "(5F6.1)", a

  x = 2.5; y = 4.5

  ! scalar expressions used to specify array constructor
  a = (/ 1.5, x, 3.5, y, 5.5 /)

  PRINT "(5F6.1)", a

  b(1, 1) = 10.0;   b(1, 2) = 12.0;   b(1, 3) = 14.0
  b(2, 1) = 11.0;   b(2, 2) = 13.0;   b(2, 3) = 15.0
  c(1, 1) = 16.0;   c(1, 2) = 18.0;   c(1, 3) = 20.0
  c(2, 1) = 17.0;   c(2, 2) = 19.0;   c(2, 3) = 21.0

  ! array expressions used to specify array constructor
  a = (/ b(i, 1:3), c(1:2, j) /)

  PRINT "(5F6.1)", a

  ! implied DO used to specify array constructor
  m = (/ (i, i = 1, 5) /)
  PRINT "(5I6)", m

  ! intrinsic function used in specifying array constructor
  a = (/ (REAL (i), i = 1, 5) /)
  PRINT "(5F6.1)", a

END PROGRAM demo_array_constructor
