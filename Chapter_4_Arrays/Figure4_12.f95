PROGRAM demo_allocatable_array

  INTEGER, DIMENSION(:), ALLOCATABLE :: a_vector

  INTEGER :: length_of_vector, loop_index

  READ *, length_of_vector                      ! Get size of array.

  ALLOCATE (a_vector(1:length_of_vector))       ! Get storage and declare subscript
                                                ! bounds for array
  DO loop_index = 1, length_of_vector
    a_vector(loop_index) = loop_index           ! Put vals in array
  END DO

  PRINT *, a_vector                             ! Display array values

  DEALLOCATE (a_vector)                         ! Free array storage

END PROGRAM demo_allocatable_array
