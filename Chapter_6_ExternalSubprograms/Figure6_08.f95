! Result variable name is specified after keyword RESULT
FUNCTION max_magnitude (val_1, val_2)   RESULT(max_of_abs)

  REAL              :: max_of_abs       ! Declare result variable.
  REAL, INTENT(IN)  :: val_1, val_2

  ! Set result variable to value to be returned to caller.
  max_of_abs = MAX( ABS(val_1), ABS(val_2) )

END FUNCTION max_magnitude



PROGRAM test_max_magnitude

  ! Data type of name max_magnitude must be specified.
  REAL, EXTERNAL :: max_magnitude

  PRINT "(F8.3)", 3.0 * max_magnitude(1.1, -2.2)

END PROGRAM test_max_magnitude
