# Taller 6 — Física Computacional (106018C)

**Estudiante:** Cristian Andrés Cárdenas Muñoz  
**Código:** 2518531  
**Tema:** Funciones, subrutinas y módulos. Fórmula semiempírica de masa nuclear.  
**Lenguajes:** Fortran y Python.  
**Semana:** 6.  

## Objetivo

Calcular la energía de enlace por nucleón y la masa atómica aproximada con un modelo de cuatro términos. Para cada A de 4 a 260, hallar el Z que maximiza B/A (equivalente a minimizar EB), registrar el máximo global y comparar una gráfica con datos experimentales AME2020. La curva de máximo enlace no debe confundirse con una demostración de estabilidad ante decaimientos beta.

## Archivos importantes

- `Semana_06_Funciones_ESTUDIANTES_REVISADO.ipynb`: cuaderno del curso completado; pseudocódigo, ejercicios de calentamiento, implementación de Taller 6, las cuatro preguntas E y la verificación **4/4 PASS**. La celda de verificación del profesor se conserva sin cambios.
- `taller_nucleo_atomico/modulo_nucleo.f90`: módulo del modelo, constantes y funciones; subrutina `z_estable`.
- `taller_nucleo_atomico/programa_nucleo.f90`: programa principal que genera `nucleos.dat`, `valle.dat` y `maximo.dat`.
- `taller_nucleo_atomico/analisis_nucleo.py`: lectura, búsqueda del máximo, guardado y gráfica mediante cuatro funciones.
- `taller_nucleo_atomico/nucleos.dat`: ocho núclidos (8 filas, 8 columnas).
- `taller_nucleo_atomico/valle.dat`: 257 valores de A=4 a 260 (257 filas, 3 columnas).
- `taller_nucleo_atomico/maximo.dat`: máximo global en Fortran (A, Z, EB).
- `taller_nucleo_atomico/maximo_python.dat`: máximo global encontrado de nuevo en Python.
- `taller_nucleo_atomico/curva_enlace.png`: gráfica B/A frente a A con diez núclidos experimentales.
- `taller_nucleo_atomico/consultas_interpretacion.f90`: cálculos auxiliares reproducibles para las preguntas E3 y E4, sin modificar el modelo de cuatro términos.
- `pseudocodigo_nucleo.md`: copia independiente del pseudocódigo obligatorio, también disponible en el notebook.
- `reporte_taller_6.tex` y `reporte_taller_6.pdf`: borrador del informe de una página basado en la plantilla LaTeX de la asignatura. Se entrega el PDF en Moodle.

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

## Antes de entregar

1. Reejecutar todas las celdas después de cualquier cambio en los `.f90` o `.py`: el verificador comprueba fechas de modificación de los `.dat`.
2. Revisar personalmente el código, las respuestas de interpretación y el PDF; el docente puede pedir sustentación.
3. Subir este contenido dentro de la carpeta **`Taller_6/`** del repositorio de GitHub y compartir ese enlace en Moodle.
4. Subir `reporte_taller_6.pdf` a Moodle (una página).
5. Participar en el foro del taller con una dificultad o decisión técnica, responder de forma específica a un compañero y declarar el uso de IA de acuerdo con las instrucciones del curso.

**Transparencia:** Se utilizó ChatGPT para preparar código, documentación, respuestas de interpretación y un borrador del reporte. El estudiante debe revisar, comprender y adaptar el material antes de entregarlo.
