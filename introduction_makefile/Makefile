# Makefile para programa Fortran 77: Gas Ideal (T vs P)

# Compilador y banderas
FC = gfortran
FFLAGS = -O2

# Nombre del ejecutable
TARGET = gas_ideal

# Archivos
SRC = gas_ideal.f
DATA = datos.dat
PLOT_SCRIPT = plot.gp
PNG_OUTPUT = gas_ideal.png

# Regla por defecto
all: run plot

# Compilar
$(TARGET): $(SRC)
	$(FC) $(FFLAGS) -o $@ $<

# Ejecutar y generar datos
run: $(TARGET)
	./$(TARGET)

# Generar script de gnuplot si no existe
$(PLOT_SCRIPT):
	@echo "set terminal pngcairo enhanced font 'Helvetica,12'" > $(PLOT_SCRIPT)
	@echo "set output '$(PNG_OUTPUT)'" >> $(PLOT_SCRIPT)
	@echo "set xlabel 'Temperatura (K)'" >> $(PLOT_SCRIPT)
	@echo "set ylabel 'Presión (atm)'" >> $(PLOT_SCRIPT)
	@echo "set title 'Gas Ideal: P vs T (V y n constantes)'" >> $(PLOT_SCRIPT)
	@echo "plot '$(DATA)' with linespoints title 'P = nRT/V'" >> $(PLOT_SCRIPT)

# Graficar con gnuplot
plot: $(DATA) $(PLOT_SCRIPT)
	gnuplot $(PLOT_SCRIPT)

# Limpiar archivos generados
clean:
	rm -f $(TARGET) $(DATA) $(PLOT_SCRIPT) $(PNG_OUTPUT)

.PHONY: all run plot clean
