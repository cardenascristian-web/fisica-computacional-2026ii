# Taller 2 — Física Computacional

**Autor:** Juan Manuel Garcés Andrade

## Contenido

Este taller estudia dos problemas numéricos en Python:

1. Aproximación de `sin(x)` mediante su serie de Taylor.
2. Decaimiento radiactivo usando operaciones vectorizadas de NumPy.

## Parte A — Serie de Taylor de sin(x)

La serie utilizada es:

`sin(x) = x - x^3/3! + x^5/5! - ...`

Para no recalcular factoriales y potencias en cada iteración se usa la recurrencia:

`t_n = -t_(n-1) * x^2 / ((2n)(2n+1))`

El criterio de parada implementado es:

`abs(term) < tol * max(1, abs(total))`

con `tol = 1e-8`.

### Resultado principal

Para argumentos pequeños y moderados, la implementación reproduce `math.sin(x)` con errores muy pequeños. Cerca de un cero del seno, por ejemplo `x = 4*pi`, el error relativo deja de ser una medida estable porque el valor de referencia es prácticamente cero.

Para argumentos grandes, como `x = 100`, la suma directa pierde precisión por la presencia de términos intermedios muy grandes y cancelación numérica. La solución utilizada es reducir primero el argumento con:

```python
math.remainder(x, 2 * math.pi)
```

## Parte B — Decaimiento radiactivo

Se usa el modelo:

`N(t) = N0 * exp(-lambda*t)`

con:

- `N0 = 10000`
- `t_1/2 = 5 años`
- `lambda = ln(2)/5 ≈ 0.13862944 1/año`

Resultados de referencia:

| Tiempo | Núcleos | Fracción |
|---:|---:|---:|
| 0 años | 10000 | 100 % |
| 5 años | 5000 | 50 % |
| 10 años | 2500 | 25 % |
| 15 años | 1250 | 12.5 % |

El 10 % de la muestra se alcanza aproximadamente a los **16.61 años**.

## Decisión de implementación

Para el decaimiento se usa `numpy.linspace()` y una expresión vectorizada de NumPy. No se utiliza un ciclo `for` para calcular `N(t)`. Esto hace que la implementación siga directamente la ecuación física y facilite el análisis de muchos tiempos.

## Verificación

El notebook termina con casos conocidos que imprimen `PASS/FAIL` para:

- `suma_seno_reducida`
- `N_decaimiento`

Antes de entregar, todos los casos deben imprimir `PASS`.

## Estructura sugerida del repositorio

```text
Taller_2/
├── README.md
├── Taller_2_Fisica_Computacional.ipynb
└── reporte/
    └── Taller_2_Decaimiento_Radiactivo.pdf
```

## Uso ético de IA

Se utilizó una herramienta de inteligencia artificial como apoyo para revisar la organización del código, contrastar la interpretación de errores numéricos y mejorar la redacción. Los cálculos, resultados y verificaciones fueron ejecutados y revisados antes de la entrega.
