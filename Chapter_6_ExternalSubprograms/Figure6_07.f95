PROGRAM demo_save

  INTEGER :: i

  DO i = 1, 4
    CALL sub
  END DO

END PROGRAM demo_save


SUBROUTINE sub

  LOGICAL       :: first_entry = .TRUE.   ! first_entry acquires SAVE attribute
                                          ! automatically (because given a value
                                          ! at compile time)

  INTEGER, SAVE :: counter                ! Programmer makes sure counter retains
                                          ! value after sub is exited

  IF (first_entry) THEN                   ! Compiler set first_entry before
                                          ! initial entry to sub. For subsequent
    counter = 1                           ! entries to sub, first_entry must
    first_entry = .FALSE.                 ! retain its value from previous entry

  ELSE
    counter = counter + 1                 ! counter must retain its value from
                                          ! previous entry
  END IF

  PRINT *, counter

END SUBROUTINE sub
