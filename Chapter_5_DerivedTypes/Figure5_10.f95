! Note: Scoping unit 2 is the host scoping unit for scoping unit 1. Hence
!       Max_len is available inside the derived-type type definition by host
!       association

PROGRAM demo_host_association                   ! scoping unit 2
  INTEGER, PARAMETER :: Max_len = 132           ! scoping unit 2

  TYPE :: char_type                             ! scoping unit 1
    CHARACTER(Max_len)  :: string               ! scoping unit 1
    INTEGER             :: len                  ! scoping unit 1
  END TYPE char_type                            ! scoping unit 1

  TYPE(char_type), DIMENSION(100) :: s          ! scoping unit 2
  CHARACTER(Max_len)  :: buffer                 ! scoping unit 2
  INTEGER :: i, ios, n = 0                      ! scoping unit 2
  INTRINSIC LEN_TRIM                            ! scoping unit 2

  DO                                            ! scoping unit 2
    READ (*, *, IOSTAT = ios) buffer            ! scoping unit 2
    IF (ios /= 0) EXIT                          ! scoping unit 2
    n = n + 1                                   ! scoping unit 2
    s(n)%string = buffer                        ! scoping unit 2
    s(n)%len = LEN_TRIM(s(n)%string)            ! scoping unit 2
  END DO                                        ! scoping unit 2

  DO i = 1, n                                   ! scoping unit 2
    PRINT *, s(i)%string(1:s(i)%len)            ! scoping unit 2
  END DO                                        ! scoping unit 2

END PROGRAM demo_host_association               ! scoping unit 2
