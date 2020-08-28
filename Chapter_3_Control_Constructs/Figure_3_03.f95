PROGRAM demo_case

  INTEGER :: choice


  PRINT*, "Enter an integer from 1 through 3:"
  READ*, choice

  SELECT CASE (choice)
  CASE(1)
    PRINT*, "You chose option one."
  CASE(2)
    PRINT*, "You chose option two."
  CASE(3)
    PRINT*, "You chose option three."
  CASE DEFAULT
    PRINT*, "Illegal input value."
  END SELECT

END PROGRAM demo_case
