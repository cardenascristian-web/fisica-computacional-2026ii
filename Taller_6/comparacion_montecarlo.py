"""Comparación reproducible de pi por Monte Carlo con N = 10**6.

Física Computacional 106018C - Taller 6, parte D.
Cristian Andrés Cárdenas Muñoz (2518531).
Se incluye como comparación independiente; no sustituye el Taller 5.
"""
import numpy as np


def main():
    n = 1_000_000
    rng = np.random.default_rng(2518531)  # Semilla para reproducibilidad.
    x = rng.random(n)
    y = rng.random(n)
    dentro = np.count_nonzero(x*x+y*y <= 1.0)
    estimacion = 4.0*dentro/n
    error_absoluto = abs(estimacion-np.pi)

    p = np.pi/4.0
    sigma = 4.0*np.sqrt(p*(1.0-p))
    error_estadistico = sigma/np.sqrt(n)
    n_para_error_1e5 = int(np.ceil((sigma/1.0e-5)**2))

    # Linea 1: N, pi_MC, error_real, error_estadistico_estimado.
    # Linea 2: muestras teoricas para incertidumbre 1e-5.
    with open('comparacion_montecarlo.dat','w',encoding='utf-8') as arch:
        arch.write(f'{n} {estimacion:.16e} {error_absoluto:.16e} {error_estadistico:.16e}\n')
        arch.write(f'# N para error estadistico 1e-5: {n_para_error_1e5}\n')

    print(f'Monte Carlo N = {n:,}: pi = {estimacion:.9f}')
    print(f'Error observado: {error_absoluto:.6e}')
    print(f'Error estadistico (1 sigma): {error_estadistico:.6e}')
    print(f'N teorico para error estadistico 1e-5: {n_para_error_1e5:,}')


if __name__ == '__main__':
    main()
