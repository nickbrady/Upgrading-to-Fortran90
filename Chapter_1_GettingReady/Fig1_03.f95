PROGRAM read_and_store_names

  IMPLICIT NONE                                       ! IMPLICIT NONE now standard

  INTEGER :: read_status, i                           ! double colon in type declaration

  INTEGER :: num_names = 0                            ! new form of initialization

  INTEGER, PARAMETER :: Max_names = 100               ! new way to declare a constant

  CHARACTER(132), DIMENSION(Max_names) :: names       ! new way to dimension an array

  CHARACTER(132) :: buffer                            ! new way to specify length of
                                                      ! CHARACTER variable

  DO                                                  ! new form of DO

    WRITE(*, "(A)", ADVANCE = "NO") &                 ! ADVANCE = "NO" suppresses
                " Enter name (or EOF to quit): "      ! line feed here
    READ(*, "(A)", IOSTAT = read_status) buffer
                                                      ! < is a synonym for .LT.
    IF (read_status < 0) EXIT                         ! EXIT is new

    IF (num_names >= Max_names) THEN                  ! >= is a synonym for .GE.
      PRINT *, "Too many input names."
      STOP
    END IF

    num_names = num_names + 1
    names(num_names) = buffer

  END DO                                              ! END DO is now standard

  PRINT "(//A)", " List of names input:"

  DO i = 1, num_names                                 ! no label required to index DO
    PRINT *, TRIM(names(i))                           ! TRIM is new intrinsic function
  END DO

END PROGRAM read_and_store_names
