PROGRAM demo_attributes

  INTEGER, PARAMETER :: Max_vals = 100            ! named constant

  REAL, DIMENSION(Max_vals) :: vals               ! one-dimensional array with
                                                  ! subscripts 1 thru Max_vals

  REAL, EXTERNAL :: mean                          ! external function

  REAL    :: val_read
  INTEGER :: count = 0
  INTEGER :: ios


  DO
    READ (*, *, IOSTAT = ios) val_read            ! read a numerical value

    IF (ios /= 0) EXIT                            ! Exit on EOF or error

    IF (count <= Max_vals) THEN
      count = count + 1                           ! count values read
      vals(count) = val_read                      ! store values in array

    ElSE
      PRINT *, "Error: Too many input values."
      STOP
    END IF

  END DO

  IF (ios < 0) THEN
    PRINT "(/A, F12.3)", " Average =", mean(count, vals)    ! invoke external
                                                            ! function - mean
  ElSE
    PRINT "(/A)", " Error on read."
  END IF

END PROGRAM demo_attributes



FUNCTION mean (n, x)

  REAL                            :: mean         ! result variable

  INTEGER,            INTENT (IN) :: n            ! input dummy arg

  REAL, DIMENSION(n), INTENT (IN) :: x            ! input dummy arg, that is a
                                                  ! one-dimensional array with
                                                  ! subscripts 1 through n

  ! Standard permits typing intrinsic function, but not recommended by author.
  ! Following may prodcue warning.
  REAL, INTRINSIC :: SUM                          ! SUM is new intrinsic function

  mean = SUM(x) / n                               ! computer average of n elements of x

END FUNCTION mean
