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

    Verificar el estado de no pudredumbre de los huevos

    Si los huevos están en buen estado entonces

        Pensar detenidamente cómo prefiero comer los huevos hoy

        Si después de una profunda reflexión sigo queriendo tortilla entonces
            Romper los huevos en un recipiente
            Agregar sal al gusto
            Batir los huevos

            Colocar una sartén en la estufa
            Agregar aceite o mantequilla
            Encender la estufa

            Verter los huevos batidos en la sartén

            Mientras la parte inferior no esté cocida
                Observar pacientemente la tortilla
                Resistir la tentación de voltearla antes de tiempo
                Continuar cocinando
            Fin Mientras

            Voltear la tortilla

            Mientras el otro lado no esté cocido
                Continuar cocinando
            Fin Mientras

            Apagar la estufa
            Retirar la tortilla de la sartén
            Servir la tortilla

            Contemplar brevemente las consecuencias de mis decisiones culinarias

        Sino
            Elegir otra preparación para los huevos
        Fin Si

    Sino
        No consumir los huevos bajo ninguna circunstancia
        Desechar los huevos
        Considerar seriamente revisar la nevera con mayor frecuencia
    Fin Si

Fin
```

### Diagrama de flujo

```mermaid
flowchart TD

    A([Inicio]) --> B[Reunir ingredientes y utensilios]
    B --> C[Tomar los huevos]
    C --> D[Verificar el estado de no pudredumbre de los huevos]

    D --> E{¿Los huevos están en buen estado?}

    E -- No --> X[No consumir los huevos bajo ninguna circunstancia]
    X --> Y[Desechar los huevos]
    Y --> Y2[Considerar revisar la nevera con mayor frecuencia]
    Y2 --> Z([Fin])

    E -- Sí --> F[Pensar detenidamente cómo prefiero comer los huevos hoy]

    F --> G{¿Sigo queriendo tortilla?}

    G -- No --> H[Elegir otra preparación para los huevos]
    H --> Z

    G -- Sí --> I[Romper los huevos en un recipiente]
    I --> J[Agregar sal al gusto]
    J --> K[Batir los huevos]
    K --> L[Colocar una sartén en la estufa]
    L --> M[Agregar aceite o mantequilla]
    M --> N[Encender la estufa]
    N --> O[Verter los huevos batidos en la sartén]

    O --> P{¿La parte inferior está cocida?}

    P -- No --> Q[Observar pacientemente la tortilla]
    Q --> R[Resistir la tentación de voltearla antes de tiempo]
    R --> P

    P -- Sí --> S[Voltear la tortilla]

    S --> T{¿El otro lado está cocido?}

    T -- No --> U[Continuar cocinando]
    U --> T

    T -- Sí --> V[Apagar la estufa]
    V --> W[Retirar la tortilla de la sartén]
    W --> AA[Servir la tortilla]
    AA --> AB[Contemplar brevemente las consecuencias de mis decisiones culinarias]
    AB --> Z
```

---
## 1.c. Almorzar en la Cafetería Central

### Pseudocódigo

```text
Inicio
    Ir a la Cafetería Central

    Verificar que la cafetería esté abierta y aparentemente funcional

    Si la cafetería está abierta entonces

        Revisar detenidamente las opciones disponibles

        Pensar con seriedad qué tan hambriento estoy
        Comparar mentalmente hambre, precio y aspecto de la comida

        Si existe una opción que parece razonablemente comestible entonces

            Elegir el almuerzo

            Verificar si tengo suficiente dinero para pagarlo

            Si tengo suficiente dinero entonces

                Hacer la fila

                Mientras haya personas delante de mí
                    Esperar pacientemente
                    Contemplar brevemente si realmente valía la pena venir
                Fin Mientras

                Pedir el almuerzo
                Pagar el almuerzo
                Recibir la comida

                Buscar una mesa disponible

                Si hay una mesa disponible entonces
                    Sentarse
                Sino
                    Buscar un lugar alternativo donde sentarse
                Fin Si

                Observar el almuerzo por unos segundos
                Preguntarme si tomé una buena decisión

                Comer el almuerzo

                Mientras todavía tenga hambre y quede comida
                    Continuar comiendo
                Fin Mientras

                Si ya no tengo hambre entonces
                    Considerar el almuerzo un éxito
                Sino
                    Aceptar las consecuencias de haber escogido mal
                Fin Si

                Recoger los residuos
                Depositar la basura en su lugar correspondiente
                Salir de la cafetería

            Sino
                Mirar nuevamente los precios
                Aceptar la realidad económica
                Buscar una alternativa más barata
            Fin Si

        Sino
            Cuestionar seriamente las opciones disponibles
            Buscar comida en otro lugar
        Fin Si

    Sino
        Aceptar que hoy no se almuerza ahí
        Buscar otra opción para sobrevivir
    Fin Si

Fin
```

### Diagrama de flujo

```mermaid
flowchart TD

    A([Inicio]) --> B[Ir a la Cafetería Central]

    B --> C[Verificar que la cafetería esté abierta y aparentemente funcional]

    C --> D{¿La cafetería está abierta?}

    D -- No --> X[Aceptar que hoy no se almuerza ahí]
    X --> X2[Buscar otra opción para sobrevivir]
    X2 --> Z([Fin])

    D -- Sí --> E[Revisar detenidamente las opciones disponibles]

    E --> F[Pensar con seriedad qué tan hambriento estoy]
    F --> G[Comparar hambre, precio y aspecto de la comida]

    G --> H{¿Existe una opción razonablemente comestible?}

    H -- No --> Y[Cuestionar seriamente las opciones disponibles]
    Y --> Y2[Buscar comida en otro lugar]
    Y2 --> Z

    H -- Sí --> I[Elegir el almuerzo]

    I --> J{¿Tengo suficiente dinero?}

    J -- No --> K[Mirar nuevamente los precios]
    K --> L[Aceptar la realidad económica]
    L --> M[Buscar una alternativa más barata]
    M --> Z

    J -- Sí --> N[Hacer la fila]

    N --> O{¿Hay personas delante de mí?}

    O -- Sí --> P[Esperar pacientemente]
    P --> P2[Contemplar brevemente si realmente valía la pena venir]
    P2 --> O

    O -- No --> Q[Pedir el almuerzo]
    Q --> R[Pagar el almuerzo]
    R --> S[Recibir la comida]

    S --> T{¿Hay una mesa disponible?}

    T -- Sí --> U[Sentarse]
    T -- No --> V[Buscar un lugar alternativo donde sentarse]
    V --> U

    U --> W[Observar el almuerzo por unos segundos]
    W --> W2[Preguntarme si tomé una buena decisión]
    W2 --> AA[Comer el almuerzo]

    AA --> AB{¿Todavía tengo hambre y queda comida?}

    AB -- Sí --> AC[Continuar comiendo]
    AC --> AB

    AB -- No --> AD{¿Ya no tengo hambre?}

    AD -- Sí --> AE[Considerar el almuerzo un éxito]
    AD -- No --> AF[Aceptar las consecuencias de haber escogido mal]

    AE --> AG[Recoger los residuos]
    AF --> AG

    AG --> AH[Depositar la basura en su lugar correspondiente]
    AH --> AI[Salir de la cafetería]
    AI --> Z
```

---
