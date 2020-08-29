PROGRAM demo_array_assignment

  REAL, DIMENSION(2, 3)         :: a_1
  REAL, DIMENSION(-1:0, -1:1)   :: a_2
  INTEGER                       :: row, col

  a_1 = -1.0                                    ! scalar assigned to array

  DO row = 1, 2
    PRINT "(3F6.1)", (a_1(row, col), col = 1, 3)
  END DO

  a_2(-1, -1) = 1.0;  a_2(-1, 0) = 3.0;   a_2(-1, 1) = 5.0
  a_2( 0, -1) = 2.0;  a_2( 0, 0) = 4.0;   a_2( 0, 1) = 6.0

  a_1 = a_2                                     ! array assinged to array

  DO row = 1, 2
    PRINT "(3F6.1)", (a_1(row, col), col = 1, 3)
  END DO

END PROGRAM demo_array_assignment
