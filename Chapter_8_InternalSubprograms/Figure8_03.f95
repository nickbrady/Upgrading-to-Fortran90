PROGRAM one_internal_may_invoke_another

  CALL display_binomial_coeffs          ! Invoke internal subroutine

CONTAINS                          ! four internal subprograms follow

  SUBROUTINE display_binomial_coeffs
    INTEGER :: n, k

    CALL get_user_input(n)      ! Invoke internal subroutine

    DO k = 0, n
      PRINT "(2I10)", k, binomial_coeff(n,k)  ! Inokes internal function binomial_coeff
    END DO
  END SUBROUTINE display_binomial_coeffs

  SUBROUTINE get_user_input(n)
    INTEGER, INTENT(OUT)  :: n
    PRINT "(A)", " Input a value for n:"
    READ *, n
  END SUBROUTINE get_user_input

  FUNCTION binomial_coeff(n, k)   RESULT (bin_coeff)
    INTEGER               :: bin_coeff
    INTEGER, INTENT(IN)   :: n, k
    INTRINSIC NINT

    bin_coeff = NINT (fact(n) / ( fact(k) * fact(n-k) ) ) ! Invoke internal function
                                                          ! fact 3 times
  END FUNCTION binomial_coeff

  FUNCTION fact(n)    RESULT(n_fact)
    REAL                :: n_fact
    INTEGER, INTENT(IN) :: n
    INTEGER :: k

    n_fact = 1
    DO k = 2, n
      n_fact = k * n_fact
    END DO
  END FUNCTION fact

END PROGRAM one_internal_may_invoke_another
