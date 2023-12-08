#ВАЖНО: НЕ ДОБАВЛЯЙТЕ КУСКИ КОДА В СВОИ ОТЧЕТЫ, спасибо)

import math

# Если numpy или matplotlib не установлен раскомментируйте эти строки:
from os import system
system("pip install numpy")
system("pip install matplotlib")

import numpy as np
import matplotlib.pyplot as plt

# Сопротивления
z1 =      200j
z2 =     -50j
z3 = 200
z4 =      400j
z5 =     -25j
z6 = 400

u_1 = (21.176-4.706j)
u_2 = (32.006-74.417j)
u_3 = (60.694-189.99j)

I_1 = (-0.651-0.946j)
I_2 = (-0.311-0.574j)
I_3 = (-0.34-0.372j)
I_4 = (0.463+0.099j)
I_5 = (-0.188-0.847j)
I_6 = (0.152-0.475j)

# Теорема Нортона
# У меня Z4 поэтому все строится по ней

# Метод контурных токов без Z4
con = 1
Ixx_arr = []
for i in np.linalg.solve(np.array([
    #   I11      I22       I33
    [z1+z3+z5,    z1,       z5   ],
    [   z1,      z1+z2,      0   ],
    [   z5,        0,      z5+z6 ]
    ]), np.array([
    # =
            E1 - E3,
            E1 + E2,
               0
    ])):
    res = complex(i.round(3))
    print(f"I_{con}{con} = {res}")
    Ixx_arr.append(res)
    con+=1

I11 = Ixx_arr[0]
I22 = Ixx_arr[1]
I33 = Ixx_arr[2]

J   = np.round(I33 - I22, 3)
print(f"J_э = {J}")

# Функция подсчета треугольник --> звезда вводите z1 z2 z3 получаете z12 z23 z31
def triangleToStar(z1, z2, z3):
    z12 = z1*z2/(z1+z2+z3)
    z23 = z2*z3/(z1+z2+z3)
    z31 = z3*z1/(z1+z2+z3)
    return (z12, z23, z31)

# Функция подсчета последовательного соединения
def sequentially(z1, z2):
    return (z1+z2)

# Функция подсчета парралельного соединения
def collateral(z1, z2):
    return (z1*z2)/(z1+z2)

z13, z35, z15 = triangleToStar(z1, z3, z5)
z356          = sequentially  (z35, z6)
z123          = sequentially  (z13, z2)
z123356       = collateral    (z123, z356)
Z    = np.round(sequentially  (z123356, z15), 3)

I4_nort = np.round(J*Z/(z4+Z), 3)

print(f"Z_э = {Z}")
print(f"{I4_nort} должно быть равно {I4}")