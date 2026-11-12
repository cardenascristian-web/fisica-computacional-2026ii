"""Grafica auxiliar del Taller 7: error real de la integral de energia por nivel.

Usa la tabla creada por programa_energia.f90. No calcula ni sustituye
integrales: solo visualiza el valor convergente frente al balance exacto.
"""
import numpy as np
import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt


def main():
    # genfromtxt acepta filas con diferente cantidad de columnas con una mascara.
    # Cada fila de Romberg contiene el nivel y los valores de esa fila.
    diagonal = []
    with open('tabla_energia.dat', encoding='utf-8') as arch:
        for linea in arch:
            columnas = linea.split()
            if columnas:
                nivel = int(columnas[0])
                diagonal.append((nivel, float(columnas[-1])))

    salida = np.loadtxt('resultado_energia.dat')
    referencia = salida[3]  # energia E(0) - E(3) calculada en Fortran
    niveles = np.array([v[0] for v in diagonal])
    errores = np.array([abs(v[1] - referencia) for v in diagonal])

    fig, ax = plt.subplots(figsize=(6.2, 2.7))
    ax.semilogy(niveles, errores, marker='o', markersize=4.5, linewidth=1.7)
    ax.axhline(1e-6, linestyle='--', linewidth=1.1,
               label='Tolerancia 0.000001')
    ax.set_xticks(niveles)
    ax.set_xlabel('Nivel k de Romberg')
    ax.set_ylabel('Error absoluto (J/kg)')
    ax.set_title('Convergencia: energia disipada', fontsize=10)
    ax.grid(True, alpha=0.25, which='both')
    ax.legend(loc='upper right', fontsize=7.5)
    fig.tight_layout(pad=0.7)
    fig.savefig('convergencia_romberg.png', dpi=220)
    plt.close(fig)
    print('Grafica de convergencia creada: convergencia_romberg.png')


if __name__ == '__main__':
    main()
