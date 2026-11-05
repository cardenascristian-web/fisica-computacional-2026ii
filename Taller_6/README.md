# Taller 6 — Física Computacional (106018C)

**Estudiante:** Cristian Andrés Cárdenas Muñoz  
**Código:** 2518531  
**Tema:** Funciones, subrutinas y módulos. Fórmula semiempírica de masa nuclear.  
**Lenguajes:** Fortran y Python.  
**Semana:** 6.  

## Objetivo

Calcular la energía de enlace por nucleón y la masa atómica aproximada con un modelo de cuatro términos. Para cada A de 4 a 260, hallar el Z que maximiza B/A (equivalente a minimizar EB), registrar el máximo global y comparar una gráfica con datos experimentales AME2020. La curva de máximo enlace no debe confundirse con una demostración de estabilidad ante decaimientos beta.

## Ejecutar

La opción principal es abrir el `.ipynb` en **Google Colab** y seleccionar **Entorno de ejecución > Ejecutar todas**. El notebook escribe y ejecuta los programas. La celda de compilación original queda sin cambios.

También se puede comprobar manualmente en una terminal desde la carpeta `taller_nucleo_atomico/`:

```bash
gfortran -Wall -Wextra -fcheck=bounds modulo_nucleo.f90 programa_nucleo.f90 -o nucleo
./nucleo
python -c "import analisis_nucleo as n; a,z,e=n.leer_valle('valle.dat'); A,Z,E=n.buscar_maximo(a,z,e); print(A,Z,E)"
```

La gráfica y `maximo_python.dat` se generan con las llamadas Python que aparecen en la sección C.4 del notebook, pues allí se define la lista `EXPERIMENTALES` dada por el profesor.

### Resultado obtenido

- Cuatro casos **PASS** en la celda original del profesor.
- **257/257** búsquedas del máximo a A fijo correctas.
- Máximo global: **A = 65, Z = 29, EB = -8.6950690577 MeV/nucleón**.
- Para A=208: Z=82; para A=238: Z=92.

