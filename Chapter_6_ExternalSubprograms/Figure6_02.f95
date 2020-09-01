PROGRAM demo_external_subprograms

  IMPLICIT NONE

  REAL(KIND(0D0)) :: actual_arg_1 = 1.2345678D0
  INTEGER         :: actual_arg_2 = 1234
  CHARACTER(4)    :: actual_arg_3 = "ABCD"

  REAL(KIND(0D0)) :: func     ! type declaration for function

  ! Next statement invokes subroutine.
  CALL sub(actual_arg_1, actual_arg_2, actual_arg_3)

  PRINT "(F11.7)", 2D0 * func(0.123, 4)   ! invoke function

END PROGRAM demo_external_subprograms



SUBROUTINE sub (dummy_arg_1, dummy_arg_2, dummy_arg_3)

  IMPLICIT NONE

  REAL(KIND(0D0)) :: dummy_arg_1
  INTEGER         :: dummy_arg_2
  CHARACTER(*)    :: dummy_arg_3          ! * means assumed length

  PRINT "(F11.7)",  dummy_arg_1
  PRINT "(I5)",     dummy_arg_2
  PRINT "(1X, A)",  dummy_arg_3

END SUBROUTINE sub



FUNCTION func (dummy_arg_1, dummy_arg_2)

  IMPLICIT NONE

  REAL(KIND(0D0)) :: func     ! result variable

  REAL            :: dummy_arg_1
  INTEGER         :: dummy_arg_2

  func = dummy_arg_1 + dummy_arg_2

END FUNCTION func
