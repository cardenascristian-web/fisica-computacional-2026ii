
program altura_maxima_proyectil
    implicit none

    ! Diccionario de datos
    real, parameter :: g = 9.8
    real, parameter :: pi = 3.14159265
    real, parameter :: tolerancia = 0.001

    real :: v0
    real :: angulo_grados
    real :: angulo_rad
    real :: h_max
    real :: h_esperada

    ! Entrada de datos
    print *, "Ingrese la rapidez inicial v0 en m/s:"
    read *, v0

    print *, "Ingrese el angulo de lanzamiento en grados:"
    read *, angulo_grados

    ! Eco de entradas
    print *, " "
    print *, "Datos ingresados:"
    print *, "v0 = ", v0, " m/s"
    print *, "angulo = ", angulo_grados, " grados"

    ! Conversion de grados a radianes
    angulo_rad = angulo_grados * pi / 180.0

    ! Calculo de la altura maxima
    h_max = (v0**2 * sin(angulo_rad)**2) / (2.0 * g)

    ! Resultado
    print *, " "
    print *, "Altura maxima = ", h_max, " m"

    ! ------------------------------------------------------------
    ! Verificacion
    ! ------------------------------------------------------------

    print *, " "
    print *, "Verificacion con casos de referencia"

    ! Caso 1
    v0 = 9.8
    angulo_grados = 90.0

    angulo_rad = angulo_grados * pi / 180.0
    h_max = (v0**2 * sin(angulo_rad)**2) / (2.0 * g)

    h_esperada = 4.9000

    if (abs(h_max - h_esperada) <= tolerancia) then
        print *, "Caso 1: PASS"
    else
        print *, "Caso 1: FAIL"
    end if

    ! Caso 2
    v0 = 20.0
    angulo_grados = 45.0

    angulo_rad = angulo_grados * pi / 180.0
    h_max = (v0**2 * sin(angulo_rad)**2) / (2.0 * g)

    h_esperada = 10.2041

    if (abs(h_max - h_esperada) <= tolerancia) then
        print *, "Caso 2: PASS"
    else
        print *, "Caso 2: FAIL"
    end if

    ! Caso 3
    v0 = 20.0
    angulo_grados = 30.0

    angulo_rad = angulo_grados * pi / 180.0
    h_max = (v0**2 * sin(angulo_rad)**2) / (2.0 * g)

    h_esperada = 5.1020

    if (abs(h_max - h_esperada) <= tolerancia) then
        print *, "Caso 3: PASS"
    else
        print *, "Caso 3: FAIL"
    end if

end program altura_maxima_proyectil
