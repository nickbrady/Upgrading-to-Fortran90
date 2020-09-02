MODULE saved_allocatable_arrays

  IMPLICIT NONE

  INTEGER, ALLOCATABLE, DIMENSION(:),   SAVE :: v   ! arrays will be SAVEd
  REAL,    ALLOCATABLE, DIMENSION(:,:), SAVE :: a

  INTEGER  :: n   ! n not guaranteed to be SAVEd

END MODULE saved_allocatable_arrays



PROGRAM demo_saved_arrays

  ! Note that main program does not use saved_allocatable_arrays.

  CALL fill_arrays

  ! v and a are guaranteed to remain defined her because of SAVE attribute when
  ! declared in module.  n is not guaranteed to be defined here (but unimportant
  ! since unused for remainder of program execution).

  CALL display_arrays

END PROGRAM demo_saved_arrays



SUBROUTINE fill_arrays

  USE saved_allocatable_arrays    ! Access v and a.

  IMPLICIT NONE

  INTEGER :: i, j

  READ *, n                       ! Get user input

  ALLOCATE(v(n), a(n,2*n))        ! Set storage for v and a.

  DO i = 1, n
    v(i) = i                      ! store values in v
    DO j = 1, 2*n
      a(i,j) = 100*i + j          ! store values in a
    END DO
  END DO

END SUBROUTINE fill_arrays




SUBROUTINE display_arrays

  USE saved_allocatable_arrays    ! Access v and a.

  IMPLICIT NONE

  INTEGER :: i, j

  DO i = 1, n
    PRINT "(I4, 100F6.1)", v(i), (a(i,j), j = 1, SIZE(a, 2))
  END DO

  DEALLOCATE(v, a)            ! Free storage for v and a.

END SUBROUTINE display_arrays
