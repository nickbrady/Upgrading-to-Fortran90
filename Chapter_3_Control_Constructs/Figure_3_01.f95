PROGRAM demo_if_construct

  INTEGER :: control_1, control_2, control_3


  READ *, control_1, control_2, control_3

  IF (control_1 < 0) THEN

    IF (control_2 >= 0) THEN
      PRINT*, "control_1 < 0 & control_2 >=0"
    END IF

  ELSE IF (control_1 == 0) THEN

    PRINT*, "control_1 is zero"

  ELSE

    IF (control_3 /= 0) THEN
      PRINT*, "control_1 > 0 & control_3 not zero"
    END IF

  END IF

END PROGRAM demo_if_construct
