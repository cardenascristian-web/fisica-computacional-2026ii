! Taller 6 - Fisica Computacional (106018C)
! Cristian Andres Cardenas Munoz - 2518531
! Programa principal: produce las tablas de ocho nucleos, valle y maximo.
program programa_nucleo
  use modulo_nucleo, only: dp, termino_volumen, termino_superficie, &
    termino_coulomb, termino_asimetria, energia_enlace, masa_atomica, z_estable
  implicit none

  integer :: u_nucleos, u_valle, u_maximo
  integer :: a, z_mejor, a_global, z_global
  real(dp) :: eb_mejor, eb_global

  ! Primero: los ocho nucleos, exactamente en el orden del enunciado.
  open(newunit=u_nucleos, file='nucleos.dat', status='replace', action='write')
  call escribir_nucleo(u_nucleos, 94, 244)  ! Pu-244
  call escribir_nucleo(u_nucleos, 32,  70)  ! Ge-70
  call escribir_nucleo(u_nucleos, 72, 179)  ! Hf-179
  call escribir_nucleo(u_nucleos, 18,  38)  ! Ar-38
  call escribir_nucleo(u_nucleos, 26,  56)  ! Fe-56
  call escribir_nucleo(u_nucleos, 20,  40)  ! Ca-40
  call escribir_nucleo(u_nucleos, 92, 235)  ! U-235
  call escribir_nucleo(u_nucleos, 92, 238)  ! U-238
  close(u_nucleos)

  ! Segundo: para cada A, encontrar el Z de menor EB (mayor B/A).
  open(newunit=u_valle, file='valle.dat', status='replace', action='write')
  eb_global = huge(1.0_dp)  ! inicializar antes del ciclo; no usar SAVE implicito
  a_global = 0
  z_global = 0
  do a = 4, 260
    call z_estable(a, z_mejor, eb_mejor)
    write(u_valle, '(2(i5,1x),f20.10)') a, z_mejor, eb_mejor
    if (eb_mejor < eb_global) then
      eb_global = eb_mejor
      a_global = a
      z_global = z_mejor
    end if
  end do
  close(u_valle)

  ! Tercero: registrar el maximo global con el mismo orden A, Z, EB.
  open(newunit=u_maximo, file='maximo.dat', status='replace', action='write')
  write(u_maximo, '(2(i5,1x),f20.10)') a_global, z_global, eb_global
  close(u_maximo)

  print '(a)', 'Taller 6: archivos nucleos.dat, valle.dat y maximo.dat creados.'
  print '(a,i0,a,i0,a,f13.9,a)', 'Maximo enlace del modelo: A=', a_global, &
    ', Z=', z_global, ', EB=', eb_global, ' MeV/nucleon'

contains

  ! Escribe una fila: entrada unidad, Z, A; salida ocho columnas en .dat.
  ! Una subrutina es apropiada porque su tarea es escribir un archivo.
  subroutine escribir_nucleo(unidad, z, a)
    integer, intent(in) :: unidad, z, a
    write(unidad, '(2(i5,1x),5(f20.10,1x),f24.6)') z, a, &
      termino_volumen(), termino_superficie(a), &
      termino_coulomb(z, a), termino_asimetria(z, a), &
      energia_enlace(z, a), masa_atomica(z, a)
  end subroutine escribir_nucleo

end program programa_nucleo
