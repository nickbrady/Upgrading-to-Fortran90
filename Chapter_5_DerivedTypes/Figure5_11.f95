PROGRAM demo_sequence_stmt

  TYPE :: numeric_seq_type
    SEQUENCE                ! mandatory because of EQUIVALENCE below

    INTEGER :: i
    REAL    :: r
    LOGICAL :: l
  END TYPE numeric_seq_type

  TYPE(numeric_seq_type)  :: a_num_seq
  INTEGER, DIMENSION(3)   :: array
  EQUIVALENCE (array, a_num_seq)

  a_num_seq = numeric_seq_type(1, 1.0, .TRUE.)

  ! Warning: The number 8 in following format may not be OK in some implementations
  PRINT "(3(1X, Z8.8))", array

END PROGRAM demo_sequence_stmt
