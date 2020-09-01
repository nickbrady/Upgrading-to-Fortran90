PROGRAM demo_array_of_structures

  TYPE :: employee_type
    INTEGER         :: employee_number
    CHARACTER(20)   :: name
    CHARACTER(15)   :: job_title
    REAL            :: weekly_salary
    LOGICAL         :: is_married
  END TYPE employee_type

  ! Declare a 5-element, rank 1 array of type employee_type
  TYPE(employee_type), DIMENSION(5) :: employee

  INTEGER :: employee_index

  employee(1) = employee_type(1111, "Karen Thorne", "Manager", 1350.64, .TRUE.)
  employee(2) = employee_type(2222, "John McIntyre", "Engineer", 1208.37, .FALSE.)
  employee(3) = employee_type(3333, "Linda Thompson", "Secretary", 746.19, .TRUE.)
  employee(4) = employee_type(4444, "George Marshall", "Administrator", 980.46, .TRUE.)
  employee(5) = employee_type(5555, "Cindy Smith", "Receptionist", 565.07, .FALSE.)

  DO employee_index = 1, 5
    IF (employee(employee_index)%weekly_salary > 900.00) THEN
      PRINT "(I5, 1X, 2A, F7.2, 1X, L1)", employee(employee_index)
    END IF

  END DO

END PROGRAM demo_array_of_structures
