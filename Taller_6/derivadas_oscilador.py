"""Física Computacional 106018C - Taller 6 (Semana 7), Parte C.

Estudiante: Cristian Andrés Cárdenas Muñoz; código 2518531.
Velocidad y aceleración del oscilador amortiguado usando únicamente
fórmulas de diferencias finitas y rebanadas de NumPy (sin ciclos por punto).
"""

import numpy as np
import matplotlib
matplotlib.use("Agg")  # Permite guardar la imagen incluso sin interfaz gráfica.
import matplotlib.pyplot as plt

GAMMA = 0.5
OMEGA = 2.0*np.pi
T_FINAL = 3.0


def posicion(t):
    """x(t) = exp(-gamma*t)*cos(omega*t), en metros."""
    return np.exp(-GAMMA*t)*np.cos(OMEGA*t)


def velocidad_exacta(t):
    """Derivada analítica de x(t), solo para evaluar errores."""
    return -np.exp(-GAMMA*t)*(GAMMA*np.cos(OMEGA*t) + OMEGA*np.sin(OMEGA*t))


def aceleracion_exacta(t):
    """Segunda derivada analítica de x(t), solo para evaluar errores."""
    return np.exp(-GAMMA*t)*((GAMMA**2-OMEGA**2)*np.cos(OMEGA*t)
                              + 2.0*GAMMA*OMEGA*np.sin(OMEGA*t))


def calcular(dt):
    """Genera malla, derivadas numéricas y errores máximos para un paso dt."""
    n = int(round(T_FINAL/dt))
    t = np.linspace(0.0, T_FINAL, n+1, dtype=np.float64)
    x = posicion(t)

    # Las rebanadas evitan puntos de borde sin datos suficientes.
    v_adelantada = (x[1:] - x[:-1])/dt            # tiempos t[:-1]
    v_atrasada = (x[1:] - x[:-1])/dt              # tiempos t[1:]
    v_central = (x[2:] - x[:-2])/(2.0*dt)         # tiempos t[1:-1]
    v_cinco = (x[:-4] - 8.0*x[1:-3] + 8.0*x[3:-1] - x[4:])/(12.0*dt)
    a_central = (x[2:] - 2.0*x[1:-1] + x[:-2])/(dt*dt)

    errores = np.array([
        np.max(np.abs(v_adelantada - velocidad_exacta(t[:-1]))),
        np.max(np.abs(v_atrasada - velocidad_exacta(t[1:]))),
        np.max(np.abs(v_central - velocidad_exacta(t[1:-1]))),
        np.max(np.abs(v_cinco - velocidad_exacta(t[2:-2]))),
        np.max(np.abs(a_central - aceleracion_exacta(t[1:-1]))),
    ], dtype=np.float64)
    return t, x, v_central, a_central, errores


def main():
    t, x, v, a, e01 = calcular(0.01)
    _, _, _, _, e005 = calcular(0.005)

    # Contiene solo los 299 puntos donde las fórmulas centrales existen.
    np.savetxt('derivadas_oscilador.dat',
               np.column_stack((t[1:-1], x[1:-1], v, a)),
               fmt='%.16e')

    # Dos filas, seis columnas: dt y los cinco errores de las fórmulas.
    np.savetxt('errores_derivadas.dat',
               np.vstack((np.r_[0.01, e01], np.r_[0.005, e005])),
               fmt='%.16e')

    # Se comparan datos calculados contra sus expresiones exactas.
    fig, (ax_v, ax_a) = plt.subplots(2, 1, figsize=(8.5, 7), sharex=True)
    ti = t[1:-1]
    ax_v.plot(t, velocidad_exacta(t), color='#162A54', lw=1.7,
              label='Velocidad exacta')
    ax_v.plot(ti, v, '--', color='#C9972C', lw=1.3,
              label='Velocidad central, dt = 0.01 s')
    ax_v.set_ylabel('Velocidad (m/s)')
    ax_v.legend(loc='upper right')

    ax_a.plot(t, aceleracion_exacta(t), color='#162A54', lw=1.7,
              label='Aceleración exacta')
    ax_a.plot(ti, a, '--', color='#B02A20', lw=1.3,
              label='Aceleración central, dt = 0.01 s')
    ax_a.set_xlabel('Tiempo (s)')
    ax_a.set_ylabel('Aceleración (m/s²)')
    ax_a.legend(loc='upper right')

    for ax in (ax_v, ax_a):
        ax.grid(True, alpha=0.3)
    fig.suptitle('Oscilador amortiguado: derivación numérica y exacta')
    fig.tight_layout()
    fig.savefig('derivadas_oscilador.png', dpi=180)
    plt.close(fig)

    print('Error máximo de v central (dt=0.01):', f'{e01[2]:.6e}')
    print('Error máximo de a central (dt=0.01):', f'{e01[4]:.6e}')
    print('Razones de error (dt=0.01 / 0.005):',
          ', '.join(f'{r:.4f}' for r in (e01/e005)))
    print('[PASS] Se generaron los archivos de derivación.')


if __name__ == '__main__':
    main()
