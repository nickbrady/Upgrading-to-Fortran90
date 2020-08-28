PROGRAM demo_if_construct

  INTEGER :: control_1, control_2, control_3


  READ *, control_1, control_2, control_3

  outer_test: IF (control_1 < 0) THEN

    inner_test_1: IF (control_2 >= 0) THEN
      PRINT*, "control_1 < 0 & control_2 >=0"
    END IF inner_test_1

  ELSE IF (control_1 == 0) THEN outer_test

    PRINT*, "control_1 is zero"

  ELSE outer_test

    inner_test_2: IF (control_3 /= 0) THEN
      PRINT*, "control_1 > 0 & control_3 not zero"
    END IF inner_test_2

  END IF outer_test

END PROGRAM demo_if_construct
