MODULE generic_sin_in_deg
    ! Interface blcok associates generic name
    ! sin_in_deg with four specific names.

    INTERFACE sin_in_deg
      MODULE PROCEDURE  sin_in_deg_for_real_scalar, &
                        sin_in_deg_for_real_rank1,  &
                        sin_in_deg_for_dble_scalar, &
                        sin_in_deg_for_dble_rank1

    END INTERFACE

    INTEGER, PARAMETER :: Dbel = KIND(0D0)
    REAL, PARAMETER :: Deg_to_rad_real = 0.1745329E-1
    REAL(Dble), PARAMETER :: Deg_to_rad_dble = 0.17453292519943D-1

CONTAINS

  ! Find sine of scalar of type default REAL.

  FUNCTION sin_in_deg_for_real_scalar (x) RESULT (sine)
    REAL, INTENT(IN) :: x
    REAL             :: sine
    sine = SIN(Deg_to_rad_real * x)
  END FUNCTION sin_in_deg_for_real_scalar

  ! Find sine of rank 1 array of type default REAL.

  FUNCTION sin_in_deg_for_real_rank1 (x) RESULT (sine)
    REAL, DIMENSION(:), INTENT(IN) :: x
    REAL, DIMENSION(SIZE(x))       :: sine
    sine = SIN (Deg_to_rad_real * x)
  END FUNCTION sin_in_deg_for_real_rank1

  ! Find sine of scalar of type double precision REAL

  FUNCTION sin_in_deg_for_dble_scalar (x) RESULT (sine)
    REAL(Dble), INTENT(IN)  :: x
    REAL(Dble)              :: sine
    sine = SIN(Deg_to_rad_dble * x)
  END FUNCTION sin_in_deg_for_dble_scalar

  ! Find sine of rank 1 array of type double precision REAL

  FUNCTION sin_in_deg_for_dble_rank1 (x) RESULT (sine)
    REAL(Dble), DIMENSION(:), INTENT(IN)  :: x
    REAL(Dble), DIMENSION(SIZE(x))        :: sine
    sine = SIN(Deg_to_rad_dble * x)
  END FUNCTION sin_in_deg_for_dble_rank1

END MODULE generic_sin_in_deg
