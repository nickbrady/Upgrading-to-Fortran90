!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
!             Warning: The style of this program is not exemplary.             !
!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

PROGRAM demo_free_source_form       ! Statements may start in column 1

  IMPLICIT NONE                     ! Blank required between IMPLICIT and NONE

  INTEGER var_1, &                  ! Ampersand indicates continuation
          var_2, &
          var_3

  INTEGER very_long_variable_name


  PRINT 1234, " Position of statement numbers not restricted."
              1234 FORMAT (A)       ! Label may be anywhere on line

      PRINT "(A)", " This is &
                    &standard"      ! one way to continue a string

      PRINT "(A)", " This is " // & ! second way to continue a string
                   "also standard."

  very_long_variable_name = 4
  PRINT '(I5)', very_long_vari&     ! example of continuing a name
                &able_name

  var_1 = 1; var_2 = 2; var_3 = 3;  ! semicolon separates multiple statements
                                    ! on line

  PRINT '(3I5)', var_1, var_2, var_3

END PROGRAM demo_free_source_form   ! new form of END statement
