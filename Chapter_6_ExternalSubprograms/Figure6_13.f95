PROGRAM demo_scope                                                     ! scope 1
      DO 100 int_var = 1, 2                                            ! scope 1
        PRINT "(A, I2)", " Before CALL sub_1, int_var = ", int_var     ! scope 1
        CALL sub_1                                                     ! scope 1
        PRINT "(A, I2)", "  After CALL sub_1, int_var = ", int_var     ! scope 1
        PRINT "(1X)"                                                   ! scope 1
  100 END DO                                                           ! scope 1
      CALL sub_2 ("main program")                                      ! scope 1
END PROGRAM demo_scope                                                 ! scope 1




SUBROUTINE sub_1                                                       ! scope 2
      DO 100 int_var = -1, -2, -1                                      ! scope 2
        PRINT "(A, I2)", "      Inside sub_1, int_var = ", int_var     ! scope 2
  100 END DO                                                           ! scope 2
      CALL sub_2 ("sub_1")                                             ! scope 2
END SUBROUTINE sub_1                                                   ! scope 2




SUBROUTINE sub_2 (caller)                                              ! scope 3
  CHARACTER(*), INTENT(IN)  :: caller                                  ! scope 3
  PRINT "(A)", " Inside sub_2 called by " // caller                    ! scope 3
END SUBROUTINE sub_2                                                   ! scope 3
