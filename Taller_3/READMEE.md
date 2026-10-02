# Taller 3 - Ajuste lineal y péndulo simple

**Física Computacional - 106018C**  
**Estudiante:** Cristian Andrés Cárdenas Muñoz  
**Lenguajes:** Fortran 2008 / Python

## Objetivo

Estimar la aceleración de la gravedad a partir de mediciones de un péndulo simple mediante un ajuste lineal por mínimos cuadrados.

Para ángulos pequeños:

T² = (4π²/g)L

Por tanto, al ajustar T² = aL + b:

g = 4π²/a

## Flujo de trabajo

1. Limpieza y documentación de las 100 mediciones originales con Python.
2. Generación de `pendulo_limpio.dat` e `informe_limpieza.xlsx`.
3. Lectura del archivo limpio y ajuste lineal en Fortran 2008.
4. Cálculo de N, pendiente, intercepto, R² y g.
5. Visualización del ajuste y los residuos en Python.
6. Verificación automática PASS/FAIL.

## Resultados

- N = 89
- a = 4.04873469 s²/m
- b = -0.00288786 s²
- R² = 0.99974782
- g = 9.75080380 m/s²
- Error relativo frente a 9.81 m/s²: 0.603 %
- PASS/FAIL: 11 de 11 pruebas

## Compilación

```bash
gfortran -std=f2008 -Wall -Wextra -fcheck=all -o ajuste_pendulo ajuste_pendulo.f90
./ajuste_pendulo
```

## Archivos principales

- `script_limpieza_pendulo_estudiantes.py`
- `informe_limpieza.xlsx`
- `pendulo_limpio.dat`
- `ajuste_pendulo.f90`
- `resultados_ajuste.dat`
- `ajuste_pendulo_y_residuos.png`
- `diagrama_flujo.png`
- `verificacion_pass_fail.txt`
- `salida_programa.txt`

## Uso de IA

Se utilizó ChatGPT como apoyo para interpretar las instrucciones, revisar la lógica del código, documentar decisiones y redactar el reporte. Los resultados fueron verificados mediante compilación y la celda automática PASS/FAIL del notebook.
