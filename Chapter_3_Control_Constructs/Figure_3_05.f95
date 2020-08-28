PROGRAM demo_case_day

  CHARACTER(9) :: day_name
  CHARACTER(2) :: day_abbrev


  READ "(A)", day_name

  CALL get_day_abbrev (day_name, day_abbrev)  ! Get two-character abbreviation
                                              ! for day of week.


  SELECT CASE (day_abbrev)                    ! Selector is type CHARACTER

  CASE("MO", "TU", "WE", "TH")
    PRINT*, "Monday through Thursday hours: 9 AM - 9 PM."

  CASE("FR")
    PRINT*, "Friday hours: 9 AM - 5 PM."

  CASE("SA", "SU")
    PRINT*, "Close Saturday and Sunday."
    PRINT*, "Call 1-800-555-1234 for information."

  CASE DEFAULT
    PRINT*, "Illegal day code entry."
    PRINT*, "THe valid entries are: MO, TU, WE, TH, FR, SA, SU."

  END SELECT

END PROGRAM demo_case_day



SUBROUTINE get_day_abbrev (day_name, day_abbrev)    ! Get first two nonblank
                                                    ! input characters and convert
                                                    ! to upper case if input in
                                                    ! lower case
  CHARACTER(*), INTENT(IN)  :: day_name
  CHARACTER(2), INTENT(OUT) :: day_abbrev

  ! named constant strings containing lowercase and upperace letter of English
  ! alphabet in one-to-one correspondence.
  CHARACTER(26), PARAMETER :: Lower = "abcdefghijklmnopqrstuvwxyz"
  CHARACTER(26), PARAMETER :: Upper = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"

  INTEGER :: position                   ! position of letter in alphabet
                                        ! (1 = a or A, 2 = b or B, etc.)

  INTEGER :: i                          ! loop index over characters in string

  day_abbrev = ADJUSTL(day_name)        ! Left-justify input string & strip off
                                        ! first two nonblanks

  DO i = 1, 2                                   ! ! If first two characters are
    position = INDEX (Lower, day_abbrev(i:i))   ! lower case, change to upper.
    IF (position /= 0) day_abbrev(i:i) = Upper(position:position)
  END DO

END SUBROUTINE get_day_abbrev
