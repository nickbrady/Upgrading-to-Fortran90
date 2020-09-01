PROGRAM sort_array_of_derived_type

  TYPE :: item_rec                ! item:
    CHARACTER(20) :: descr        ! description
    INTEGER       :: qty          ! quantity
    REAL          :: price        ! price
  END TYPE item_rec

  TYPE :: req_type                ! requisition:
    INTEGER           :: req_num  ! requisition number
    TYPE(item_rec)    :: item     ! item requisitioned
  END TYPE req_type

  ! Load array of structures req using an array constructor.
  ! A structure constructor is used for each element of req.
  TYPE(req_type), DIMENSION(5) :: req =                     &
    (/  req_type(1, item_rec("Nuts",          1000,   6.78)),   &
        req_type(2, item_rec("Bolts",          500,   8.43)),   &
        req_type(3, item_rec("Hammer",          10,  19.49)),   &
        req_type(4, item_rec("Screwdriver",     30,  12.855)),  &
        req_type(5, item_rec("Chisel",           5,   9.858))   /)

  TYPE(req_type) :: temp      ! for exchanging elements of req
  INTEGER :: i                ! loop index over elements in req
  LOGICAL :: no_exchange      ! ture if no element of req foudn to be out of order

  ! Sort elements of req alphabetically by description
  DO                            ! Use bubble sort.
    no_exchange = .TRUE.
    DO i = 1, SIZE(req) - 1
      IF (req(i)%item%descr > req(i+1)%item%descr) THEN
        ! Found adjacent pair of elements out of order.
        temp      = req(i)          ! Exchange
        req(i)    = req(i+1)        ! adjacent
        req(i+1)  = temp            ! elements
        no_exchange = .FALSE.
      END IF
    END DO
    IF (no_exchange) EXIT           ! Exit loop wehn array is in order.
  END DO

  DO i = 1, SIZE(req)
    PRINT "(I3, 1X, A, I5, F6.2)", req(i)
  END DO

END PROGRAM sort_array_of_derived_type
