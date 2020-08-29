MODULE rational_numbers

  TYPE :: rat_type
    INTEGER :: num, denom       ! represents a rational number
  END TYPE rat_type

  INTERFACE OPERATOR (.minus.)
    MODULE PROCEDURE unary_minus        ! Take a negative of a rational number
  END INTERFACE

  INTERFACE OPERATOR (*)
    MODULE PROCEDURE mult
  END INTERFACE

  INTERFACE OPERATOR (.tothepower.)     ! Rase a rational number to an integer
    MODULE PROCEDURE exponentiate       ! power
  END INTERFACE

CONTAINS

  FUNCTION unary_minus (rat) RESULT (negative)
    TYPE (rat_type)                 :: negative
    TYPE (rat_type), INTENT (IN)    :: rat

    negative = rat_type(-rat%num, rat%denom)
  END FUNCTION unary_minus

  FUNCTION mult (rat_1, rat_2) RESULT (product)
    TYPE (rat_type)                 :: product
    TYPE (rat_type), INTENT (IN)    :: rat_1, rat_2

    product = rat_type(rat_1%num * rat_2%num, rat_1%denom * rat_2%denom)
  END FUNCTION mult

  FUNCTION exponentiate (rat, n) RESULT (nth_power)
    TYPE (rat_type)                 :: nth_power
    TYPE (rat_type), INTENT (IN)    :: rat
    INTEGER        , INTENT (IN)    :: n

    nth_power = rat_type(rat%num ** n, rat%denom ** n)
  END FUNCTION exponentiate

END MODULE rational_numbers

! Figure 9.6 - Precedence of operators

! 1. programmer-defined unary operator
! 2. **
! 3. *, /
! 4. unary + , unary -
! 5. binary + , binary -
! 6. .EQ., ==, .NE., /=, .LT., <, .LE., <=, .GT., >, .GE., >=
! 7. .NOT.
! 8. .AND.
! 9. .OR.
! 10. .EQV. , .NEQV.
! 11. programmer-defined binary operator

PROGRAM demo_precedence_of_operators

  USE rational_numbers      ! Access definition of rat_type and
                            ! programmer-defined operations

  TYPE (rat_type) :: rat_1 = rat_type(-1, 3), &
                     rat_2 = rat_type( 2, 3), &
                     rat_3
  real(8)         :: number

  rat_3 = .minus. rat_1 * rat_2 .tothepower. 2  ! first .minus. is done, -1/3 --> 1/3
                                                ! then (rat_1 * rat_2),  1/3 * 2/3 = 2/9
                                                ! then .tothepower.       (2/9)^2 = 4/81
  PRINT "(I2, '/', I2)", rat_3


  number = -(-1./3.) * (2./3.) **2              ! first **,   (2/3)^2 = 4/9
                                                ! unary -,    -1/3 --> 1/3
  PRINT *, number, 4./27.                       ! then *,     1/3 * 4/9 = 4/27


  rat_3 = .minus. rat_1 * (rat_2 .tothepower. 2)  ! first .minus. is done, -1/3 --> 1/3
                                                  ! then .tothepower.       (2/3)^2 = 4/9
                                                  ! then *,                1/3 * 4/9 = 4/27
  PRINT "(I2, '/', I2)", rat_3

END PROGRAM demo_precedence_of_operators
