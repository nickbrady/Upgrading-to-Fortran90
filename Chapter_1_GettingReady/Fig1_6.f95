MODULE identity_matrix_maker

CONTAINS                          ! Indicates subroutine(s) and/or function(s) follow

  FUNCTION identity_matrix (n)

    INTEGER, INTENT (IN) :: n
    REAL, DIMENSION(n,n) :: identity_matrix   ! this function returns an n x n array

    INTEGER :: j                              ! local loop index

    identity_matrix = 0.0                     ! set each element to zero

    DO j = 1, n                               ! Change value of each element
      identity_matrix(j,j) = 1.0              ! along diagonal to unity
    END DO

  END FUNCTION identity_matrix

END MODULE identity_matrix_maker
