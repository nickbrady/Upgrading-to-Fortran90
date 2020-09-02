MODULE array_trig

  REAL, PARAMETER :: Deg_to_rad = 0.0174533

CONTAINS

  ! Function returns rank 1 array containing trigonometric sines of a rank 1
  ! array of angles given in degrees

  FUNCTION array_sin(x)   RESULT(sine)

    REAL, DIMENSION(:), INTENT(IN) :: x   ! Dummy arg assumes shape of actual arg
    REAL, DIMENSION(SIZE(x))    :: sine   ! Result variable is a rank 1 array
                                          ! with same size as dummy arg

    sine = SIN(Deg_to_rad * x)            ! array operations

  END FUNCTION array_sin


  ! Function returns rank 1 array containing trigonometric cosines of a rank 1
  ! array of angles given in degrees

  FUNCTION array_cos(x)   RESULT(cosine)

    REAL, DIMENSION(:), INTENT(IN) :: x   ! Dummy arg assumes shape of actual arg
    REAL, DIMENSION(SIZE(x))  :: cosine   ! Result variable is a rank 1 array
                                          ! with same size as dummy arg

    cosine = COS(Deg_to_rad * x)            ! array operations

  END FUNCTION array_cos

END MODULE array_trig




PROGRAM demo_function_returns_array

  USE array_trig      ! Access array_sin, array_cos, Deg_to_rad.

  REAL, DIMENSION(3)  :: leg
  REAL, DIMENSION(3)  :: x = (/ 30.0, 60.0, 90.0 /)

  leg = 100.0 * array_sin(x)    ! Invoke array_sin and get back rank 1 array of
                                ! 3 elements
  PRINT "(3F10.3)", leg

  leg = 100.0 * array_cos(x)    ! Invoke array_cos and get back rank 1 array of
                                ! 3 elements
  PRINT "(3F10.3)", leg

END PROGRAM demo_function_returns_array
