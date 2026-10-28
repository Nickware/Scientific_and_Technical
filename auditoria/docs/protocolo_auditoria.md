# PROTOCOLO GENERAL DE AUDITORÍA TÉCNICA DE SOFTWARE

**Identificador:** PA-001  
**Versión:** 0.1  
**Estado:** Borrador  
**Fecha:** [AAAA-MM-DD]

## 1. Introducción

El presente protocolo establece los principios, criterios y procedimientos para realizar auditorías técnicas de repositorios de software.

Su finalidad es proporcionar una metodología sistemática, reproducible y documentada que permita evaluar la estructura, calidad, implementación, documentación y confiabilidad de proyectos computacionales.

El protocolo puede aplicarse a proyectos de desarrollo de software, simulación numérica, análisis de datos, modelamiento matemático y computación científica.

## 2. Objetivos

### 2.1 Objetivo general

Establecer una metodología estandarizada para evaluar repositorios de software mediante la recopilación de evidencias, el análisis técnico y la documentación de hallazgos.

### 2.2 Objetivos específicos

- Evaluar la organización y estructura del repositorio.
- Examinar la implementación computacional.
- Identificar dependencias y requisitos.
- Evaluar la documentación.
- Analizar las pruebas y mecanismos de validación.
- Examinar la reproducibilidad.
- Evaluar la coherencia matemática y científica cuando corresponda.
- Proponer recomendaciones fundamentadas en evidencias.

## 3. Referentes metodológicos

El protocolo toma como referencia principios y prácticas de auditoría y calidad de software asociados con:

- ISO 19011: directrices para auditorías de sistemas de gestión.
- ISO/IEC 25010: modelos de calidad de productos de software.
- ISO/IEC/IEEE 29119: ingeniería de pruebas de software.
- ISO/IEC/IEEE 12207: procesos del ciclo de vida del software.

Adicionalmente, incorpora criterios de evaluación científica y matemática para proyectos de computación científica.

**Nota:** este protocolo es una metodología propia inspirada en referentes técnicos. Su utilización no implica certificación ni declaración de conformidad con las normas mencionadas.

## 4. Principios de auditoría

### 4.1 Objetividad

Las conclusiones deben fundamentarse en evidencias verificables.

### 4.2 Trazabilidad

Cada hallazgo debe estar relacionado con archivos, líneas de código, resultados o documentación específica.

### 4.3 Reproducibilidad

El procedimiento debe permitir que otra persona pueda repetir la auditoría bajo condiciones equivalentes.

### 4.4 Integridad

La auditoría debe preservar el estado original del repositorio.

### 4.5 Transparencia

Las limitaciones, supuestos y procedimientos utilizados deben quedar documentados.

### 4.6 Separación entre diagnóstico y corrección

La auditoría identifica problemas y propone soluciones, pero no modifica automáticamente el código fuente evaluado.

## 5. Dimensiones de evaluación

### D1. Organización y arquitectura

Evalúa:
- Estructura de directorios.
- Organización modular.
- Separación de responsabilidades.
- Convenciones de nombres.
- Organización de datos y resultados.

### D2. Calidad de implementación

Evalúa:
- Claridad del código.
- Modularidad.
- Manejo de errores.
- Eficiencia computacional.
- Mantenibilidad.
- Uso apropiado de bibliotecas.

### D3. Dependencias y entorno

Evalúa:
- Bibliotecas utilizadas.
- Versiones.
- Archivos de configuración.
- Requisitos de instalación.
- Compatibilidad del entorno.

### D4. Documentación

Evalúa:
- README.
- Instrucciones de instalación.
- Documentación de funciones.
- Descripción de algoritmos.
- Ejemplos de ejecución.
- Limitaciones conocidas.

### D5. Pruebas y validación

Evalúa:
- Pruebas unitarias.
- Pruebas de integración.
- Casos de prueba.
- Validación de resultados.
- Comparación con referencias conocidas.

### D6. Reproducibilidad

Evalúa:
- Disponibilidad de datos.
- Configuraciones.
- Semillas aleatorias.
- Registro de versiones.
- Procedimientos de ejecución.
- Trazabilidad de resultados.

### D7. Validez matemática y científica

Evalúa, cuando corresponda:
- Coherencia conceptual.
- Fundamentos matemáticos.
- Consistencia dimensional.
- Hipótesis y aproximaciones.
- Correspondencia entre modelo y código.
- Interpretación de resultados.
- Limitaciones científicas.

## 6. Niveles de auditoría

### Nivel 1. Auditoría exploratoria

Identifica la estructura general y las características del repositorio.

### Nivel 2. Auditoría técnica

Examina implementación, dependencias, documentación, pruebas y reproducibilidad.

### Nivel 3. Auditoría especializada

Incorpora evaluaciones matemáticas, científicas, numéricas y algorítmicas.

Los niveles son acumulativos: una auditoría especializada debe considerar los aspectos estructurales y técnicos.

## 7. Procedimiento de auditoría

### Fase 1. Reconocimiento

- Identificar el repositorio.
- Registrar rama y commit.
- Inventariar archivos.
- Identificar lenguajes y tecnologías.
- Reconocer la estructura general.

### Fase 2. Evaluación estructural

- Examinar la organización.
- Identificar módulos.
- Reconocer componentes principales.
- Identificar archivos de configuración.

### Fase 3. Evaluación técnica

- Examinar implementación.
- Identificar dependencias.
- Revisar documentación.
- Examinar pruebas.
- Evaluar reproducibilidad.

### Fase 4. Evaluación especializada

Cuando corresponda:

- Examinar modelos matemáticos.
- Revisar fundamentos científicos.
- Analizar algoritmos numéricos.
- Contrastar resultados.
- Identificar supuestos y limitaciones.

### Fase 5. Consolidación

- Clasificar hallazgos.
- Establecer prioridades.
- Formular recomendaciones.
- Elaborar el informe final.

## 8. Clasificación de hallazgos

Los hallazgos se clasifican por categoría:

| Código | Categoría |
|---|---|
| H-ARQ | Arquitectura y organización |
| H-IMP | Implementación |
| H-DEP | Dependencias |
| H-DOC | Documentación |
| H-PRU | Pruebas y validación |
| H-REP | Reproducibilidad |
| H-MAT | Fundamentos matemáticos |
| H-CIE | Validez científica |

### Prioridad

- Crítica.
- Alta.
- Media.
- Baja.

Cada hallazgo debe incluir descripción, evidencia, impacto y recomendación.

## 9. Evidencias

Se consideran evidencias válidas:

- Archivos del repositorio.
- Fragmentos de código.
- Resultados de ejecución autorizada.
- Registros de pruebas.
- Documentación.
- Archivos de configuración.
- Resultados de análisis estático.

Las observaciones que no puedan verificarse deben identificarse expresamente como hipótesis o aspectos pendientes de comprobación.

## 10. Reglas de seguridad y preservación

- No modificar el código fuente durante la auditoría.
- No ejecutar automáticamente código del repositorio evaluado.
- No exponer contraseñas, tokens ni información sensible.
- Excluir entornos virtuales y dependencias descargadas de las métricas generales.
- Registrar las herramientas utilizadas.
- Mantener identificado el commit evaluado.

## 11. Entregables

Una auditoría puede producir:

1. Informe ejecutivo.
2. Inventario del repositorio.
3. Evaluación estructural.
4. Evaluación técnica.
5. Evaluación especializada.
6. Matriz de hallazgos.
7. Recomendaciones.
8. Informe consolidado en Markdown o PDF.

## 12. Control de versiones del protocolo

| Versión | Fecha | Descripción |
|---|---|---|
| 0.1 | [AAAA-MM-DD] | Primera propuesta metodológica |
| 0.2 | [AAAA-MM-DD] | Ajustes de dimensiones y criterios |
| 1.0 | [AAAA-MM-DD] | Primera versión consolidada |