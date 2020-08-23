PROGRAM demo_array_operations

  REAL, DIMENSION(3) :: a = (/ 2.0, 8.0, 18.0 /)    ! Declare an array and give
                                                    ! it initial values
  REAL, DIMENSION(3) :: b, c

  b = 2.0 * a                                       ! Multiply a scalar constant
                                                    ! tiems an array

  c = SQRT(b) + (/ 1.0, 2.0, 3.0 /)                 ! Take square root of each
                                                    ! element of array b and add
                                                    ! array constant to result

  PRINT "(F6.1)", c                                 ! result (/ 3.0, 6.0, 9.0 /)

END PROGRAM demo_array_operations
