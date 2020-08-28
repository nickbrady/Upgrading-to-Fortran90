PROGRAM demo_case_day

  INTEGER :: day_code


  READ*, day_code

  SELECT CASE (day_code)

  CASE(2:5)
    PRINT*, "Monday through Thursday hours: 9 AM - 9 PM."

  CASE(6)
    PRINT*, "Friday hours: 9 AM - 5 PM."

  CASE(7, 1)
    PRINT*, "Close Saturday and Sunday."
    PRINT*, "Call 1-800-555-1234 for information."

  CASE DEFAULT
    PRINT*, "Illegal day code entry."
    PRINT*, "THe valid entries are 1, 2, 3, 4, 5, 6, or 7."

  END SELECT

END PROGRAM demo_case_day
