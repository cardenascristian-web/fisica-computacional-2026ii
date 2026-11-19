! Taller 8 - Parte C: constante de Stefan-Boltzmann.
! Se conserva el algoritmo de Romberg y kmax=14 del Taller 7.
program programa_sigma
  use modulo_romberg, only: dp, pi, romberg
  implicit none
  integer, parameter :: kmax = 14
  real(dp), parameter :: h = 6.62607015e-34_dp, c = 299792458.0_dp
  real(dp), parameter :: kb = 1.380649e-23_dp, tol = 1.0e-8_dp
  real(dp), parameter :: factor = 2.0_dp*pi*kb**4/(h**3*c**2)
  real(dp), allocatable :: s(:,:)
  real(dp) :: integral, sigma, limite
  integer :: tipo, nivel, ne, u

  open(newunit=u, file='resultado_sigma.dat', status='replace', action='write')
  do tipo = 3, 4
    ! Primera fila: cambio de variable. Segunda: intervalo directo.
    if (tipo == 3) then
      limite = 1.0_dp
    else
      limite = 100.0_dp
    end if
    call romberg(0.0_dp, limite, tol, kmax, tipo, s, nivel, ne)
    integral = s(nivel,nivel)
    sigma = factor*integral
    write(u,'(i0,1x,i0,1x,2(es24.16,1x))') nivel, ne, integral, sigma
    print '(a,i0,a,i0,a,i0)', 'Caso ',tipo-2,': nivel=',nivel,', evaluaciones=',ne
    print '(a,es24.16)', 'Integral: ',integral
    print '(a,es24.16)', 'Sigma (W/m^2/K^4): ',sigma
    print '(a,es24.16)', 'Error absoluto de la integral: ',abs(integral-pi**4/15.0_dp)
    deallocate(s)
  end do
  close(u)
end program programa_sigma
