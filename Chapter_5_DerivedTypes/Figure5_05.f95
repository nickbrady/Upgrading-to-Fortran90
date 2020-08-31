PROGRAM demo_nested_structures

  TYPE :: address_type
    CHARACTER(60) :: number_and_street
    CHARACTER(20) :: city
    CHARACTER(2)  :: state_abbreviation
    CHARACTER(5)  :: zip_code
  END TYPE address_type

  TYPE :: customer_record                       ! component types:
    CHARACTER(50)       :: customer_name        ! intrinsic type
    TYPE(address_type)  :: address              ! derived type
  END TYPE customer_record

  TYPE (address_type)     :: an_address
  TYPE (customer_record)  :: a_customer

  an_address = address_type ("1234 State Street", "Chicago", "IL", "60609")

  ! Structure constructor contains variable of derived type.
  a_customer = customer_record ("Michael Wong", an_address)

  PRINT "(1X, A)", a_customer%customer_name

  ! number_and_street is component of address_type, which is data type
  ! of address component of a_customer
  PRINT "(1X, A)", a_customer%address%number_and_street

  PRINT "(1X, A)", TRIM (a_customer%address%city) // "," &
                    // a_customer%address%state_abbreviation &
                    // " " // a_customer%address%zip_code

END PROGRAM demo_nested_structures
