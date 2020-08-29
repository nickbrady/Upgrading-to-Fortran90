MODULE rational_numbs

  TYPE :: rat_type
    INTEGER :: num, denom
  END TYPE rat_type

  INTERFACE OPERATOR (.invert.)       ! operator .invert. to
    MODULE PROCEDURE invert_rat       ! invoke function invert_rat
  END INTERFACE

CONTAINS

  ! Return the reciprocal of a rational number

  FUNCTION invert_rat (rat) RESULT (reciprocal)
    TYPE (rat_type)                 :: reciprocal
    TYPE (rat_type), INTENT (IN)    :: rat

    reciprocal = rat_type (rat%denom, rat%num)
  END FUNCTION invert_rat

END MODULE rational_numbs



PROGRAM new_programmer_defined_operator

  USE rational_numbs

  TYPE (rat_type) :: rat = rat_type (2, 5)        ! set rat = 2/5

  PRINT "(I2, '/', I1)", .invert. rat             ! Refers to .invert.  - invokes
                                                  ! invert_rat with rat as arg
END PROGRAM new_programmer_defined_operator
