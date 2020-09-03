PROGRAM demo_scope_of_var_names

  IMPLICIT NONE   ! in effect both above and below CONTAINS

  INTEGER :: v1 = 1   ! v1, v2 accessible above CONTAINS and also, except where
  INTEGER :: v2 = 2   ! in conflict with local variables, below CONTAINS

  PRINT "(2(A, I2))", " In host, v1 = ", v1, ", v2 = ", v2

  CALL sub

  v1 = v1 + 1
  v2 = v2 + 1     ! this v2 **NOT** same as v2 inside subroutine

  PRINT "(2(A, I2))", " In host, v1 = ", v1, ", v2 = ", v2

  CALL sub

CONTAINS

  SUBROUTINE sub

    INTEGER :: v2 = 20    ! v2, v3 are local to this subroutine
    INTEGER :: v3 = 30

    v1 = v1 + 1           ! access v1 by host association
    v2 = v2 + 1           ! refer to v2 local to subroutine
    v3 = v3 + 1

    PRINT "(3(A, I2))", " In sub,  v1 = ", v1,      &
                                ", v2 = ", v2,      &
                                ", v3 = ", v3

  END SUBROUTINE sub

END PROGRAM demo_scope_of_var_names
