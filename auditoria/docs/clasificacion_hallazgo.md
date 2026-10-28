# CLASIFICACIÓN Y GESTIÓN DE HALLAZGOS

**Identificador:** CH-001  
**Versión:** 0.1  
**Estado:** Borrador  
**Documento asociado:** PROTOCOLO_AUDITORIA.md

---

## 1. Propósito

El presente documento establece los criterios para identificar, clasificar, priorizar y documentar los hallazgos obtenidos durante una auditoría técnica de repositorios de software.

Su finalidad es proporcionar un mecanismo uniforme de registro que permita:

- Identificar inequívocamente cada hallazgo.
- Clasificar los problemas según su naturaleza.
- Determinar su nivel de prioridad.
- Registrar las evidencias que sustentan cada observación.
- Establecer recomendaciones y acciones correctivas.
- Realizar seguimiento a los hallazgos durante posteriores auditorías.

La clasificación es independiente del lenguaje de programación, la arquitectura y el dominio científico o tecnológico del repositorio evaluado.

## 2. Definición de hallazgo

Se define como hallazgo cualquier condición, característica, inconsistencia, omisión o debilidad identificada durante el proceso de auditoría que tenga relevancia para los objetivos de evaluación.

Un hallazgo puede representar:

- Un incumplimiento de un criterio establecido.
- Una inconsistencia conceptual o técnica.
- Una deficiencia en la implementación.
- Una limitación de reproducibilidad.
- Una ausencia de documentación.
- Una oportunidad de mejora.

No toda observación constituye necesariamente un defecto. Por esta razón, los hallazgos deben distinguir entre problemas verificables, limitaciones conocidas, riesgos y oportunidades de mejora.

## 3. Sistema de identificación

Cada hallazgo tendrá un identificador único compuesto por un prefijo y un número consecutivo.

Formato:

`H-[CATEGORÍA]-[NÚMERO]`

Ejemplos:

- H-ARQ-001
- H-IMP-002
- H-MAT-003
- H-CIE-004

El identificador debe mantenerse durante todo el ciclo de vida del hallazgo, incluso cuando cambie su estado o prioridad.

Los números consecutivos se asignarán dentro de cada categoría.

## 4. Clasificación por categorías

Se establecen ocho categorías principales.

### 4.1 H-ARQ: Arquitectura y organización

Identifica problemas relacionados con la estructura general del repositorio y la organización de sus componentes.

Criterios de evaluación:

- Organización de directorios y archivos.
- Separación de responsabilidades.
- Modularidad.
- Acoplamiento entre componentes.
- Organización de datos y resultados.
- Convenciones de nombres.
- Coherencia entre arquitectura documentada e implementación.

Ejemplos:

- Código fuente mezclado con resultados experimentales sin una estructura definida.
- Componentes con responsabilidades superpuestas.
- Dependencias entre módulos que dificultan su mantenimiento.
- Organización inconsistente de los archivos.

### 4.2 H-IMP: Implementación computacional

Identifica problemas relacionados con la calidad y corrección de la implementación.

Criterios de evaluación:

- Corrección lógica.
- Estructuras de datos.
- Algoritmos.
- Manejo de errores.
- Eficiencia computacional.
- Modularidad del código.
- Legibilidad y mantenibilidad.
- Gestión de entradas y salidas.

Ejemplos:

- Algoritmos implementados de manera inconsistente con su descripción.
- Ausencia de validación de entradas.
- Errores en índices o condiciones de terminación.
- Repetición innecesaria de procedimientos.
- Manejo inadecuado de excepciones.

### 4.3 H-DEP: Dependencias y entorno

Identifica problemas relacionados con las bibliotecas, herramientas, versiones y condiciones necesarias para ejecutar el proyecto.

Criterios de evaluación:

- Declaración de dependencias.
- Versiones de bibliotecas.
- Archivos de configuración.
- Compatibilidad entre versiones.
- Requisitos de instalación.
- Dependencias externas.
- Gestión del entorno de ejecución.

Ejemplos:

- Bibliotecas utilizadas que no aparecen declaradas.
- Ausencia de versiones o restricciones de compatibilidad.
- Dependencias obsoletas.
- Instrucciones de instalación incompletas.

### 4.4 H-DOC: Documentación

Identifica deficiencias en la información que permite comprender, instalar, utilizar y mantener el proyecto.

Criterios de evaluación:

- README.
- Instrucciones de instalación.
- Descripción de módulos.
- Documentación de funciones.
- Descripción de algoritmos.
- Ejemplos de uso.
- Limitaciones conocidas.
- Referencias bibliográficas.

Ejemplos:

- README desactualizado.
- Funciones sin documentación suficiente.
- Instrucciones de ejecución incompletas.
- Ausencia de referencias para modelos o métodos utilizados.
- Diferencias entre la documentación y el comportamiento del código.

### 4.5 H-PRU: Pruebas y validación

Identifica problemas relacionados con la verificación del funcionamiento del software y la validación de sus resultados.

Criterios de evaluación:

- Pruebas unitarias.
- Pruebas de integración.
- Pruebas funcionales.
- Cobertura de casos relevantes.
- Validación de resultados.
- Comparación con soluciones de referencia.
- Tratamiento de condiciones límite.

Ejemplos:

- Ausencia de pruebas para funciones críticas.
- Resultados sin comparación con referencias conocidas.
- Casos límite no contemplados.
- Pruebas que no verifican las condiciones esperadas.

### 4.6 H-REP: Reproducibilidad

Identifica limitaciones que impiden o dificultan repetir los procedimientos y obtener resultados comparables.

Criterios de evaluación:

- Disponibilidad de datos.
- Registro de configuraciones.
- Semillas aleatorias.
- Versiones del entorno.
- Parámetros experimentales.
- Procedimientos de ejecución.
- Trazabilidad de resultados.
- Registro de experimentos.

Ejemplos:

- Datos de entrada no disponibles.
- Parámetros experimentales no documentados.
- Procesos aleatorios sin control o registro de semillas.
- Resultados que no pueden reconstruirse a partir del código disponible.

### 4.7 H-MAT: Fundamentos matemáticos y numéricos

Identifica problemas relacionados con la formulación matemática, los modelos, los métodos numéricos y las aproximaciones implementadas.

Criterios de evaluación:

- Coherencia de las ecuaciones.
- Consistencia dimensional.
- Condiciones iniciales y de frontera.
- Hipótesis y simplificaciones.
- Estabilidad numérica.
- Convergencia.
- Error de discretización.
- Correspondencia entre formulación matemática e implementación.

Ejemplos:

- Inconsistencia dimensional en una ecuación.
- Aplicación incorrecta de un método numérico.
- Ausencia de análisis de convergencia cuando resulta necesario.
- Condiciones de frontera incompatibles con el modelo.
- Aproximaciones que no se justifican.

### 4.8 H-CIE: Fundamentos y validez científica

Identifica problemas relacionados con la coherencia científica del proyecto y la interpretación de sus resultados.

Criterios de evaluación:

- Fundamentación teórica.
- Correspondencia entre modelo y fenómeno.
- Justificación de hipótesis.
- Coherencia metodológica.
- Validez de los resultados.
- Interpretación científica.
- Limitaciones del estudio.
- Correspondencia con literatura especializada.

Ejemplos:

- Conclusiones que exceden el alcance del modelo.
- Interpretación incorrecta de una variable física.
- Resultados sintéticos presentados como evidencia experimental.
- Ausencia de justificación científica para determinados supuestos.

## 5. Prioridad de los hallazgos

Cada hallazgo debe recibir un nivel de prioridad según su impacto sobre el proyecto.

### 5.1 Crítica

Compromete gravemente la validez, seguridad o funcionamiento del proyecto.

Ejemplos:

- Error que invalida los resultados principales.
- Vulnerabilidad crítica confirmada.
- Implementación que produce resultados fundamentalmente incorrectos.

### 5.2 Alta

Representa un problema significativo que requiere atención prioritaria.

Ejemplos:

- Algoritmo principal implementado incorrectamente.
- Dependencia esencial incompatible.
- Ausencia de validación de un componente central.

### 5.3 Media

Representa una deficiencia importante, pero no compromete necesariamente el funcionamiento global del proyecto.

Ejemplos:

- Documentación incompleta.
- Pruebas insuficientes en componentes secundarios.
- Organización que dificulta el mantenimiento.

### 5.4 Baja

Representa una oportunidad de mejora o una deficiencia menor.

Ejemplos:

- Convenciones de nombres inconsistentes.
- Comentarios insuficientes.
- Mejoras menores de organización.

La prioridad debe justificarse mediante el impacto observado o potencial. No debe asignarse exclusivamente por la categoría del hallazgo.

## 6. Tipología de observaciones

Para evitar confundir defectos con oportunidades de mejora, cada hallazgo deberá tener un tipo.

| Código | Tipo | Descripción |
|---|---|---|
| DEF | Defecto | Incumplimiento o comportamiento incorrecto verificable. |
| RIE | Riesgo | Condición que puede generar un problema futuro. |
| LIM | Limitación | Restricción conocida del proyecto o de su alcance. |
| OPM | Oportunidad de mejora | Aspecto susceptible de optimización. |
| OBS | Observación | Situación que requiere seguimiento o investigación adicional. |

Esta clasificación es independiente de la prioridad.

## 7. Registro de evidencias

Todo hallazgo debe sustentarse mediante evidencia verificable.

Las evidencias pueden incluir:

- Ruta de archivo.
- Número de línea.
- Fragmento de código.
- Resultado de ejecución autorizada.
- Registro de pruebas.
- Archivo de configuración.
- Documentación.
- Referencia bibliográfica.

Cada evidencia debe permitir localizar y comprobar la condición observada.

Cuando no exista evidencia suficiente, el hallazgo deberá registrarse como observación pendiente de verificación y no como defecto confirmado.

## 8. Estructura de registro

Cada hallazgo deberá documentarse utilizando la siguiente estructura:

### Identificación

- ID:
- Categoría:
- Tipo:
- Prioridad:
- Estado:

### Descripción

Explicación concreta del problema o condición identificada.

### Evidencia

Archivos, líneas, resultados o documentos que sustentan el hallazgo.

### Criterio de evaluación

Criterio del protocolo con el cual se relaciona el hallazgo.

### Impacto

Consecuencias reales o potenciales sobre el proyecto.

### Recomendación

Acción propuesta para corregir, mitigar o investigar el hallazgo.

### Verificación

Procedimiento necesario para comprobar que el hallazgo fue resuelto.

## 9. Estados de seguimiento

Cada hallazgo tendrá un estado que permita realizar seguimiento durante auditorías posteriores.

| Estado | Descripción |
|---|---|
| IDENTIFICADO | Hallazgo registrado inicialmente. |
| EN REVISIÓN | Evidencia o impacto pendiente de confirmación. |
| CONFIRMADO | Hallazgo verificado. |
| ACEPTADO | El responsable reconoce el hallazgo y decide conservarlo temporalmente. |
| EN CORRECCIÓN | Se están implementando acciones correctivas. |
| RESUELTO | Se implementó una solución. |
| VERIFICADO | La solución fue comprobada satisfactoriamente. |
| CERRADO | El ciclo de seguimiento ha finalizado. |
| DESCARTADO | Se determinó que no constituye un hallazgo válido. |

Un hallazgo no debe considerarse cerrado únicamente porque se haya propuesto una solución. Se requiere una verificación cuando la naturaleza del hallazgo lo permita.

## 10. Relación entre hallazgos y recomendaciones

Cada recomendación debe estar asociada con uno o varios hallazgos.

Formato sugerido:

`R-[NÚMERO]`

Ejemplos:

- R-001
- R-002
- R-003

Una recomendación debe incluir:

- Hallazgo asociado.
- Acción propuesta.
- Prioridad.
- Resultado esperado.
- Criterio de verificación.

## 11. Matriz consolidada de hallazgos

El informe general deberá incorporar una matriz con la siguiente estructura:

| ID | Categoría | Tipo | Descripción | Prioridad | Estado |
|---|---|---|---|---|---|
| H-IMP-001 | Implementación | DEF | [Descripción] | Alta | Confirmado |
| H-DOC-001 | Documentación | OPM | [Descripción] | Media | Identificado |
| H-REP-001 | Reproducibilidad | RIE | [Descripción] | Alta | En revisión |

La matriz constituye el índice general de los hallazgos y permite identificar rápidamente las áreas que requieren atención.

## 12. Consideraciones finales

La clasificación de hallazgos no pretende establecer una puntuación absoluta de calidad del software.

Su propósito es proporcionar un mecanismo estructurado para identificar y comunicar condiciones relevantes del proyecto.

La evaluación debe considerar el contexto, los objetivos y las características particulares de cada repositorio.

Los hallazgos deben fundamentarse en evidencias y sus prioridades deben responder al impacto técnico, científico u operativo identificado.

## 13. Control de versiones

| Versión | Fecha | Descripción |
|---|---|---|
| 0.1 | [AAAA-MM-DD] | Primera propuesta de clasificación y seguimiento. |
| 0.2 | [AAAA-MM-DD] | Ajustes de categorías, prioridades y estados. |
| 1.0 | [AAAA-MM-DD] | Primera versión consolidada. |