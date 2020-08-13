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

    product = rat_type(rat_1%num * rat_2%num, rat_1%denom * rat_2%demon)
  END FUNCTION mult

  FUNCTION exponentiate (rat, n) RESULT (nth_power)
    TYPE (rat_type)                 :: nth_power
    TYPE (rat_type), INTENT (IN)    :: rat
    INTEGER        , INTENT (IN)    :: n

    exponentiate = rat_type(rat%num ** n, rat%denom ** n)
  END FUNCTION exponentiate
  
END MODULE rational_numbers
