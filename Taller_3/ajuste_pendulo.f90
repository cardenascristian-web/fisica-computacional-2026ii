! ============================================================
! Taller 3 - Ajuste lineal y pendulo simple
! Fisica Computacional (106018C)
! Autor: Cristian Andres Cardenas Munoz
!
! Lee pendulo_limpio.dat, ajusta T^2 = a L + b por minimos
! cuadrados y estima g = 4*pi^2/a.
! ============================================================

program ajuste_pendulo
  use iso_fortran_env, only: real64, iostat_end
  implicit none

  integer :: unidad, unidad_salida, estado
  integer :: id, n_osc, n

  real(real64) :: longitud_cm, angulo_deg, tiempo_s
  real(real64) :: x, y, periodo_s
  real(real64) :: sx, sy, sxx, sxy
  real(real64) :: den, a, b, pi, g
  real(real64) :: y_ajustada, sse, sst, r2, media_y

  ! ----------------------------------------------------------
  ! 1. Inicializacion de contadores y acumuladores
  ! ----------------------------------------------------------
  n = 0
  sx = 0.0_real64
  sy = 0.0_real64
  sxx = 0.0_real64
  sxy = 0.0_real64

  ! ----------------------------------------------------------
  ! 2. Apertura del archivo con los datos limpios
  ! ----------------------------------------------------------
  open(newunit=unidad, file='pendulo_limpio.dat', status='old', &
       action='read', iostat=estado)

  if (estado /= 0) then
    error stop 'No fue posible abrir pendulo_limpio.dat'
  end if

  ! ----------------------------------------------------------
  ! 3. Primera lectura: construir las sumas del ajuste lineal
  ! ----------------------------------------------------------
  do
    read(unidad, *, iostat=estado) id, longitud_cm, angulo_deg, &
         n_osc, tiempo_s

    if (estado == iostat_end) exit
    if (estado /= 0) error stop 'Hay una fila mal formada en el archivo'
    if (n_osc <= 0) error stop 'Numero de oscilaciones no valido'

    ! Longitud en metros y periodo de una sola oscilacion.
    x = longitud_cm / 100.0_real64
    periodo_s = tiempo_s / real(n_osc, real64)
    y = periodo_s**2

    ! Contador y acumuladores necesarios para minimos cuadrados.
    n = n + 1
    sx = sx + x
    sy = sy + y
    sxx = sxx + x*x
    sxy = sxy + x*y
  end do

  if (n < 2) then
    close(unidad)
    error stop 'Se necesitan al menos dos mediciones'
  end if

  ! ----------------------------------------------------------
  ! 4. Calculo de pendiente a e intercepto b
  ! ----------------------------------------------------------
  den = real(n, real64)*sxx - sx*sx

  if (abs(den) <= tiny(den)) then
    close(unidad)
    error stop 'Denominador nulo: no se puede calcular la pendiente'
  end if

  a = (real(n, real64)*sxy - sx*sy) / den
  b = (sy - a*sx) / real(n, real64)

  ! La pendiente del modelo T^2 = aL + b permite recuperar g.
  pi = acos(-1.0_real64)
  g = 4.0_real64*pi*pi / a

  ! ----------------------------------------------------------
  ! 5. Segunda lectura: calcular R^2 a partir de los residuos
  ! ----------------------------------------------------------
  rewind(unidad)

  media_y = sy / real(n, real64)
  sse = 0.0_real64
  sst = 0.0_real64

  do
    read(unidad, *, iostat=estado) id, longitud_cm, angulo_deg, &
         n_osc, tiempo_s

    if (estado == iostat_end) exit
    if (estado /= 0) error stop 'Error durante la segunda lectura'

    x = longitud_cm / 100.0_real64
    periodo_s = tiempo_s / real(n_osc, real64)
    y = periodo_s**2

    y_ajustada = a*x + b
    sse = sse + (y - y_ajustada)**2
    sst = sst + (y - media_y)**2
  end do

  close(unidad)

  if (sst > 0.0_real64) then
    r2 = 1.0_real64 - sse/sst
  else
    r2 = 0.0_real64
  end if

  ! ----------------------------------------------------------
  ! 6. Mostrar resultados en pantalla
  ! ----------------------------------------------------------
  print '(A,I0)',       'N = ', n
  print '(A,F12.8,A)',  'Pendiente a = ', a, ' s^2/m'
  print '(A,F12.8,A)',  'Intercepto b = ', b, ' s^2'
  print '(A,F12.8)',    'R^2 = ', r2
  print '(A,F12.8,A)',  'Gravedad g = ', g, ' m/s^2'

  ! ----------------------------------------------------------
  ! 7. Archivo estandarizado para la verificacion PASS/FAIL
  ! ----------------------------------------------------------
  open(newunit=unidad_salida, file='resultados_ajuste.dat', &
       status='replace', action='write', iostat=estado)

  if (estado /= 0) error stop 'No fue posible crear resultados_ajuste.dat'

  write(unidad_salida, *) n, a, b, r2, g
  close(unidad_salida)

end program ajuste_pendulo
