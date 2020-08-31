PROGRAM demo_rational_type

  TYPE :: rational_type
    ! Components of same type may be defined on same line
    INTEGER :: num, denom
  END TYPE rational_type

  ! Type declaration for 3 variables of same derived type:
  TYPE (rational_type) :: rat_1, rat_2, product

  rat_1%num = 4; rat_1%denom = 7
  rat_2%num = 2; rat_2%denom = 5

  product%num   = rat_1%num   * rat_2%num
  product%denom = rat_1%denom * rat_2%denom

  PRINT "(' product = ', I1, '/', I2)", product

END PROGRAM demo_rational_type
