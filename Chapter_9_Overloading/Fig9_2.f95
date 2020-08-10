MODULE rational_numbers

  TYPE :: rat_type
    INTEGER :: num, denom
  END TYPE rat_type

  INTERFACE OPERATOR (+)            ! Invoke add_rats when + appears surrounded
    MODULE PROCEDURE add_rats       ! by objects of type rat_type
  END INTERFACE

  INTERFACE OPERATOR (*)            ! Invoke mult_rats when * appears surrounded
    MODULE PROCEDURE mult_rats      ! by objects of type rat_type
  END INTERFACE

CONTAINS

  ! Add two data objects of type rat_type

  FUNCTION add_rats(rat_1, rat_2) RESULT(sum)
    TYPE(rat_type)                  :: sum
    TYPE(rat_type), INTENT(IN)      :: rat_1, rat_2

    ! The + and *'s below refer to intrinsic operators
    sum = rat_type (rat_1%num * rat_2%denom + rat_1%denom * rat_2%num, &
                    rat_1%denom * rat_2%denom)
    ! Alternate definition
    ! sum%num = rat_1%num * rat_2%denom + rat_1%denom * rat_2%num
    ! sum%denom = rat_1%denom * rat_2%denom

  END FUNCTION add_rats

  ! Multiply tow data objects of type rat_type

  FUNCTION mult_rats (rat_1, rat_2) RESULT (product)
    TYPE (rat_type)                 :: product
    TYPE (rat_type), INTENT (IN)    :: rat_1, rat_2

    ! The *'s below refer to the intrinsic operator
    product = rat_type( rat_1%num * rat_2%num, &
                        rat_1%denom * rat_2%denom )
    ! Alternate definition
    ! product%num = rat_1%num * rat_2%num
    ! product%denom = rat_1%denom * rat_2%denom
  END FUNCTION mult_rats

END MODULE rational_numbers


PROGRAM overloading_operators

  USE rational_numbers

  TYPE (rat_type) :: rat_1 = rat_type (2, 3), &
                     rat_2 = rat_type (4, 5)

  TYPE (rat_type) :: result

  result = rat_1 + rat_2            ! Invoke module proc add_rats to add 2/3 to 4/5

  PRINT "(I3, '/', I2)", result

  result = rat_1 * rat_2            ! Invoke module proc mult_rats to multiply
                                    ! 2/3 times 4/5
  PRINT "(I3, '/', I2)", result

  PRINT "(I3)", (1 + 2) * 3         ! + and * also retain their intrinsic meaning

END PROGRAM
