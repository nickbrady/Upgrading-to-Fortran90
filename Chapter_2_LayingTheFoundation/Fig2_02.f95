PROGRAM demo_valid_Fortran_90_names

  names_may_contain_underscores = 1
  PRINT "(I6)", names_may_contain_underscores

  consecutive_underscores__are_OK = 2.0
  PRINT "(F6.1)", consecutive_underscores__are_OK

  may_end_with_an_underscore_ = 3
  PRINT "(I6)", may_end_with_an_underscore_

  digits_are_gr8_4_names_2 = 4.0
  PRINT "(F6.1)", digits_are_gr8_4_names_2

  longest_supported_by_Fortran_90 = 31
  PRINT "(I6)", longest_supported_by_Fortran_90

  print = 132.0                                   ! Name may duplicate a keyword
  PRINT "(F6.1)", print

  sqrt = 25.0 ** 0.5                              ! Name may duplicate that of
  PRINT "(F6.1)", sqrt                            ! an intrinsic procedure

END PROGRAM demo_valid_Fortran_90_names           ! NEW form of end statement
