# Pseudocódigo de Romberg — Taller 6 (Semana 7)

**Estudiante:** Cristian Andrés Cárdenas Muñoz  
**Código:** 2518531

La suma de los puntos nuevos solo incluye los puntos medios que aparecen al reducir el paso a la mitad. Por ello no se repiten evaluaciones del integrando.

```text
ENTRADAS: a, b, tol, kmax
h      ← b − a
S(0,0) ← (h/2)·[ f(a) + f(b) ]
n_eval ← 2
PARA k = 1, 2, ..., kmax:
    h ← h/2
    suma ← 0
    PARA i = 1, 2^(k−1):
        suma ← suma + f(a + (2i−1)·h)       [ESPACIO 1]
    FIN PARA
    n_eval ← n_eval + 2^(k−1)             [ESPACIO 2]
    S(k,0) ← S(k−1,0)/2 + h·suma
    PARA j = 1, ..., k:
        S(k,j) ← (4^j·S(k,j−1) − S(k−1,j−1))/(4^j−1) [ESPACIO 3]
    FIN PARA
    SI |S(k,k) − S(k−1,k−1)| < tol:
        TERMINAR con k_final = k
FIN PARA
SALIDAS: tabla S, k_final, n_eval
```

- **Espacio 1:** `sum_{i=1}^{2^(k−1)} f(a + (2i−1)h)`, con `h = (b−a)/2^k`.
- **Espacio 2:** `2^(k−1)` puntos nuevos.
- **Espacio 3:** `(4^j*S(k,j−1) − S(k−1,j−1))/(4^j−1)` (Richardson).

En el nivel final `k`, el número acumulado de evaluaciones del integrando es `2^k + 1`, porque los valores antiguos se reutilizan. Se almacena `S` como arreglo bidimensional con índices que comienzan en cero.
