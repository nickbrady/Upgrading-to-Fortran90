MODULE reduce_rat_type

  TYPE :: rat_type            ! rational number
    INTEGER :: num, denom     ! numerator and denominator
  END TYPE rat_type

CONTAINS

  FUNCTION reduce (top, bottom)   RESULT(lowest)

    TYPE(rat_type)  :: lowest     ! Function result is of derived type.

    INTEGER, INTENT(IN) :: top, bottom

    INTEGER :: trial

    lowest = rat_type (top, bottom)
    trial = 2

    DO WHILE (trial <= lowest%num .AND. trial <= lowest%denom)
      IF (MOD(lowest%num,   trial) == 0 .AND.    &
          MOD(lowest%denom, trial) == 0)  THEN

              lowest%num    = lowest%num    / trial
              lowest%denom  = lowest%denom  / trial

      ELSE
          trial = trial + 1
      END IF
    END DO

  END FUNCTION reduce

END MODULE reduce_rat_type




PROGRAM demo_func_returning_struct

  USE reduce_rat_type     ! Access definition of rat_type
                          ! and module function reduce
  IMPLICIT NONE

  TYPE (rat_type) :: reduced_fract

  reduced_fract = reduce (56, 252)    ! Invoke module function

  PRINT "(' fraction = ', I1, '/', I1)", reduced_fract

END PROGRAM demo_func_returning_struct
