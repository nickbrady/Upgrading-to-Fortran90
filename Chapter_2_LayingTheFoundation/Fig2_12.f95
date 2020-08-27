PROGRAM demo_kind

  INTRINSIC SELECTED_INT_KIND, SELECTED_REAL_KIND

  INTEGER, PARAMETER  :: Short = SELECTED_INT_KIND (4)
  INTEGER, PARAMETER  :: High  = SELECTED_REAL_KIND (11, 30)

  INTEGER             :: n            ! default kind of INTEGER
  INTEGER(Short)      :: i            ! kind of INTEGER ranging between
                                      ! -(10**4) and +(10**4)

  REAL                :: r            ! default kind of REAL
  REAL(High)          :: x            ! kind of REAl with precision of 11 digits
                                      ! and ranging between -(10.0**30) and +(10**30)


  n = 56789                           ! INTEGER constant of default kind
  i = 1234_Short                      ! INTEGER constant of kind Short
  PRINT "(2I7)", n, i

  r = 0.123456E+10                    ! REAL constant of default kind
  x = 0.12345678901E+25_High          ! REAL constant of kind High
  PRINT "(2E19.11)", r, x

END PROGRAM demo_kind
