MODULE data_to_be_shared

  IMPLICIT NONE

  REAL, DIMENSION(1000) :: array_of_data
  INTEGER               :: number_of_values

END MODULE data_to_be_shared





PROGRAM demo_data_sharing

  USE data_to_be_shared             ! Access number_of_values and array_of_data

  IMPLICIT NONE

  INTEGER :: i

  number_of_values = 5              ! store value in number_of_values
  DO i = 1, number_of_values
    array_of_data(i) = i            ! store values in array_of_data
  END DO

  CALL display_data

END PROGRAM demo_data_sharing




SUBROUTINE display_data

  USE data_to_be_shared             ! Access number_of_values and array_of_data

  IMPLICIT NONE

  INTEGER :: i

  DO i = 1, number_of_values                ! Fetch value from number_of_values
    PRINT "(F6.1)", array_of_data(i)        ! Fetch value from array_of_data
  END DO

END SUBROUTINE display_data
