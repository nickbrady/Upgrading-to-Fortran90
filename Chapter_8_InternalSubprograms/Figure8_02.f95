FUNCTION vowel_count(string)    RESULT(count)    ! Begin external fucntion

  INTEGER                   :: count
  CHARACTER(*), INTENT(IN)  :: string

  INTEGER :: i

  count = 0
  DO i = 1, LEN(string)
    ! Invoke internal function is_vowel in next statement.
    IF (is_vowel(string(i:i))) count = count + 1
  END DO

CONTAINS    ! indicates internal subprogram(s) follow

  FUNCTION is_vowel(char)   RESULT(vowel)       ! Begin internal function

    LOGICAL                   :: vowel
    CHARACTER(1), INTENT(IN)  :: char

    IF (INDEX("aAeEiIoOuU", char) /= 0) THEN
      vowel = .TRUE.
    ELSE
      vowel = .FALSE.
    END IF

  END FUNCTION is_vowel                         ! End internal function

END function vowel_count                        ! End external function




PROGRAM test_vowel_count

  CHARACTER(*), PARAMETER ::    &
    Sentence = "Fortran 90 was developed jointly by the X3 technical " // &
               "subcommittee X3J3 and IEC/ISO JTC1/SC22/WG5."

  INTEGER :: vowel_count          ! type declaration for external function

  PRINT *, vowel_count(Sentence)    ! Invoke external function

END PROGRAM test_vowel_count
