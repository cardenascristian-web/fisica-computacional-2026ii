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
## 1.c. Almorzar en la Cafetería Central: el "Centralazo"

### Pseudocódigo

```text
Inicio
    Ir a la Cafetería Central

    Verificar que hoy haya Centralazo

    Si hay Centralazo entonces

        Recordar que el menú es el mismo para todos
        Aceptar filosóficamente lo que haya tocado hoy

        Verificar si tengo ticket

        Si tengo ticket entonces
            Ir directamente a la fila para subir a los comedores

        Sino
            Verificar si tengo dos lukas disponibles

            Si tengo dos lukas entonces
                Hacer la fila para comprar el ticket
                Esperar pacientemente mi turno
                Pagar dos lukas
                Recibir el ticket
                Ir a la fila para subir a los comedores

            Sino
                Aceptar la realidad económica
                Buscar otra forma de sobrevivir al mediodía
            Fin Si

        Fin Si

        Mientras haya personas delante de mí en la fila
            Esperar pacientemente
            Cuestionar por qué todo el mundo decidió almorzar exactamente al mismo tiempo
        Fin Mientras

        Subir las escaleras hacia los comedores
        Entregar el ticket

        Recibir el Centralazo del día

        Buscar una mesa disponible

        Si hay una mesa disponible entonces
            Sentarse
        Sino
            Buscar pacientemente algún espacio libre
        Fin Si

        Observar detenidamente el Centralazo
        Evaluar visualmente la situación
        Recordar que costó solamente dos lukas

        Comer el almuerzo

        Mientras todavía tenga hambre y quede comida
            Continuar comiendo
        Fin Mientras

        Si ya no tengo hambre entonces
            Considerar el Centralazo un éxito
        Sino
            Aceptar que hoy el Centralazo no fue suficiente
        Fin Si

        Recoger los residuos
        Depositar la basura en su lugar correspondiente
        Salir del comedor

    Sino
        Aceptar que hoy no hubo Centralazo
        Buscar comida en otro lugar
    Fin Si

Fin
```

### Diagrama de flujo

```mermaid
flowchart TD

    A(["Inicio"]) --> B["Ir a la Cafetería Central"]

    B --> C{"¿Hoy hay Centralazo?"}

    C -- "No" --> X["Aceptar que hoy no hubo Centralazo"]
    X --> X2["Buscar comida en otro lugar"]
    X2 --> Z(["Fin"])

    C -- "Sí" --> D["Recordar que el menú es el mismo para todos"]
    D --> E["Aceptar filosóficamente lo que haya tocado hoy"]

    E --> F{"¿Tengo ticket?"}

    F -- "Sí" --> M["Ir a la fila para subir a los comedores"]

    F -- "No" --> G{"¿Tengo dos lukas?"}

    G -- "No" --> H["Aceptar la realidad económica"]
    H --> H2["Buscar otra forma de sobrevivir al mediodía"]
    H2 --> Z

    G -- "Sí" --> I["Hacer la fila para comprar el ticket"]
    I --> J["Esperar pacientemente mi turno"]
    J --> K["Pagar dos lukas"]
    K --> L["Recibir el ticket"]
    L --> M

    M --> N{"¿Hay personas delante de mí?"}

    N -- "Sí" --> O["Esperar pacientemente"]
    O --> O2["Cuestionar por qué todos decidieron almorzar al mismo tiempo"]
    O2 --> N

    N -- "No" --> P["Subir las escaleras hacia los comedores"]
    P --> Q["Entregar el ticket"]
    Q --> R["Recibir el Centralazo del día"]

    R --> S{"¿Hay una mesa disponible?"}

    S -- "Sí" --> T["Sentarse"]
    S -- "No" --> U["Buscar pacientemente algún espacio libre"]
    U --> T

    T --> V["Observar detenidamente el Centralazo"]
    V --> W["Evaluar visualmente la situación"]
    W --> W2["Recordar que costó solamente dos lukas"]
    W2 --> AA["Comer el almuerzo"]

    AA --> AB{"¿Todavía tengo hambre y queda comida?"}

    AB -- "Sí" --> AC["Continuar comiendo"]
    AC --> AB

    AB -- "No" --> AD{"¿Ya no tengo hambre?"}

    AD -- "Sí" --> AE["Considerar el Centralazo un éxito"]
    AD -- "No" --> AF["Aceptar que hoy el Centralazo no fue suficiente"]

    AE --> AG["Recoger los residuos"]
    AF --> AG

    AG --> AH["Depositar la basura en su lugar correspondiente"]
    AH --> AI["Salir del comedor"]
    AI --> Z
```

---

# Punto 2 - Altura máxima de un proyectil

## Descripción del problema

Se desea diseñar un programa en Fortran que calcule la altura máxima alcanzada por un proyectil a partir de su rapidez inicial y del ángulo de lanzamiento respecto a la horizontal.

La ecuación utilizada es:

$$
h_{\max} = \frac{v_0^2 \sin^2(\theta)}{2g}
$$

donde:

- $v_0$ es la rapidez inicial del proyectil en m/s.
- $\theta$ es el ángulo de lanzamiento.
- $g = 9.8\ \mathrm{m/s^2}$ es la aceleración de la gravedad.
- $h_{\max}$ es la altura máxima alcanzada en metros.

Debido a que la función `sin()` de Fortran recibe el ángulo en radianes, primero se debe convertir el ángulo ingresado en grados mediante:

$$
\theta_{\mathrm{rad}}
=
\theta_{\mathrm{grados}}
\frac{\pi}{180}
$$

---

## Pseudocódigo

```text
Inicio

    Definir g = 9.8
    Definir pi = 3.14159265

    Leer rapidez inicial v0
    Leer angulo_grados

    Mostrar nuevamente los datos ingresados

    Convertir el ángulo de grados a radianes

    angulo_rad <- angulo_grados * pi / 180

    Calcular la altura máxima

    h_max <- (v0^2 * sin(angulo_rad)^2) / (2 * g)

    Mostrar h_max en metros

    Realizar pruebas de verificación

    Caso 1:
        angulo = 90 grados
        v0 = 9.8 m/s
        valor esperado = 4.9000 m

        Calcular la altura

        Si la diferencia entre el resultado y el valor esperado
        está dentro de la tolerancia entonces
            Mostrar "Caso 1: PASS"
        Sino
            Mostrar "Caso 1: FAIL"
        Fin Si

    Caso 2:
        angulo = 45 grados
        v0 = 20.0 m/s
        valor esperado = 10.2041 m

        Calcular la altura

        Si la diferencia entre el resultado y el valor esperado
        está dentro de la tolerancia entonces
            Mostrar "Caso 2: PASS"
        Sino
            Mostrar "Caso 2: FAIL"
        Fin Si

    Caso 3:
        angulo = 30 grados
        v0 = 20.0 m/s
        valor esperado = 5.1020 m

        Calcular la altura

        Si la diferencia entre el resultado y el valor esperado
        está dentro de la tolerancia entonces
            Mostrar "Caso 3: PASS"
        Sino
            Mostrar "Caso 3: FAIL"
        Fin Si

Fin
```

### Diagrama de flujo

```mermaid
flowchart TD

    A(["Inicio"]) --> B["Definir constantes g y pi"]

    B --> C["Leer rapidez inicial v0"]
    C --> D["Leer ángulo en grados"]

    D --> E["Mostrar nuevamente los datos ingresados"]

    E --> F["Convertir el ángulo de grados a radianes"]

    F --> G["Calcular la altura máxima"]

    G --> H["Mostrar la altura máxima en metros"]

    H --> I["Calcular caso de referencia 1"]

    I --> J{"¿Resultado dentro de la tolerancia?"}

    J -- "Sí" --> K["Mostrar Caso 1: PASS"]
    J -- "No" --> L["Mostrar Caso 1: FAIL"]

    K --> M["Calcular caso de referencia 2"]
    L --> M

    M --> N{"¿Resultado dentro de la tolerancia?"}

    N -- "Sí" --> O["Mostrar Caso 2: PASS"]
    N -- "No" --> P["Mostrar Caso 2: FAIL"]

    O --> Q["Calcular caso de referencia 3"]
    P --> Q

    Q --> R{"¿Resultado dentro de la tolerancia?"}

    R -- "Sí" --> S["Mostrar Caso 3: PASS"]
    R -- "No" --> T["Mostrar Caso 3: FAIL"]

    S --> U(["Fin"])
    T --> U
```

---
