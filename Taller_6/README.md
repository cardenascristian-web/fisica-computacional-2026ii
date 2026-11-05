# Oscilador amortiguado, Romberg y diferencias finitas

**Estudiante:** Cristian Andrés Cárdenas Muñoz (2518531)  
**Curso:** Física Computacional, 106018C  
**GitHub:** `fisica-computacional-2026ii/Taller_6/taller_oscilador_romberg/`  
**Enunciado:** notebook y diapositivas «Semana 7 / Taller 7» del profesor. En el repositorio del estudiante se identifica como Taller 6.

## Archivos de la solución

| Archivo | Para qué sirve |
|---|---|
| `Arreglos_int_deriv_ESTUDIANTES-7.ipynb` | Notebook original de la clase con soluciones añadidas; verificador original sin cambios y ejecutado. |
| `pseudocodigo_romberg.md` | Los tres espacios completados del algoritmo de Romberg. |
| `modulo_romberg.f90` | Integrador de Romberg reutilizable, integrandos para energía y π, y expresiones de posición, velocidad y energía. |
| `programa_energia.f90` | Parte B: energía disipada en 3 s. |
| `tabla_energia.dat` | Nueve filas (niveles 0 a 8) con la tabla triangular de Romberg. |
| `resultado_energia.dat` | Cinco columnas: nivel, evaluaciones, energía Romberg, energía de referencia, diferencia. |
| `derivadas_oscilador.py` | Parte C: velocidad y aceleración, sin ciclos por puntos. |
| `derivadas_oscilador.dat` | Datos de los 299 puntos interiores (t, x, v central, a central). |
| `errores_derivadas.dat` | Dos filas, seis columnas: paso y errores máximos de las cinco fórmulas. |
| `derivadas_oscilador.png` | Figura comparativa entre las derivadas numéricas y exactas. |
| `programa_pi.f90` | Parte D: π con el mismo módulo, sin modificarlo. |
| `resultado_pi.dat` | Nivel, evaluaciones, π aproximado y error. |
| `comparacion_montecarlo.py` | Comparación reproducible de π con N = 1.000.000 muestras y estimación teórica del costo. |
| `comparacion_montecarlo.dat` | Resultados del cálculo de Monte Carlo (no es un archivo exigido por la verificación). |

## Cómo ejecutar cada parte

Se necesita `gfortran`, Python, NumPy y Matplotlib. Abrir la terminal **dentro de esta carpeta**.

**Parte B (Fortran):**

```bash
gfortran -fcheck=bounds -o programa_energia modulo_romberg.f90 programa_energia.f90
./programa_energia
```

Produce `tabla_energia.dat` y `resultado_energia.dat`. Resultado de referencia: energía disipada `18.9940046974 J/kg`, error absoluto `4.53e-10`, `k=8`, `257` evaluaciones.

**Parte C (Python):**

```bash
python derivadas_oscilador.py
```

Produce los dos `.dat` y la imagen. Los errores máximos con dt = 0.01 son aproximadamente `3.765e-3` (velocidad central) y `1.215e-2` (aceleración central); las razones de convergencia son `1.99, 1.99, 4.00, 15.99, 3.94`.

**Parte D (Fortran, sin cambiar el módulo):**

```bash
gfortran -fcheck=bounds -o programa_pi modulo_romberg.f90 programa_pi.f90
./programa_pi
python comparacion_montecarlo.py
```

Produce `resultado_pi.dat` y la comparación de Monte Carlo. Romberg: `π = 3.1415926653`, error `1.17e-8`, `k=4`, `17` evaluaciones. La comparación Monte Carlo usa una semilla fija para que el resultado sea reproducible.

## Verificación oficial

El último bloque del notebook comprueba cuatro casos e informa **4 de 4 PASS**. No fue modificado. Su validación también comprueba que las salidas `.dat` sean posteriores a los archivos fuente: **si cambias código, vuelve a ejecutar las tres partes antes de lanzar la celda final**.

El reporte de una página, preparado a partir de la plantilla del curso, se encuentra en la carpeta superior `Taller_6/`. En Moodle también se requiere participación en el foro y declaración de uso de IA.
