PROGRAM type_decls_for_intrinsic_types

! Type declarations for variables:

  INTEGER           :: int_var
  REAL              :: real_var
  DOUBLE PRECISION  :: dble_var         ! not a type, but a kind of REAL

  COMPLEX           :: cmplx_var
  LOGICAL           :: log_var

  CHARACTER*3       :: p                ! based on FORTRAN 77 style
  CHARACTER         :: q*3              ! based on FORTRAN 77 style
  CHARACTER(LEN=3)  :: r                ! verbose Fortran 90 style
  CHARACTER(3)      :: s                ! terse Fortran 90 style
  CHARACTER         :: one_char         ! length defaults to 1

! Type declaration for named constant:

  REAL      :: Pi                       ! can be expressed in only one statement
  PARAMETER (Pi = 3.1415)

! Type declaration for external function:

  INTEGER :: double_int                 ! not needed if interface body


  int_var   = 1;            PRINT "(I6)",     int_var
  real_var  = 2.0;          PRINT "(F6.1)",   real_var
  dble_var  = 3D0;          PRINT "(F6.1)",   dble_var
  cmplx_var = (4.0, 5.0);   PRINT "(2F6.1)",  cmplx_var
  log_var   = .TRUE.;       PRINT "(5X, L1)", log_var

  p = "ABC"; q = "DEF"; r = "GHI"; s = "JKL"; one_char = "M"
  PRINT "(1X, A)", p // q // r // s // one_char

  PRINT "(F9.4)", Pi

  PRINT "(I6)", double_int (8)          ! Invoke external function

END PROGRAM type_decls_for_intrinsic_types


FUNCTION double_int (int_in)            ! Double a value of type integer

  INTEGER :: double_int                 ! result variable
  INTEGER :: int_in                     ! dummy argument


  double_int = 2 * int_in

END FUNCTION double_int
