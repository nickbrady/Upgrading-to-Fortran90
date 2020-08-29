MODULE rat_nums

  TYPE :: rat_type
    INTEGER :: num, denom
  END TYPE rat_type

  INTERFACE OPERATOR (*)
    MODULE PROCEDURE rat_times_int, int_times_rat     ! Associate * with module
  END INTERFACE                                       ! fucntions below

CONTAINS

  ! Multiply rational times INTEGER.
  FUNCTION rat_times_int (rat, int) RESULT (product)
    TYPE (rat_type)                 :: product
    TYPE (rat_type),  INTENT (IN)   :: rat
    INTEGER,          INTENT (IN)   :: int

    product = rat_type (rat%num * int, rat%denom)
  END FUNCTION rat_times_int

  ! Multiply INTEGER times rational
  FUNCTION int_times_rat (int, rat) RESULT (product)
    TYPE (rat_type)                 :: product
    INTEGER,          INTENT (IN)   :: int
    TYPE (rat_type),  INTENT (IN)   :: rat

    product = rat_type (int * rat%num, rat%denom)
  END FUNCTION int_times_rat

  ! If we do want commutative property
  ! FUNCTION int_times_rat (int, rat) RESULT (product)
  !   TYPE (rat_type)                 :: product
  !   INTEGER,          INTENT (IN)   :: int
  !   TYPE (rat_type),  INTENT (IN)   :: rat
  !
  !   product = rat_times_int (rat, int)
  ! END FUNCTION int_times_rat

END MODULE rat_nums




PROGRAM operands_of_different_types

  USE rat_nums

  TYPE (rat_type) :: product

  product = rat_type (3, 5) * 2     ! Invoke function rat_times_int
  PRINT "(I2, '/', I1)", product

  product = 3 * rat_type (1, 7)     ! Invoke function int_times_rat
  PRINT "(I2, '/', I1)", product

END PROGRAM operands_of_different_types
