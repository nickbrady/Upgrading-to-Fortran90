PROGRAM demo_automatic_array

  REAL, DIMENSION(5) :: a = (/ (i, i = 1, 5) /), &
                        b = (/ (i, i = 6, 10) /)

  PRINT "(A, 5F6.1)", " Before exchange, a =", a
  PRINT "(A, 5F6.1)", " Before exchange, b =", b

  CALL exchange(5, a, b)

  PRINT "(A, 5F6.1)", " After exchange, a =", a
  PRINT "(A, 5F6.1)", " After exchange, b =", b

END PROGRAM demo_automatic_array


! Exchange corresponding elements of two rank 1 arrays of size n.
SUBROUTINE exchange(n, x, y)

  INTEGER,            INTENT(IN)      :: n
  REAL, DIMENSION(n), INTENT(IN OUT)  :: x, y

  REAL, DIMENSION(n)  :: temp         ! automatic array

  temp  = x
  x     = y
  y     = temp

END SUBROUTINE exchange
