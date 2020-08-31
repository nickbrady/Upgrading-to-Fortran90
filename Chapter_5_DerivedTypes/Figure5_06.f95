PROGRAM demo_array_component_of_struct

  ! Define a derived type with an array component
  TYPE :: inventory_rec
    CHARACTER(8)            :: part_number
    INTEGER                 :: quantity_on_hand
    INTEGER, DIMENSION(4)   :: quarterly_sales    ! component is a 4 element rank 1 array

  END TYPE inventory_rec

  TYPE(inventory_rec) :: inv_item     ! Declare a scalar variable of type inventory_rec

  inv_item%part_number        = "AB92X7R"
  inv_item%quantity_on_hand   = 36

  inv_item%quarterly_sales(1) = 45    ! Store a value in each element of the
  inv_item%quarterly_sales(2) = 41    ! array component of scalar variable
  inv_item%quarterly_sales(3) = 48    ! inv_item
  inv_item%quarterly_sales(4) = 46

  PRINT "(1X, A, 5I3)", inv_item

END PROGRAM demo_array_component_of_struct
