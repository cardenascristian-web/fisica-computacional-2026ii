! ============================================================
! Fisica Computacional 106018C - Taller 8 - Parte B
! Cristian Andres Cardenas Munoz - 2518531
! Funcion de Wien y tres metodos iterativos para hallar sus ceros.
! ============================================================
module modulo_ceros
  implicit none
  private
  integer, parameter, public :: dp = kind(1.0d0), max_iter = 100
  public :: f, df, biseccion, newton, secante
contains

  ! n = 5 para longitud de onda; n = 3 para frecuencia.
  real(dp) function f(x, n)
    real(dp), intent(in) :: x
    integer, intent(in) :: n
    f = x - real(n,dp)*(1.0_dp - exp(-x))
  end function f

  real(dp) function df(x, n)
    real(dp), intent(in) :: x
    integer, intent(in) :: n
    df = 1.0_dp - real(n,dp)*exp(-x)
  end function df

  ! Devuelve la raiz, el conteo y los valores nuevos de cada iteracion.
  subroutine biseccion(n, a0, b0, tol, raiz, it, historia)
    integer, intent(in) :: n
    real(dp), intent(in) :: a0, b0, tol
    real(dp), intent(out) :: raiz, historia(max_iter)
    integer, intent(out) :: it
    real(dp) :: a, b, c, fa, fc
    integer :: k

    if (tol <= 0.0_dp .or. a0 >= b0) error stop 'Biseccion: parametros invalidos'
    a = a0
    b = b0
    fa = f(a,n)
    if (fa*f(b,n) >= 0.0_dp) error stop 'Biseccion: no hay cambio de signo'
    historia = 0.0_dp
    do k = 1, max_iter
      c = (a+b)/2.0_dp
      historia(k) = c
      raiz = c
      it = k
      ! Se mide la semianchura antes de actualizar el intervalo.
      if (b-c <= tol) return
      fc = f(c,n)
      if (fa*fc <= 0.0_dp) then
        b = c
      else
        a = c
        fa = fc
      end if
    end do
    error stop 'Biseccion: no convergio en 100 iteraciones'
  end subroutine biseccion

  subroutine newton(n, x0, tol, raiz, it, historia)
    integer, intent(in) :: n
    real(dp), intent(in) :: x0, tol
    real(dp), intent(out) :: raiz, historia(max_iter)
    integer, intent(out) :: it
    real(dp) :: x, nuevo, dfx
    integer :: k

    if (tol <= 0.0_dp) error stop 'Newton: tolerancia invalida'
    x = x0
    historia = 0.0_dp
    do k = 1, max_iter
      dfx = df(x,n)
      if (abs(dfx) < tiny(1.0_dp)) error stop 'Newton: derivada nula'
      nuevo = x - f(x,n)/dfx
      historia(k) = nuevo
      raiz = nuevo
      it = k
      if (abs(nuevo-x) < tol) return
      x = nuevo
    end do
    error stop 'Newton: no convergio en 100 iteraciones'
  end subroutine newton

  subroutine secante(n, x0, x1, tol, raiz, it, historia)
    integer, intent(in) :: n
    real(dp), intent(in) :: x0, x1, tol
    real(dp), intent(out) :: raiz, historia(max_iter)
    integer, intent(out) :: it
    real(dp) :: anterior, x, nuevo, fx, denominador
    integer :: k

    if (tol <= 0.0_dp) error stop 'Secante: tolerancia invalida'
    anterior = x0
    x = x1
    historia = 0.0_dp
    do k = 1, max_iter
      fx = f(x,n)
      denominador = fx - f(anterior,n)
      if (abs(denominador) < tiny(1.0_dp)) error stop 'Secante: denominador nulo'
      nuevo = x - fx*(x-anterior)/denominador
      historia(k) = nuevo
      raiz = nuevo
      it = k
      if (abs(nuevo-x) < tol) return
      anterior = x
      x = nuevo
    end do
    error stop 'Secante: no convergio en 100 iteraciones'
  end subroutine secante
end module modulo_ceros
