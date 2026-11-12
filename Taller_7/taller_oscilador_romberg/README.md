# Taller 7 — Oscilador amortiguado, Romberg y diferencias finitas

**Física Computacional (106018C), semana 7**  
**Estudiante:** Cristian Andrés Cárdenas Muñoz · **Código:** 2518531

## Inventario de archivos

| Archivo | Función |
|---|---|
| `Arreglos_int_deriv_ESTUDIANTES-7.ipynb` | Notebook del curso con soluciones incorporadas y celda oficial de verificación intacta. |
| `pseudocodigo_romberg.md` | Parte A: tres espacios completos del algoritmo. |
| `modulo_romberg.f90` | Parte B y D: Romberg, integrandos, posición, velocidad, energía. |
| `programa_energia.f90` | Parte B: energía disipada y balance energético. |
| `tabla_energia.dat` | Niveles 0 a 8 de Romberg; números reales obtenidos con Fortran. |
| `resultado_energia.dat` | Nivel, evaluaciones, integral, referencia y diferencia. |
| `derivadas_oscilador.py` | Parte C: cuatro velocidades y aceleración central con rebanadas. |
| `derivadas_oscilador.dat` | Datos de los 299 puntos interiores. |
| `errores_derivadas.dat` | Paso y cinco errores máximos (dos filas). |
| `derivadas_oscilador.png` | Comparación de velocidad/aceleración numérica y exacta. |
| `programa_pi.f90` | Parte D: π mediante el mismo módulo, sin cambios. |
| `resultado_pi.dat` | Nivel, evaluaciones, π aproximado, error absoluto. |
| `comparacion_montecarlo.py` | Parte D: estimador Monte Carlo con 1 millón de muestras, semilla fija. |
| `comparacion_montecarlo.dat` | Error observado y tamaño teórico de muestra. |
| `graficar_convergencia.py` | Figura complementaria de convergencia, a partir de `tabla_energia.dat`. |
| `convergencia_romberg.png` | Evolución del error absoluto de Romberg, incluida en el reporte. |
| `reporte_taller_7.tex` | Reporte de una página en LaTeX. |
| `reporte_taller_7.pdf` | PDF para subir a Moodle. |

## Ejecución reproducible

Instalar `gfortran` y en Python `numpy` y `matplotlib`. Abrir terminal **en esta carpeta** y correr en este orden:

```bash
gfortran -std=f2008 -Wall -Wextra -fcheck=all -o programa_energia modulo_romberg.f90 programa_energia.f90
./programa_energia
python derivadas_oscilador.py
python graficar_convergencia.py
gfortran -std=f2008 -Wall -Wextra -fcheck=all -o programa_pi modulo_romberg.f90 programa_pi.f90
./programa_pi
python comparacion_montecarlo.py
```

O abrir el notebook en Colab/Jupyter y ejecutar sus celdas desde el inicio; las celdas `%%writefile` generan de nuevo los fuentes. La verificación está al final y debe imprimir **4 de 4 PASS**. **No modificar esa celda.** Si se modifica algún `.f90` o `.py`, se deben regenerar los archivos `.dat` antes de verificar.

## Resultados de referencia

- Energía disipada entre 0 y 3 s: **18.99400469737861 J/kg**; balance: **18.994004696925138 J/kg**; diferencia **0.00000000045347 J/kg**. Nivel 8 con **257** evaluaciones.
- Derivación central con paso 0.01 s: errores máximos **0.003764713 m/s** para velocidad y **0.01214992 m/s²** para aceleración.
- Razones al reducir el paso: **1.9945, 1.9885, 3.9994, 15.9890 y 3.9421** (órdenes 1, 1, 2, 4 y 2).
- π por Romberg: **3.141592665277717**, error **0.000000011688**, nivel 4 con **17** evaluaciones.
- Monte Carlo (1 millón): π ≈ **3.140836**, error observado ≈ **0.000756654**. Para un error *estadístico típico* de 0.00001 se necesitan aproximadamente **26,967,662,133** muestras; esto **no garantiza** ese error en una realización particular.

## Decisión de implementación y limitación

Los primeros niveles de Romberg submuestrean una función oscilatoria: por ejemplo, en `tabla_energia.dat` el nivel 1 produce **0.2427884636 J/kg** mientras el balance energético correcto es **18.9940046969 J/kg**. Refinar la malla y evaluar solo puntos nuevos recupera la integral con 257 evaluaciones. La tolerancia del criterio de parada se aplica a *diagonales sucesivas*, no directamente al error respecto al valor exacto: por ello el error real puede ser menor. Romberg es muy eficiente para este integrando suave de una dimensión; no cabe extrapolar el mismo costo a funciones discontinuas o integrales de alta dimensión.

## Requisitos fuera de GitHub

Subir el PDF de una página a Moodle; publicar un obstáculo/decisión real en el foro, responder a un compañero con un detalle técnico y declarar el uso ético de herramientas de IA. El texto del reporte incorpora la declaración, pero conviene repetirla en el espacio que habilite el profesor si lo exige.
