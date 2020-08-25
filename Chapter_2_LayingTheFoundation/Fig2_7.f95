PROGRAM demo_form_of_main_program           ! program statement

  IMPLICIT  NONE                            ! specification-part
  REAL      sum                             ! specification-part
  INTEGER   count                           ! specification-part
  REAL      x                               ! specification-part
  REAL      average                         ! specification-part

  count = 0                                 ! execution-part
  sum   = 0.0                               ! execution-part
                                            ! execution-part
  DO                                        ! execution-part
    READ *, x                               ! execution-part
    IF (x <= 0.0) EXIT                      ! execution-part
    CALL accumulate_sum                     ! execution-part
  END DO                                    ! execution-part
                                            ! execution-part
  average = find_avg (sum, count)           ! execution-part
  PRINT "(F12.3)", average                  ! execution-part

CONTAINS                                    ! contains statement

  SUBROUTINE accumulate_sum                 ! internal subprograms
    sum = sum + x                           ! internal subprograms
    count = count + 1                       ! internal subprograms
  END SUBROUTINE accumulate_sum             ! internal subprograms
                                            ! internal subprograms
  FUNCTION find_avg (total, n)              ! internal subprograms
    REAL    find_avg                        ! internal subprograms
    REAL    total                           ! internal subprograms
    INTEGER n                               ! internal subprograms
                                            ! internal subprograms
    find_avg = total / n                    ! internal subprograms
  END FUNCTION find_avg                     ! internal subprograms

END PROGRAM demo_form_of_main_program       ! end-program statement
