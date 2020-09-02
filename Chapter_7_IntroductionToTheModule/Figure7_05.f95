MODULE allocatable_arrays

  IMPLICIT NONE

  INTEGER, ALLOCATABLE, DIMENSION(:)    :: v
  REAL,    ALLOCATABLE, DIMENSION(:,:)  :: a

END MODULE allocatable_arrays



PROGRAM demo_allocatable_arrays_in_module

  USE allocatable_arrays

  IMPLICIT NONE

  INTEGER :: n

  READ *, n
  ALLOCATE(v(n), a(n, 2*n))   ! Set storage for v and a

  CALL fill_arrays(n)         ! store data in v and a.

  CALL display_arrays(n)      ! Display contents of v and a.

END PROGRAM demo_allocatable_arrays_in_module




SUBROUTINE fill_arrays(n)

  USE allocatable_arrays

  IMPLICIT NONE

  INTEGER, INTENT(IN) :: n

  INTEGER :: i, j

  DO i = 1, n
    v(i) = i                      ! store values in v
    DO j = 1, 2*n
      a(i,j) = 100*i + j          ! store values in a
    END DO
  END DO

END SUBROUTINE fill_arrays




SUBROUTINE display_arrays(n)

  USE allocatable_arrays

  IMPLICIT NONE

  INTEGER, INTENT(IN) :: n

  INTEGER :: i, j

  DO i = 1, n
    PRINT "(I4, 100F6.1)", v(i), (a(i,j), j = 1, 2*n)
  END DO

  DEALLOCATE(v, a)            ! Free storage for v and a.

END SUBROUTINE display_arrays
