PROGRAM invert_matrix
  REAL, DIMENSION(:,:), ALLOCATABLE :: a
  INTEGER :: i, j, m, n
  REAL, DIMENSION(:), ALLOCATABLE :: temp

  PRINT "(A)", " Enter number of rows (= number of columns):"
  READ *, n

  ALLOCATE (a(n,2*n), temp(2*n))

  ! Get elements of matrix to be inverted.
  DO i = 1, n
    DO j = 1, n
      PRINT "(2(A, I3))", " Enter value of element" // " in row ", i, " col ", j

      READ *, a(i, j)
    END DO
  END DO

  a(:, n+1:2*n) = 0.0                   ! Append identity matrix to right of
  DO i = 1, n                           ! matrix to be inverted
    a(i, n+i) = 1.0
  END DO


! ********************* Perform Gauss-Jordan Elimination ********************* !

  DO j = 1, n                           ! loop over first n columns of matrix

    ! Find row index m of element with largest magnitude
    m = j                               ! Start on the diagonal
    DO i = j + 1, n                     ! Loop over rows below diagonal
      IF ( ABS(a(i,j)) > ABS(a(m,j)) )  m = i
    END DO

    ! Exchange row m with row j
    temp = a(j,:);  a(j,:) = a(m,:);  a(m,:) = temp

    a(j,:) = a(j,:) / a(j,j)            ! Divide row j by a(j,j)

    DO i = 1, n                         ! Loop over each row of matrix
                                        ! Subtract a(i,j) times row j from row i
      IF (i /= j) a(i,:) = a(i,:) - a(i,j) * a(j,:)
    END DO

  END DO

  PRINT "(/A)", " The inverse is"
  DO i = 1, n
    PRINT *, a(i, n+1:2*n)            ! Display each row of inverse
  END DO

END PROGRAM invert_matrix
