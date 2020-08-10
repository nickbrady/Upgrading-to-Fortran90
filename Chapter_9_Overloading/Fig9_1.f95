MODULE generic_sin_in_deg
    ! Interface blcok associates generic name
    ! sin_in_deg with four specific names

    INTERFACE sin_in_deg
      MODULE PROCEDURE  sin_in_deg_for_real_scalar, &
                        sin_in_deg_for_real_rank1,  &
                        sin_in_deg_for_dble_scalar, &
                        sin_in_deg_for_dble_rank1

    END INTERFACE

! TEST SOME MORE

END MODULE generic_sin_in_deg
