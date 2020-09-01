PROGRAM struct_name_same_as_comp_name

  TYPE :: silly_type
    INTEGER :: silly      ! Define component named silly
  END TYPE silly_type

  TYPE(silly_type) :: silly     ! declare variable named silly.

  silly%silly = 7               ! variable name to left of %,
                                ! component name to right of %.

  PRINT *, silly                ! refers to variable name

END PROGRAM struct_name_same_as_comp_name
