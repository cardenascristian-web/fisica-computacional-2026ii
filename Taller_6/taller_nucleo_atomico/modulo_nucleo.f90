! Taller 6 - Fisica Computacional (106018C)
! Cristian Andres Cardenas Munoz - 2518531
! Modelo semiempirico de masa: funciones y una subrutina de busqueda.
!
! Convencion: EB es energia de enlace POR NUCLEON [MeV] con signo negativo.
! El nucleo mas ligado para un A fijo minimiza EB, no la masa atomica.
module modulo_nucleo
  implicit none
  private

  ! Constantes compartidas del modelo (no existen variables globales modificables).
  integer, parameter, public :: dp = kind(1.0d0)
  real(dp), parameter :: a_v = 15.8_dp, a_s = 18.3_dp
  real(dp), parameter :: a_c = 0.71_dp, a_a = 92.7_dp
  real(dp), parameter :: m_n = 939.57_dp, m_h = 938.78_dp

  public :: termino_volumen, termino_superficie, termino_coulomb
  public :: termino_asimetria, energia_enlace, masa_atomica, z_estable

contains

  ! Termino de volumen: sin entradas; salida -a_V [MeV/nucleon].
  real(dp) function termino_volumen()
    termino_volumen = -a_v
  end function termino_volumen

  ! Termino de superficie: entrada A; salida a_S*A^(-1/3) [MeV/nucleon].
  real(dp) function termino_superficie(a)
    integer, intent(in) :: a
    termino_superficie = a_s * real(a, dp)**(-1.0_dp/3.0_dp)
  end function termino_superficie

  ! Termino electrostatico: entradas Z, A; salida Coulomb [MeV/nucleon].
  real(dp) function termino_coulomb(z, a)
    integer, intent(in) :: z, a
    termino_coulomb = a_c * real(z, dp)**2 * real(a, dp)**(-4.0_dp/3.0_dp)
  end function termino_coulomb

  ! Termino de asimetria: entradas Z, A; salida [MeV/nucleon].
  ! A/2 debe ser real para no truncar cuando A es impar.
  real(dp) function termino_asimetria(z, a)
    integer, intent(in) :: z, a
    real(dp) :: diferencia
    diferencia = real(z, dp) - real(a, dp)/2.0_dp
    termino_asimetria = a_a * diferencia**2 / real(a, dp)**2
  end function termino_asimetria

  ! Energia por nucleon: entradas Z, A; salida EB [MeV/nucleon].
  ! Reutiliza las cuatro funciones anteriores (no repite las formulas).
  real(dp) function energia_enlace(z, a)
    integer, intent(in) :: z, a
    energia_enlace = termino_volumen() + termino_superficie(a) &
      + termino_coulomb(z, a) + termino_asimetria(z, a)
  end function energia_enlace

  ! Masa atomica aproximada: entradas Z, A; salida M*c^2 [MeV].
  ! El termino A*EB es la energia de enlace total, que es negativa.
  real(dp) function masa_atomica(z, a)
    integer, intent(in) :: z, a
    masa_atomica = real(z, dp)*m_h + real(a-z, dp)*m_n &
      + real(a, dp)*energia_enlace(z, a)
  end function masa_atomica

  ! Busqueda a A fijo: entrada A; salidas Z de maximo enlace y su EB.
  ! Subrutina porque entrega DOS resultados por argumentos intent(out).
  subroutine z_estable(a, z_mejor, eb_mejor)
    integer, intent(in) :: a
    integer, intent(out) :: z_mejor
    real(dp), intent(out) :: eb_mejor
    integer :: z
    real(dp) :: eb_actual

    z_mejor = 1
    eb_mejor = energia_enlace(1, a)
    do z = 2, a
      eb_actual = energia_enlace(z, a)
      if (eb_actual < eb_mejor) then
        eb_mejor = eb_actual
        z_mejor = z
      end if
    end do
  end subroutine z_estable

end module modulo_nucleo
