! =============================================================
! Fisica Computacional 106018C - Taller 6 (material Semana 7)
! Estudiante: Cristian Andres Cardenas Munoz - 2518531
! Modulo: integracion de Romberg y funciones fisicas.
!
! Una sola rutina integra dos funciones segun el parametro tipo:
!   tipo = 1: potencia disipada por el oscilador, 2*gamma*v(t)^2
!   tipo = 2: integrando para pi, 4/(1+t^2)
! =============================================================
module modulo_romberg
  implicit none
  private

  integer, parameter, public :: dp = kind(1.0d0)
  real(dp), parameter, public :: pi = 4.0_dp*atan(1.0_dp)
  real(dp), parameter :: gamma = 0.5_dp
  real(dp), parameter :: omega = 2.0_dp*pi

  public :: posicion, velocidad, energia, romberg

contains

  ! Posicion del oscilador amortiguado en metros.
  real(dp) function posicion(t) result(x)
    real(dp), intent(in) :: t
    x = exp(-gamma*t)*cos(omega*t)
  end function posicion

  ! Velocidad analitica, en m/s, obtenida al derivar x(t).
  real(dp) function velocidad(t) result(v)
    real(dp), intent(in) :: t
    v = -exp(-gamma*t)*(gamma*cos(omega*t) + omega*sin(omega*t))
  end function velocidad

  ! Energia mecanica por unidad de masa, en J/kg.
  real(dp) function energia(t) result(e)
    real(dp), intent(in) :: t
    e = 0.5_dp*velocidad(t)**2 + &
        0.5_dp*(omega**2 + gamma**2)*posicion(t)**2
  end function energia

  ! Funcion que se integra; cambia segun la parte del taller.
  real(dp) function integrando(t, tipo) result(f)
    real(dp), intent(in) :: t
    integer, intent(in) :: tipo

    select case (tipo)
    case (1)
      f = 2.0_dp*gamma*velocidad(t)**2
    case (2)
      f = 4.0_dp/(1.0_dp + t*t)
    case default
      error stop 'Tipo de integrando desconocido'
    end select
  end function integrando

  ! Romberg: refinamiento del trapecio y extrapolacion de Richardson.
  ! Entradas: limites a,b; tolerancia tol; nivel maximo kmax; tipo.
  ! Salidas: tabla S, ultima fila k_final y numero de evaluaciones.
  ! La tabla inicia en (0,0), como exige el enunciado.
  subroutine romberg(a, b, tol, kmax, tipo, s, k_final, n_eval)
    real(dp), intent(in) :: a, b, tol
    integer, intent(in) :: kmax, tipo
    real(dp), allocatable, intent(out) :: s(:,:)
    integer, intent(out) :: k_final, n_eval

    real(dp) :: h, suma, t_nuevo, factor
    integer :: k, j, i, n_nuevos

    if (kmax < 1 .or. tol <= 0.0_dp .or. b <= a) then
      error stop 'Parametros invalidos para Romberg'
    end if

    allocate(s(0:kmax, 0:kmax))
    s = 0.0_dp

    h = b - a
    s(0,0) = 0.5_dp*h*(integrando(a,tipo) + integrando(b,tipo))
    n_eval = 2
    k_final = 0

    do k = 1, kmax
      h = 0.5_dp*h
      n_nuevos = 2**(k-1)  ! Solo puntos medios que no existian antes.
      suma = 0.0_dp

      do i = 1, n_nuevos
        t_nuevo = a + real(2*i-1,dp)*h
        suma = suma + integrando(t_nuevo,tipo)
      end do
      n_eval = n_eval + n_nuevos

      ! Primera columna: trapecio refinado, sin repetir evaluaciones.
      s(k,0) = 0.5_dp*s(k-1,0) + h*suma

      ! Columnas siguientes: cancelacion sucesiva de errores.
      do j = 1, k
        factor = 4.0_dp**j
        s(k,j) = (factor*s(k,j-1) - s(k-1,j-1))/(factor-1.0_dp)
      end do

      k_final = k
      if (abs(s(k,k) - s(k-1,k-1)) < tol) exit
    end do
  end subroutine romberg

end module modulo_romberg
