! =============================================================
! Fisica Computacional - Taller 6 - Parte B
! Cristian Andres Cardenas Munoz - codigo 2518531
! Integra la potencia disipada en 0 <= t <= 3 s y verifica
! que E_dis = E(0) - E(3), con tolerancia 1e-6.
! =============================================================
program programa_energia
  use modulo_romberg, only: dp, romberg, energia
  implicit none

  integer, parameter :: kmax = 14
  real(dp), parameter :: t_final = 3.0_dp, tol = 1.0e-6_dp
  real(dp), allocatable :: s(:,:)
  real(dp) :: e_dis, e_referencia, diferencia
  integer :: k_final, n_eval, k, j, unidad

  call romberg(0.0_dp, t_final, tol, kmax, 1, s, k_final, n_eval)
  e_dis = s(k_final,k_final)
  e_referencia = energia(0.0_dp) - energia(t_final)
  diferencia = abs(e_dis - e_referencia)

  ! Una fila por nivel, precedida por k; luego S(k,0) ... S(k,k).
  open(newunit=unidad,file='tabla_energia.dat',status='replace',action='write')
  do k = 0, k_final
    write(unidad,'(i3,1x,*(es23.15,1x))') k, (s(k,j), j=0,k)
  end do
  close(unidad)

  ! Cinco columnas numericas que lee la celda de verificacion.
  open(newunit=unidad,file='resultado_energia.dat',status='replace',action='write')
  write(unidad,'(i0,1x,i0,1x,3(es24.16,1x))') &
       k_final, n_eval, e_dis, e_referencia, diferencia
  close(unidad)

  print '(a,es20.12)', 'Energia disipada (J/kg): ', e_dis
  print '(a,es20.12)', 'E(0)-E(3) (J/kg):       ', e_referencia
  print '(a,es12.4)',  'Diferencia absoluta:   ', diferencia
  print '(a,i0,a,i0)', 'Romberg: nivel ', k_final, ', evaluaciones ', n_eval
  if (diferencia < tol) then
    print '(a)', '[PASS] Balance de energia: diferencia < 1e-6'
  else
    print '(a)', '[FAIL] Balance de energia: revisar convergencia'
  end if

  deallocate(s)
end program programa_energia
