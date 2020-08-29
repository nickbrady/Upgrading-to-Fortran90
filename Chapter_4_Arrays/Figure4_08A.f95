PROGRAM demo_sections_1

  INTEGER, DIMENSION(1:5) :: array = (/ 11, 22, 33, 44, 55 /)

  PRINT "(3I5)", array(2:4)                 ! subscript triplet -- default stride

  PRINT "(3I5)", array(3:)                  ! subscript triplet -- default upper bound

  PRINT "(3I5)", array(:3)                  ! subscript triplet -- default lower bound

  PRINT "(3I5)", array(1:5:2)               ! subscript triplet -- no defaults

  PRINT "(3I5)", array((/ 2, 4, 5 /))       ! vector subscript

END PROGRAM demo_sections_1
