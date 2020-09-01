PROGRAM demo_automatic_string

  CHARACTER(5)  ::  s = "ABCDE", &
                    t = "FGHIJ"

  PRINT "(A, 1X, A)", " Before swap, s = ", s
  PRINT "(A, 1X, A)", " Before swap, t = ", t

  CALL swap(s, t)

  PRINT "(A, 1X, A)", " After swap, s = ", s
  PRINT "(A, 1X, A)", " After swap, t = ", t

END PROGRAM demo_automatic_string



! Swap 2 character strings of same length
SUBROUTINE swap(c, d)

  CHARACTER(*), INTENT(IN OUT)  :: c, d

  CHARACTER(LEN(c)) :: hold     ! automatic string

  hold  = c
  c     = d
  d     = hold

END SUBROUTINE swap
