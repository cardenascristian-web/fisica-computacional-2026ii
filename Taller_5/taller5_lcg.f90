! Taller 5 -- pi por acierto y error con el LCG (57, 1, 256) en lugar de random_number.
! Salida: lcg.dat (N, pi_est).
program taller5_lcg
  implicit none
  integer, parameter :: dp = kind(1.0d0)
  integer, parameter :: a_lcg = 57, c_lcg = 1, M_lcg = 256
  integer :: k, r, u_dat
  integer(8) :: i, n_total, n_aciertos
  real(dp) :: x, y, pi_est

  open(newunit=u_dat,file='lcg.dat',status='replace')
  do k = 2, 7                                   ! N = 10^2, ..., 10^7
     n_total = 10_8**k
     r = 10                                     ! semilla del LCG, la misma para cada N
     n_aciertos = 0_8

     ! C1. Cada punto utiliza dos valores consecutivos del LCG.
     do i = 1_8, n_total
        r = mod(a_lcg*r + c_lcg, M_lcg)
        x = 2.0_dp*real(r,dp)/real(M_lcg,dp) - 1.0_dp
        r = mod(a_lcg*r + c_lcg, M_lcg)
        y = 2.0_dp*real(r,dp)/real(M_lcg,dp) - 1.0_dp
        if (x*x + y*y < 1.0_dp) n_aciertos = n_aciertos + 1_8
     end do
     pi_est = 4.0_dp*real(n_aciertos,dp)/real(n_total,dp)

     write(u_dat,'(i10,es25.16e3)') n_total,pi_est
     print '(i10,f12.6)', n_total,pi_est
  end do
  close(u_dat)
end program taller5_lcg
