MODULE struct_array_assignments

  TYPE :: point_type
    REAL :: x1, x2, x3
  END TYPE point_type

  INTERFACE ASSIGNMENT (=)                      ! Associate equal sign with
    MODULE PROCEDURE  struct_to_array, &        ! procedures struct_to_array
                      array_to_struct           ! and array_to_struct
  END INTERFACE

CONTAINS

  ! Convert data from structure of type point_type to size 3 REAL array of rank 1

  SUBROUTINE struct_to_array (x, point)

    TYPE (point_type),  INTENT (IN)   :: point
    REAL, DIMENSION(3), INTENT (OUT)  :: x

    x(1) = point%x1
    x(2) = point%x2
    x(3) = point%x3

  END SUBROUTINE struct_to_array

  ! Convert data from size 3 REAL array of rank 1 to structure of type point_type

  SUBROUTINE array_to_struct (point, x)

    REAL, DIMENSION(3), INTENT(IN)    :: x
    TYPE (point_type),  INTENT (OUT)  :: point

    point%x1 = x(1)
    point%x2 = x(2)
    point%x3 = x(3)

  END SUBROUTINE array_to_struct

END MODULE struct_array_assignments


PROGRAM demo_defined_assignment

  USE struct_array_assignments    ! Access meanings of = defined in module

  TYPE (point_type)   :: point
  REAL, DIMENSION(3)  :: x

  point = point_type (1.0, 2.0, 3.0)    ! intrinsic assignment

  x = point                             ! assignment defined by struct_to_array

  PRINT "(3F5.1)", x

  point = 2.0 * x                       ! assignment defined by array_to_struct

  PRINT "(3F5.1)", point

END PROGRAM demo_defined_assignment
