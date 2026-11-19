! ============================================================
! Taller 8 - Parte B: constante de desplazamiento de Wien.
! Genera las raices, los historiales y la constante en unidades SI.
! ============================================================
program programa_wien
  use modulo_ceros, only: dp, max_iter, biseccion, newton, secante
  implicit none
  real(dp), parameter :: h = 6.62607015e-34_dp, c = 299792458.0_dp
  real(dp), parameter :: kb = 1.380649e-23_dp, tol = 1.0e-10_dp
  integer, parameter :: valores_n(2) = [5,3]
  real(dp) :: raiz, historia(max_iter), x5, x3, b
  integer :: n, metodo, it, k, i, ur, uh, uc

  open(newunit=ur, file='resultado_wien.dat', status='replace', action='write')
  open(newunit=uh, file='iteraciones_wien.dat', status='replace', action='write')
  ! Se ejecutan los tres metodos con las mismas condiciones de la guia.
  do i = 1, size(valores_n)
    n = valores_n(i)
    do metodo = 1, 3
      select case(metodo)
      case(1)
        call biseccion(n, 1.0_dp, 10.0_dp, tol, raiz, it, historia)
      case(2)
        call newton(n, 10.0_dp, tol, raiz, it, historia)
        if (n == 5) x5 = raiz
        if (n == 3) x3 = raiz
      case(3)
        call secante(n, 10.0_dp, 9.0_dp, tol, raiz, it, historia)
      end select
      write(ur,'(i0,1x,i0,1x,es24.16,1x,i0)') n, metodo, raiz, it
      print '(a,i0,a,i0,a,es24.16,a,i0)', 'n=',n,', metodo=',metodo,', raiz=',raiz,', iteraciones=',it
      if (n == 5) then
        do k = 1, it
          write(uh,'(i0,1x,i0,1x,es24.16)') metodo, k, historia(k)
        end do
      end if
    end do
  end do

  ! El cuarto caso muestra la dependencia de Newton del valor inicial.
  call newton(5, 0.5_dp, tol, raiz, it, historia)
  write(ur,'(i0,1x,i0,1x,es24.16,1x,i0)') 5, 4, raiz, it
  close(ur)
  close(uh)
  b = h*c/(kb*x5)
  open(newunit=uc, file='constante_wien.dat', status='replace', action='write')
  write(uc,'(3(es24.16,1x))') x5, x3, b
  close(uc)
  print '(a,es24.16)', 'Newton desde 0.5: ',raiz
  print '(a,es24.16)', 'Constante de Wien (m K): ',b
end program programa_wien
