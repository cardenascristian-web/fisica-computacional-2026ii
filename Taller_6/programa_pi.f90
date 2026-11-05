! =============================================================
! Fisica Computacional - Taller 6 - Parte D
! Cristian Andres Cardenas Munoz - codigo 2518531
! Reutiliza sin cambios el modulo de Romberg para integrar
! 4/(1+x^2) entre 0 y 1 y aproximar pi.
! =============================================================
program programa_pi
  use modulo_romberg, only: dp, pi, romberg
  implicit none

  integer, parameter :: kmax = 14
  real(dp), parameter :: tol = 1.0e-5_dp
  real(dp), allocatable :: s(:,:)
  real(dp) :: pi_numerico, error_abs
  integer :: k_final, n_eval, unidad

  call romberg(0.0_dp, 1.0_dp, tol, kmax, 2, s, k_final, n_eval)
  pi_numerico = s(k_final,k_final)
  error_abs = abs(pi_numerico-pi)

  open(newunit=unidad,file='resultado_pi.dat',status='replace',action='write')
  write(unidad,'(i0,1x,i0,1x,2(es24.16,1x))') &
       k_final, n_eval, pi_numerico, error_abs
  close(unidad)

  print '(a,f17.12)', 'Pi con Romberg: ', pi_numerico
  print '(a,es12.4)', 'Error absoluto: ', error_abs
  print '(a,i0,a,i0)', 'Romberg: nivel ', k_final, ', evaluaciones ', n_eval
  if (error_abs < tol) then
    print '(a)', '[PASS] Pi con error menor que 1e-5'
  else
    print '(a)', '[FAIL] Pi: error fuera de tolerancia'
  end if

  deallocate(s)
end program programa_pi
