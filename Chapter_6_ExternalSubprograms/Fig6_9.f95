RECURSIVE FUNCTION compute_factorial (n) RESULT (n_factorial)

  INTEGER                 :: n_factorial    ! result variable
  INTEGER, INTENT (IN)    :: n

  IF (n == 0) THEN
    n_factorial = 1
  ELSE
                      ! Function invokes itself
    n_factorial = n * compute_factorial (n - 1)
  END IF

END FUNCTION compute_factorial


PROGRAM test_recursive_function

  INTEGER :: compute_factorial

  PRINT *, compute_factorial (5)

END PROGRAM test_recursive_function
