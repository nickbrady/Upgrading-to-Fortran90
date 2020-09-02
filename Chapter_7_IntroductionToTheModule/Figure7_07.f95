MODULE shared_data

  IMPLICIT NONE

  INTEGER :: number_of_elements = 5

  INTEGER :: i    ! implied DO index used in initializing last 995 elements
                  ! of array x to 0.0
  REAL, DIMENSION(1000) :: x = (/ 1.0, 2.0, 3.0, 4.0, 5.0, (0.0, i = 6, 1000) /)

END MODULE shared_data



PROGRAM initializing_vars_in_module

  USE shared_data       ! Access all variables in module.

  IMPLICIT NONE

  INTEGER :: j          ! implied DO index in PRINT statements below

  PRINT "(100F6.1)", (x(j), j = 1, number_of_elements)

  CALL change_shared_data_values

  PRINT "(100F6.1)", (x(j), j = 1, number_of_elements)

END PROGRAM initializing_vars_in_module



SUBROUTINE change_shared_data_values

  USE shared_data

  IMPLICIT NONE

  number_of_elements = 4        ! Change value of number_of_elements.

  ! change values of some of the elements of x.
  x(1:4) = (/ -10.0, -20.0, -30.0, -40.0 /)

END SUBROUTINE change_shared_data_values
