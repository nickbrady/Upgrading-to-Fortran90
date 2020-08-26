PROGRAM demo_initialization

  INTEGER :: count = 0                        ! count of input values
  INTEGER :: ios                              ! I/O status

  REAL :: sum = 0.0                           ! sum of input values
  REAL :: val_read                            ! input value just read
  REAL :: smallest_val = HUGE (0.0)           ! smallest input value so far

  CHARACTER(7) :: out_fmt = "(F12.3)"         ! format for display


  DO
    READ (*, *, IOSTAT = ios) val_read        ! /= is a synonym for .NE. (not equal)
    IF (ios /= 0) EXIT                        ! EXIT on EOF or error
    count = count + 1                         ! count input values
    sum = sum + val_read                      ! sum input values
    IF (val_read < smallest_val) &            ! if smallest so far,
        smallest_val = val_read               !    then save value
  END DO

  IF (ios < 0) THEN                           ! end of file detected
    PRINT out_fmt, sum / count                ! Print average of input values
    PRINT out_fmt, smallest_val               ! Print smallest value input

  ELSE                                        ! error detected on read
    PRINT *, "Error on read."
  END IF

END PROGRAM demo_initialization
