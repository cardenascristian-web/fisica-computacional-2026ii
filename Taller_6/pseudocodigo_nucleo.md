# Taller 6 — Pseudocódigo del modelo nuclear

```
MÓDULO del modelo
    constantes: a_V, a_S, a_C, a_A, M_n, M_H
    funciones de los cuatro términos               (entradas: Z y/o A; salida: el término [MeV])
    función E_B(Z, A)                              (usa las cuatro funciones anteriores)
    función M(Z, A)                                (usa E_B)
    procedimiento Z_estable                        (entrada: A; resultados: el Z de máximo enlace y su E_B)
        fijar inicialmente Z_mejor = 1 y EB_mejor = EB(1, A)
        para Z desde 2 hasta A:
            calcular EB_actual = EB(Z, A)
            si EB_actual < EB_mejor:
                guardar Z_mejor = Z y EB_mejor = EB_actual
        devolver Z_mejor y EB_mejor
        JUSTIFICACIÓN: se usa una subrutina porque entrega dos resultados separados
        mediante parámetros de salida; una función simple entrega un solo resultado.

PROGRAMA PRINCIPAL (usa el módulo)
    para cada uno de los 8 núcleos, en el orden del enunciado:
        escribir una fila de nucleos.dat: Z, A, los cuatro términos, E_B y M
    fijar EB_global a un valor inicialmente muy grande
    para A = 4, 5, ..., 260:
        obtener el Z de máximo enlace y su E_B con Z_estable
        escribir una fila de valle.dat: A, Z, E_B
        si EB < EB_global:
            guardar EB_global = EB, A_global = A y Z_global = Z
    escribir A_global, Z_global y EB_global en maximo.dat
```
