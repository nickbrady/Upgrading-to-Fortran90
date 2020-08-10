! *** find_gcd must be defined before MODULE rat_numbers *** !
! ************************************************************ !
! Find greatest common divisor (denominator) of two integers

RECURSIVE FUNCTION find_gcd (m, n) RESULT (gcd)

  INTEGER                 :: gcd
  INTEGER, INTENT (IN)    :: m, n

  IF (n == 0) THEN
    gcd = m
  ELSE
    gcd = find_gcd (n, MOD(m, n))
  END IF

END FUNCTION find_gcd



MODULE rat_numbers

  TYPE :: rat_type
    INTEGER :: num, denom
  END TYPE rat_type

  INTERFACE OPERATOR (.EQ.)                     ! Assocaite .EQ. and == with
    MODULE PROCEDURE is_equal_to                ! function is_equal_to
  END INTERFACE

CONTAINS

  ! Return .TRUE. if 2 rationals equal; else return .FALSE.

  FUNCTION is_equal_to (rat_1, rat_2) RESULT (equal)
    LOGICAL                         :: equal
    TYPE (rat_type), INTENT (IN)    :: rat_1, rat_2
    TYPE (rat_type)                 :: temp_1, temp_2

    temp_1 = reduce (rat_1)                     ! reduce rat_1 to lowest terms
    temp_2 = reduce (rat_2)                     ! reduce rat_2 to lowest terms

    ! Numerators & denominators identical for reduced rationals?
    equal = (temp_1%num == temp_2%num) .AND. (temp_1%denom == temp_2%denom)
  END FUNCTION is_equal_to

  ! Return rational number reduced to lowest terms

  FUNCTION reduce (rat) RESULT (reduced)
    TYPE (rat_type)               :: reduced
    TYPE (rat_type), INTENT (IN)  :: rat
    INTEGER                       :: gcd          ! greatest common divisor (denominator)
    INTEGER                       :: find_gcd     ! external function to determine
                                                  ! GCD
    gcd = find_gcd (rat%num, rat%denom)           ! Invoke external function

    reduced = rat_type (rat%num / gcd, rat%denom / gcd)
  END FUNCTION reduce


END MODULE rat_numbers




PROGRAM overloading_relational_operator

  USE rat_numbers

  TYPE (rat_type) :: rat_1 = rat_type (2, 4), &
                     rat_2 = rat_type (3, 6)

  IF (rat_1 .EQ. rat_2) THEN              ! Invoke is_equal_to
    PRINT "(A)", "2/4 equals 3/6"
  END IF


  IF (rat_1 == rat_type (4, 6)) THEN      ! Invoke is_equal_to
    ! Do nothing if equal.
  ELSE
    PRINT "(A)", "2/4 does not equal 4/6"
  END IF

END PROGRAM overloading_relational_operator
