PROGRAM demo_duplicate_names

  TYPE :: stock_rec
    CHARACTER(5)  :: id     ! Define component named id.
    INTEGER       :: qty
  END TYPE stock_rec

  TYPE (stock_rec) :: item

  CHARACTER(5) :: id        ! Declare variable named id.

  READ *, id                ! refers to variable

  item%id = id              ! left side refers to component
                            ! right side refers to variable
  item%qty = 89

  PRINT "(1X, A, I5)", item

END PROGRAM demo_duplicate_names
