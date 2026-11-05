# Taller 6 — Respuestas de interpretación

Estas respuestas también están incorporadas a la sección E del notebook.

## Pregunta 1

**Respuesta.** Para el núcleo liviano Ar-38 ($Z=18$, $A=38$), el término de superficie es **+5.4432 MeV por nucleón** y el de Coulomb **+1.8006 MeV por nucleón**: predomina la penalización de superficie. En el núcleo pesado Pu-244 ($Z=94$, $A=244$), superficie vale **+2.9286 MeV por nucleón** y Coulomb **+4.1146 MeV por nucleón**: predomina la repulsión eléctrica. La disminución de la penalización superficial a medida que aumenta $A$, seguida por el aumento relativo de Coulomb en los núcleos pesados, ayuda a explicar el máximo de $B/A$ en masas intermedias. Estos números salen de `nucleos.dat`.

## Pregunta 2

**Respuesta.** El máximo de nuestra curva está en **$A=65$, $Z=29$** y tiene $E_B=-8.69506906$ MeV por nucleón. Para **$A=62$**, la curva elige $Z=28$ y da $E_B=-8.69089084$ MeV por nucleón. Defino la resta $E_B(65,29)-E_B(62,28)$: **$-0.00417822$ MeV por nucleón**; su magnitud es **$0.0481\%$** de $|E_B(62,28)|$. Es una diferencia pequeña, pero el lugar exacto del máximo puede desplazarse porque el modelo de cuatro términos omite efectos de capas nucleares y apareamiento. La comparación con el punto experimental **Ni-62** debe utilizar el mismo $Z=28$, $A=62$: el modelo da $B/A=8.69089$ MeV frente a **8.79450 MeV** de AME2020, una diferencia de **$-0.10361$ MeV** (modelo menos ligado).

## Pregunta 3

**Respuesta.** Para $A=56$, el modelo base favorece **$Z=25$** ($N=31$): $E_B(25,56)=-8.67953010$ MeV/nucleón. Para **Fe-56**, $Z=26$, $N=30$, se obtiene $E_B(26,56)=-8.65832033$ MeV/nucleón. La diferencia de **energía total**, definida como $E_{\rm total}(Z=25)-E_{\rm total}(Fe)$, es **$56[-8.67953010-(-8.65832033)]=-1.18775$ MeV**: sin apareamiento el modelo liga más a $Z=25$. Con $a_P=12$ MeV, la corrección total es **$+12/\sqrt{56}=+1.60357$ MeV** para $Z=25$, $N=31$ (impar-impar) y **$-1.60357$ MeV** para Fe-56 (par-par). La nueva resta es **$-1.18775+1.60357-(-1.60357)=+2.01939$ MeV**: *entre estos dos núcleos*, el hierro queda más ligado al incluir apareamiento. No se modifica el modelo base ni sus archivos verificados.

## Pregunta 4

**Respuesta.** Usando la función `masa_atomica` del módulo de Fortran, para la reacción idealizada ${}^{236}\mathrm{U}\to2\,{}^{118}\mathrm{Pd}$ resulta **$Q=M(92,236)-2M(46,118)=+178.19226$ MeV**. Al ser positivo, la diferencia de masas favorece energéticamente el proceso. Queda **21.81 MeV por debajo** de la escala orientativa de $200$ MeV (aprox. $10.9\%$). Es una fisión simétrica idealizada: la fisión real produce distribuciones de fragmentos, neutrones, radiación y energía cinética; el modelo semiempírico tampoco reproduce todos esos efectos.

