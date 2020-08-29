PROGRAM demo_cycle

  CHARACTER(80) :: buffer
  INTEGER :: i, rd_stat, nonblanks


  process_line: DO

    READ (*, "(A)", IOSTAT = rd_stat) buffer

    IF (rd_stat /= 0) EXIT process_line

    nonblanks = 0

    count_nonblanks: DO i = 1, 80

      IF (buffer(i:i) == "*") CYCLE process_line

      IF (buffer(i:i) /= " ") nonblanks = nonblanks + 1

    END DO count_nonblanks

    PRINT "(I5)", nonblanks

  END DO process_line

END PROGRAM demo_cycle
