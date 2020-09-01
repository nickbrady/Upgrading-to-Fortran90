SUBROUTINE change_chars (from_char, to_char, dummy_string, number_changed)

  CHARACTER(1), INTENT(IN)      :: from_char        ! input
  CHARACTER(1), INTENT(IN)      :: to_char          ! input
  CHARACTER(*), INTENT(IN OUT)  :: dummy_string     ! changed
  INTEGER,      INTENT(OUT)     :: number_changed   ! output

  INTEGER :: i    ! local

  number_changed = 0
  DO i = 1, LEN(dummy_string)
    IF (dummy_string(i:i) == from_char) THEN
      dummy_string(i:i) = to_char
      number_changed = number_changed + 1
    END IF
  END DO

END SUBROUTINE change_chars



PROGRAM test_change_chars

  CHARACTER(6)  :: char_string = "  1.2 "

  INTEGER       :: number_chars_changed

  PRINT "(2A)", " Before CALL, char_string = ", char_string

  CALL change_chars (" ", "0", char_string, number_chars_changed)

  PRINT "(2A)", " After CALL, char_string = ", char_string
  PRINT "(A, I1)", " Number of characters changed = ", number_chars_changed

END PROGRAM test_change_chars
