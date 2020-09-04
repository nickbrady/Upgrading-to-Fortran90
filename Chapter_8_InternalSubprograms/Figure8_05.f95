PROGRAM demo_scope_of_labels

    REAL, DIMENSION(5)  :: x
    REAL        :: avg
    INTEGER     :: i
    LOGICAL     :: error

    DO 100 i = 1, 5
      x(i) = i
100 END DO

    CALL find_avg(x, avg, error)
    PRINT "(F8.3)", avg

    CALL find_avg(x(2:1), avg, error)

    IF(error) PRINT 200   ! refers to lable in body

200 FORMAT (" Can't find average for zero-sized array.")

CONTAINS

  SUBROUTINE find_avg(x, avg, error)

        REAL, DIMENSION(:), INTENT(IN)  :: x
        REAL,               INTENT(OUT) :: avg
        LOGICAL,            INTENT(OUT) :: error

        REAL    :: total
        INTEGER :: i

        IF (SIZE(x) == 0) GO TO 200     ! refers to label in subroutine

        total = 0.0
        DO 100 i = 1, SIZE(x)           ! refers to label in subroutine
          total = total + x(i)
    100 END DO

        avg = total / SIZE(x)
        error = .FALSE.
        RETURN

    200 CONTINUE
        avg = 0.0
        error = .TRUE.

  END SUBROUTINE find_avg

END PROGRAM demo_scope_of_labels
