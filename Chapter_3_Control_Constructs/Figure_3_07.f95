! Program to sum integers from 1 through n for a user-specificed value of n
PROGRAM sum_integers

  INTEGER :: n            ! input: user specified integer
  INTEGER :: sum = 0      ! output
  INTEGER :: i            ! loop index

  READ *, n

  DO i = 1, n
    sum = sum + i
  END DO

  PRINT *, sum

END PROGRAM sum_integers
