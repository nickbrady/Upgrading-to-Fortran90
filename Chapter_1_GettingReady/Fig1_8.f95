PROGRAM demo_pointer

  REAL, DIMENSION(:), POINTER :: p    ! Declare a pointer to a one-dimensional
                                      ! array of type REAL

  REAL, DIMENSION(4), TARGET  :: a    ! Declare arrays that may be pointed to
  REAL, DIMENSION(3), TARGET  :: b

  INTEGER :: i                        ! loop index


  a = (/ 1.0, 2.0, 3.0, 4.0 /)
  p => a                              ! cause p to point to a.
  PRINT "(4F7.1)", p

  b = (/ -1.0, -2.0, -3.0 /)
  p => b                              ! cause p to point to b.
  PRINT "(3F7.1)", p

  ALLOCATE (p(4))                     ! Create storage area for 4 REALs and cause
                                      ! p to point to it

  DO i = 1, SIZE(p)                   ! SIZE is an intrinsic function.
    p(i) = 1000.0 * i                 ! Put values in storage area.
  END DO
  PRINT "(4F7.1)", p

  DEALLOCATE(p)                       ! Free storage area

END PROGRAM demo_pointer
