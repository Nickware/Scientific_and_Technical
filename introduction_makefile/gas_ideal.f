C     Programa Fortran 77: Gas Ideal (P vs T)
C     Genera datos de Presion vs Temperatura y los guarda en 'datos.dat'

      PROGRAM GAS_IDEAL
      IMPLICIT NONE

      REAL R, N, V, T, P
      INTEGER I, NT
      PARAMETER (NT = 50)   ! Número de puntos
      REAL T_MIN, T_MAX, DT

C     Constantes
      R = 0.082057          ! L·atm/(mol·K)
      N = 1.0               ! moles
      V = 22.4              ! litros (ej: volumen molar a CNPT)

C     Rango de temperaturas (en Kelvin)
      T_MIN = 100.0
      T_MAX = 500.0
      DT = (T_MAX - T_MIN) / REAL(NT - 1)

C     Abrir archivo de salida
      OPEN(UNIT=10, FILE='datos.dat', STATUS='UNKNOWN')

C     Generar datos
      DO 100 I = 1, NT
         T = T_MIN + REAL(I - 1) * DT
         P = N * R * T / V
         WRITE(10, *) T, P
 100  CONTINUE

      CLOSE(10)

      PRINT *, 'Datos guardados en datos.dat'
      END
