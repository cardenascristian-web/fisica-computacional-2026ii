# Taller 1 - Física Computacional

## Contenido

Este directorio contiene el desarrollo del Taller 1 de Física Computacional.

### Archivos

- `README.md`: pseudocódigos, diagramas de flujo y glosario.
- `altura_maxima_proyectil.f90`: programa en Fortran para calcular la altura máxima de un proyectil bien x
- `reporte_taller_1.tex`: código fuente del reporte en LaTeX.
- `reporte_taller_1.pdf`: reporte final del taller.

---

# Punto 1 - Algoritmos cotidianos

## 1.a. Sacar *Cien años de soledad* de la Biblioteca Central

### Pseudocódigo

```text
Inicio
    Ir a la Biblioteca Central

    Verificar que la biblioteca esté en pie y completamente funcional

    Si la biblioteca está en pie y completamente funcional entonces
        Ingresar a la biblioteca
        Buscar "Cien años de soledad" en el catálogo
        Obtener la ubicación del libro
        Ir a la sección indicada
        Buscar el libro en el estante

        Si el libro está disponible entonces
            Tomar el libro
            Ir al punto de préstamo
            Presentar identificación o carné estudiantil
            Solicitar el préstamo del libro

            Si el préstamo es autorizado entonces
                Recibir el libro
                Salir de la biblioteca
            Sino
                Informar que no fue posible realizar el préstamo
            Fin Si

        Sino
            Informar que el libro no está disponible
        Fin Si

    Sino
        Llamar a los capuchos
        Hacer paro
    Fin Si
Fin
```

### Diagrama de flujo

```mermaid
flowchart TD

    A([Inicio]) --> B[Ir a la Biblioteca Central]

    B --> C{¿La biblioteca está en pie y completamente funcional?}

    C -- Sí --> D[Ingresar a la biblioteca]
    C -- No --> X[Llamar a los capuchos]
    X --> Y[Hacer paro]
    Y --> Z([Fin])

    D --> E[Buscar Cien años de soledad en el catálogo]
    E --> F[Obtener ubicación del libro]
    F --> G[Ir a la sección indicada]
    G --> H[Buscar el libro en el estante]

    H --> I{¿Libro disponible?}

    I -- Sí --> J[Tomar el libro]
    J --> K[Ir al punto de préstamo]
    K --> L[Presentar carné o identificación]
    L --> M[Solicitar préstamo]

    M --> N{¿Préstamo autorizado?}

    N -- Sí --> O[Recibir el libro]
    O --> P[Salir de la biblioteca]
    P --> Q([Fin])

    N -- No --> R[Informar que no fue posible realizar el préstamo]
    R --> Q

    I -- No --> S[Informar que el libro no está disponible]
    S --> Q
```

---

## 1.b. Preparar una tortilla

### Pseudocódigo

```text
Inicio
    Reunir los ingredientes y utensilios
    Tomar los huevos

    Si hay huevos disponibles entonces
        Romper los huevos en un recipiente
        Agregar sal al gusto
        Batir los huevos

        Colocar una sartén en la estufa
        Agregar aceite o mantequilla
        Encender la estufa

        Verter los huevos batidos en la sartén

        Mientras la parte inferior no esté cocida
            Continuar cocinando
        Fin Mientras

        Voltear la tortilla

        Mientras el otro lado no esté cocido
            Continuar cocinando
        Fin Mientras

        Apagar la estufa
        Retirar la tortilla de la sartén
        Servir la tortilla

    Sino
        Informar que no es posible preparar la tortilla
    Fin Si
Fin
```

### Diagrama de flujo

```mermaid
flowchart TD

    A([Inicio]) --> B[Reunir ingredientes y utensilios]
    B --> C[Tomar los huevos]

    C --> D{¿Hay huevos disponibles?}

    D -- No --> X[Informar que no es posible preparar la tortilla]
    X --> Z([Fin])

    D -- Sí --> E[Romper los huevos en un recipiente]
    E --> F[Agregar sal al gusto]
    F --> G[Batir los huevos]
    G --> H[Colocar una sartén en la estufa]
    H --> I[Agregar aceite o mantequilla]
    I --> J[Encender la estufa]
    J --> K[Verter los huevos batidos]

    K --> L{¿La parte inferior está cocida?}

    L -- No --> M[Continuar cocinando]
    M --> L

    L -- Sí --> N[Voltear la tortilla]

    N --> O{¿El otro lado está cocido?}

    O -- No --> P[Continuar cocinando]
    P --> O

    O -- Sí --> Q[Apagar la estufa]
    Q --> R[Retirar la tortilla]
    R --> S[Servir la tortilla]
    S --> Z
```
