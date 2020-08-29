PROGRAM find_average

  INTEGER :: number_of_values = 0
  REAL    :: value
  REAL    :: sum_of_values = 0.0
  REAL    :: average


  DO                                                ! simple DO statement
    READ *, value
    IF (value < 0.0) EXIT                           ! break out of loop

    number_of_values = number_of_values + 1
    sum_of_values = sum_of_values + value

  END DO

  average = sum_of_values / number_of_values
  PRINT *, average

END PROGRAM find_average
