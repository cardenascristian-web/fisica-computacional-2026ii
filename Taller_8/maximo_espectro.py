"""Taller 8 - Parte D. Maximo de la radiacion solar.

Las diferencias centrales se implementan con rebanadas; CubicSpline
se usa solamente para interpolar y localizar los ceros permitidos.
"""
import numpy as np
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
from scipy.interpolate import CubicSpline

H = 6.62607015e-34
C = 299792458.0
KB = 1.380649e-23
T = 5772.0


def planck(lam_nm):
    """Radiancia espectral por metro de longitud de onda, en unidades SI."""
    lam = np.asarray(lam_nm, dtype=np.float64) * 1e-9
    return 2*H*C**2 / (lam**5 * np.expm1(H*C/(lam*KB*T)))


def maximo_spline(s, cerca):
    """Selecciona el cero con curvatura negativa mas cercano al maximo discreto."""
    r = s.roots(extrapolate=False)
    r = r[np.isfinite(r)]
    r = r[s(r, 1) < 0]
    if r.size == 0:
        raise ValueError("No se encontro un maximo interior")
    return r[np.argmin(np.abs(r-cerca))]


def calcular(dl):
    """Tres estimaciones del maximo sobre una malla uniforme en nm."""
    lam = np.arange(100.0, 3000.0 + dl/2, dl, dtype=np.float64)
    B = planck(lam)
    a = lam[np.argmax(B)]
    # Escalar por una constante positiva no cambia la ubicacion del maximo.
    y = B/B.max()
    d = (y[2:] - y[:-2])/(2*dl)
    b = maximo_spline(CubicSpline(lam[1:-1], d), a)
    c = maximo_spline(CubicSpline(lam, y).derivative(), a)
    return lam, B, np.array([a, b, c])


def main():
    x5, x3, b = np.loadtxt("constante_wien.dat")
    referencia = b/T*1e9
    max_frecuencia = H*C/(KB*T*x3)*1e9
    filas = []
    for dl in (100.0, 50.0, 25.0, 12.5):
        lam, B, maximos = calcular(dl)
        errores = np.abs(maximos-referencia)
        filas.append([dl, *errores])
        print(f"Paso {dl:5.1f} nm: máximos {maximos}; errores {errores}")
        if dl == 25.0:
            fig, ax = plt.subplots(figsize=(8.4, 4.8))
            ax.plot(lam, B/1e13, "o-", ms=2.5, lw=1.6, color="#162A54",
                    label="Ley de Planck, malla de 25 nm")
            ax.axvline(referencia, color="#B02A20", ls="--",
                       label=f"Máximo de Bλ (Wien): {referencia:.2f} nm")
            ax.axvline(max_frecuencia, color="#2E7D32", ls=":",
                       label=f"λ del máximo de Bν: {max_frecuencia:.2f} nm")
            ax.scatter(maximos[2], planck(maximos[2])/1e13, color="#C9972C",
                       zorder=4, label=f"Máximo por spline: {maximos[2]:.2f} nm")
            ax.set(xlabel="Longitud de onda (nm)",
                   ylabel=r"Radiancia $B_\lambda$ ($10^{13}$ W m$^{-2}$ sr$^{-1}$ m$^{-1}$)",
                   title="Espectro solar idealizado — T = 5772 K")
            ax.grid(alpha=0.25)
            ax.legend(fontsize=8)
            fig.tight_layout()
            fig.savefig("espectro_solar.png", dpi=180)
            plt.close(fig)
    np.savetxt("maximo_espectro.dat", filas, fmt="%24.16e")
    print(f"Máximo de Wien: {referencia:.8f} nm; equivalente en frecuencia: {max_frecuencia:.8f} nm")


if __name__ == "__main__":
    main()
