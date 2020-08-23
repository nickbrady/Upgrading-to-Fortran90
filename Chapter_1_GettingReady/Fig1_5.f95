MODULE arrays_to_be_shared

  INTEGER, PARAMETER :: Max_size = 100      ! maximum size of each array

  REAL, DIMENSION(Max_size) :: x, y         ! array to contain data to be shared

END MODULE arrays_to_be_shared              ! new form of END statement




SUBROUTINE load_arrays (num_values, status_code)    ! Load values into arrays x and y

  USE arrays_to_be_shared                 ! access x, y, Max_size

                                          ! INTENT indicates if dummy args are
                                          ! input or output

  INTEGER, INTENT(IN)  :: num_values      ! number of values to load

  INTEGER, INTENT(OUT) :: status_code     ! 0 = OK,  1 = not OK

  INTEGER :: i                            ! loop index

  IF (num_values <= Max_size) THEN

    DO i = 1, num_values
      x(i) = +i                           ! Load x with positive values
      y(i) = -i                           ! Load y with negative values
    END DO
    status_code = 0                       ! Everything is OK

  ELSE
    status_code = 1                       ! Arrays are too small
  END IF

END SUBROUTINE load_arrays                ! new form of END statement



PROGRAM demo_shared_arrays

  USE arrays_to_be_shared                 ! Access x, y, Max_size

  INTEGER :: num_vals_desired
  INTEGER :: load_status
  INTEGER :: i


  WRITE (*, "(A)", ADVANCE = "NO") &
                              " How many values per array? "
  READ *, num_vals_desired


  CALL load_arrays (num_vals_desired, load_status)


  IF (load_status == 0) THEN              ! == is a synonym for .EQ.
    DO i = 1, num_vals_desired
      PRINT "(2F12.3)", x(i), y(i)
    END DO

  ELSE
    PRINT "(A)",      " Error: Too many values requested."
    PRINT "(A, I5)",  " Maximum array size = ", Max_size

  END IF

END PROGRAM demo_shared_arrays
