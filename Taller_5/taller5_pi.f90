! Taller 5 -- Convergencia del estimador de pi por acierto y error.
! Salidas: convergencia.dat (N, media, desviación) y pendiente.dat (pendiente m).
program taller5_pi
  implicit none
  integer, parameter :: dp = kind(1.0d0)
  integer, parameter :: M = 20                  ! corridas por cada N
  integer :: k, j, n_sem, u_dat, n_puntos
  integer(8) :: i, n_total, n_aciertos
  integer, allocatable :: semilla(:)
  real(dp) :: u, v, x, y, pi_est, suma, suma2, media, desv
  real(dp) :: X_k, Y_k, sx, sy, sxx, sxy, pendiente

  ! Consultamos el tamaño del estado: no es igual en todos los compiladores.
  call random_seed(size=n_sem)
  allocate(semilla(n_sem))

  sx = 0.0_dp; sy = 0.0_dp; sxx = 0.0_dp; sxy = 0.0_dp; n_puntos = 0   ! sumas del ajuste
  open(newunit=u_dat,file='convergencia.dat',status='replace')
  do k = 2, 7                                   ! N = 10^2, ..., 10^7
     n_total = 10_8**k
     ! Acumular solo los resultados: no almacenamos N puntos por corrida.
     suma = 0.0_dp; suma2 = 0.0_dp
     do j = 1, M
        ! Cambiar semilla evita reproducir la misma trayectoria en las 20 corridas.
        ! Mantener la regla de semillas fija permite revisar una misma ejecución.
        semilla = 1000*k + j
        call random_seed(put=semilla)
        n_aciertos = 0_8                        ! contador reiniciado en cada corrida

        ! A1. Muestrear sin guardar coordenadas: memoria O(1) y tiempo O(N).
        ! Transformar [0,1) a [-1,1) permite comparar áreas de círculo/cuadrado.
        do i = 1_8, n_total
           call random_number(u)
           call random_number(v)
           x = 2.0_dp*u - 1.0_dp
           y = 2.0_dp*v - 1.0_dp
           if (x*x + y*y < 1.0_dp) n_aciertos = n_aciertos + 1_8
        end do
        pi_est = 4.0_dp*real(n_aciertos,dp)/real(n_total,dp)

        ! A2. Dos acumuladores bastan para media y dispersión; no se guardan
        ! las 20 estimaciones. El cálculo se hace en doble precisión.
        suma  = suma  + pi_est
        suma2 = suma2 + pi_est*pi_est
     end do

     ! A3. Usamos M-1 porque estimamos la varianza con una muestra de M corridas;
     ! M en el denominador subestimaría la dispersión muestral.
     media = suma/real(M,dp)
     desv = sqrt(max(0.0_dp, (suma2 - real(M,dp)*media*media)/real(M-1,dp)))

     write(u_dat,'(i10,2es25.16e3)') n_total,media,desv
     print '(i10,2f12.6)', n_total,media,desv

     ! A4. El logaritmo transforma la ley de potencia s ~ N**m en una recta.
     ! Si s fuera cero, su logaritmo no existiría; por eso se comprueba.
     if (desv > 0.0_dp) then
        X_k = log10(real(n_total,dp))
        Y_k = log10(desv)
        sx = sx + X_k
        sy = sy + Y_k
        sxx = sxx + X_k*X_k
        sxy = sxy + X_k*Y_k
        n_puntos = n_puntos + 1
     end if
  end do
  close(u_dat)

  ! A5. Ajustar en Fortran (Semana 3), no en Python: así el dato contrastado
  ! corresponde al cálculo que realmente queremos verificar.
  if (n_puntos < 2) error stop 'No hay suficientes datos para el ajuste.'
  pendiente = (real(n_puntos,dp)*sxy - sx*sy) &
            /(real(n_puntos,dp)*sxx - sx*sx)

  open(newunit=u_dat,file='pendiente.dat',status='replace')
  write(u_dat,'(es25.16e3)') pendiente
  close(u_dat)
  print '(a,f9.4)', 'Pendiente de log10(s) contra log10(N): ', pendiente
end program taller5_pi
