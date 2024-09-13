import numpy as np
import matplotlib.pyplot as plt
from scipy import ndimage, integrate, optimize
from skimage import io, util, color, restoration
from scipy.ndimage import gaussian_filter
from sympy import (
    symbols, expand, sin, cos, simplify,
    limit, log, diff, Eq, solve, Not, Or, And, satisfiable,
    Function, dsolve
)
from fractions import Fraction
from numpy.lib.scimath import sqrt as scisqrt
from decimal import Decimal, getcontext
from scipy.ndimage import median_filter

# Definim funcția de optimizat
def functie_optimizare(x):
    return np.cos(x) - 3 * np.exp(-(x - 0.2)**2)

# Generăm un set de puncte pentru x
x_valori = np.linspace(-5, 5, 1000)

# Calculăm valorile corespunzătoare funcției
y_valori = functie_optimizare(x_valori)

# Găsim minimul pentru valoarea inițială x0 = 1.0
x0_1 = 1.0
x_min_1 = optimize.fmin(functie_optimizare, x0_1)

# Găsim minimul pentru valoarea inițială x0 = 2.0
x0_2 = 2.0
x_min_2 = optimize.fmin(functie_optimizare, x0_2)

# Trasăm graficul funcției și locurile valorilor minime
plt.figure(figsize=(8, 6))
plt.plot(x_valori, y_valori, label='Funcția de optimizare')
plt.scatter([x0_1, x0_2], [functie_optimizare(x0_1), functie_optimizare(x0_2)],
            color='blue', label='Valori inițiale', marker='o')
plt.scatter([x_min_1, x_min_2], [functie_optimizare(x_min_1), functie_optimizare(x_min_2)],
            color='red', label='Valori minime', marker='x')

# Adăugăm etichete și titlu
plt.xlabel('x')
plt.ylabel('f(x)')
plt.title('Graficul funcției și valorile minime')
plt.legend()

# Afișăm graficul
plt.show()