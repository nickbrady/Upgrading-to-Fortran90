PROGRAM demo_scoping_units              ! scoping unit 5
  INTEGER :: n = 5                      ! scoping unit 5
  INTERFACE                             ! scoping unit 5

    SUBROUTINE external_sub (n)         ! scoping unit 2
      INTEGER, INTENT (IN) :: n         ! scoping unit 2
    END SUBROUTINE external_sub         ! scoping unit 2

  END INTERFACE                         ! scoping unit 5
                                        ! scoping unit 5
  CALL external_sub (89)                ! scoping unit 5
  PRINT "(I3)", n                       ! scoping unit 5
                                        ! scoping unit 5
END PROGRAM demo_scoping_units          ! scoping unit 5



SUBROUTINE external_sub (i)             ! scoping unit 4
  INTEGER, INTENT (IN) :: i             ! scoping unit 4
  INTEGER :: n = 4                      ! scoping unit 4

  TYPE :: derived_type                  ! scoping unit 1
    INTEGER :: n                        ! scoping unit 1
    REAL    :: x                        ! scoping unit 1
  END TYPE derived_type                 ! scoping unit 1

  TYPE (derived_type) :: struct         ! scoping unit 4
  struct % n = 3                        ! scoping unit 4
  struct % x = 67.0                     ! scoping unit 4

  CALL internal_sub                     ! scoping unit 4
  PRINT "(2I3)", n, i                   ! scoping unit 4

CONTAINS                                ! scoping unit 4

  SUBROUTINE internal_sub               ! scoping unit 3
    INTEGER :: n = 3                    ! scoping unit 3
    PRINT "(2I3)", struct % n, n        ! scoping unit 3
  END SUBROUTINE internal_sub           ! scoping unit 3

END SUBROUTINE external_sub             ! scoping unit 4
