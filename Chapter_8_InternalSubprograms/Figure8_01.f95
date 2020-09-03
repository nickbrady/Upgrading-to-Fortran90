SUBROUTINE print_page_header      ! Begin external subroutine
  ! invoke internal subroutine in each of next 3 statements
  CALL print_line_centered ("Twelfth Armored Division")
  CALL print_line_centered ("Daily Flypaper Report")
  CALL print_line_centered ("May 3, 1992")

CONTAINS                  ! indicates internal subprogram(s) follow

  SUBROUTINE print_line_centered (text)     ! Begin internal subroutine.

    CHARACTER(*), INTENT(IN)  :: text

    INTEGER, PARAMETER  :: Line_length  = 80
    INTEGER             :: leading_blanks

    leading_blanks = (Line_length - LEN(text) ) / 2
    PRINT "(A)", REPEAT(" ", leading_blanks) // text

  END SUBROUTINE print_line_centered        ! End internal subroutine.

END SUBROUTINE print_page_header            ! End external subroutine.



PROGRAM test_print_page_header

  CALL print_page_header      ! Invoke external subroutine.

END PROGRAM test_print_page_header
