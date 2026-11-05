! Consulta auxiliar para responder E2, E3 y E4 sin modificar el modelo base.
program consultas_interpretacion
  use modulo_nucleo, only: dp, energia_enlace, masa_atomica, z_estable
  implicit none
  integer :: z_opt
  real(dp) :: eb_opt, eb_62, eb_56_26, diferencia_total
  real(dp) :: a_p, delta_opt, delta_fe, q

  call z_estable(56, z_opt, eb_opt)
  eb_56_26 = energia_enlace(26, 56)
  diferencia_total = 56.0_dp * (eb_opt - eb_56_26)  ! Etotal(modelo opt) - Etotal(Fe56)
  a_p = 12.0_dp
  delta_opt = correccion_apareamiento(z_opt, 56, a_p)
  delta_fe = correccion_apareamiento(26, 56, a_p)
  eb_62 = energia_enlace(28, 62)
  q = masa_atomica(92, 236) - 2.0_dp*masa_atomica(46, 118)

  print '(a)', '--- Interpretracion E ---'
  print '(a,i0,a,f16.10)', 'E2: A=62, Z=', 28, ', EB=', eb_62
  print '(a,i0,a,f16.10)', 'E3: A=56, mejor Z=', z_opt, ', EB=', eb_opt
  print '(a,f16.10)', 'E3: A=56, Fe(Z=26) EB=', eb_56_26
  print '(a,f16.10)', 'E3: Etotal(mejor) - Etotal(Fe), sin apareamiento [MeV]=', diferencia_total
  print '(a,f16.10)', 'E3: correccion total de apareamiento (mejor) [MeV]=', delta_opt
  print '(a,f16.10)', 'E3: correccion total de apareamiento (Fe) [MeV]=', delta_fe
  print '(a,f16.10)', 'E3: Etotal(mejor) - Etotal(Fe), con apareamiento [MeV]=', &
    diferencia_total + delta_opt - delta_fe
  print '(a,f16.8)', 'E4: Q de la fision simetrica [MeV]=', q
contains
  ! Devuelve correccion de APAREAMIENTO para la energia TOTAL (no para EB).
  real(dp) function correccion_apareamiento(z, a, coef)
    integer, intent(in) :: z, a
    real(dp), intent(in) :: coef
    integer :: n
    n = a - z
    correccion_apareamiento = 0.0_dp
    if (mod(a, 2) /= 0) return
    if (mod(z, 2) == 0 .and. mod(n, 2) == 0) then
       correccion_apareamiento = -coef / sqrt(real(a, dp))
    else
       correccion_apareamiento = coef / sqrt(real(a, dp))
    end if
  end function correccion_apareamiento
end program consultas_interpretacion
