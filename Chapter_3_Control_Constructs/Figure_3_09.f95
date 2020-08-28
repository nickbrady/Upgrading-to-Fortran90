! This program determines number of years required to reach a specified goal when
! starting with a specified amount of money and doubling one's money each year

PROGRAM double_your_money

  INTEGER, PARAMETER :: starting_amount = 1000, &
                        goal            = 1000000

  INTEGER            :: year = 0, amount


  amount = starting_amount

  DO WHILE (amount < goal)
    year = year + 1
    amount = 2 * amount

    PRINT "(2I10)", year, amount
  END DO

END PROGRAM double_your_money
