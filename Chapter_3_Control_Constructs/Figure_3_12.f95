PROGRAM demo_exit_followed_by_name

  INTEGER :: outer_loop_index = 2
  INTEGER :: inner_loop_index

  outer_loop: DO
    inner_loop_index = 1

    inner_loop: DO
      IF (inner_loop_index > 3) EXIT inner_loop

      PRINT "(3I4)", outer_loop_index, inner_loop_index, outer_loop_index * inner_loop_index

      IF ((outer_loop_index * inner_loop_index) > 8) EXIT outer_loop

      inner_loop_index = inner_loop_index + 1
    END DO inner_loop

    outer_loop_index = outer_loop_index + 1
  END DO outer_loop

END PROGRAM demo_exit_followed_by_name
