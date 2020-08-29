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




program test_identity_matrix

  USE  identity_matrix_maker            ! Gain access to module function identity_matrix

  IMPLICIT NONE                         ! implicit none is good to include in
                                        ! every program
  REAL, DIMENSION(4,4) :: u
  INTEGER :: i                          ! local loop index


  u = 3.0 * identity_matrix(4)          ! invoke module function

  DO i = 1, 4
    PRINT "(4F5.1)", u(i, 1:4)          ! Display ith row of u
  END DO

end program test_identity_matrix
