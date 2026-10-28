# AUDITORIA
### Herramienta modular para la auditoría técnica de repositorios de software

## 1. Descripción

`auditoria` es un proyecto orientado al desarrollo de una herramienta modular para realizar diagnósticos y auditorías técnicas de repositorios de software.

Su propósito es automatizar la recopilación de información estructural, identificar características del proyecto y generar informes técnicos que faciliten su evaluación.

La herramienta utiliza scripts Bash como mecanismo de orquestación y genera informes en formato Markdown, con posibilidad de producir documentos PDF mediante Pandoc y LaTeX.

## 2. Objetivos

- Automatizar el inventario de repositorios de software.
- Identificar lenguajes, dependencias y estructura de directorios.
- Examinar la documentación y la organización del proyecto.
- Identificar posibles problemas estructurales y técnicos.
- Facilitar la evaluación de reproducibilidad y mantenibilidad.
- Generar informes técnicos estandarizados.
- Proporcionar una metodología reutilizable para diferentes tipos de proyectos.

## 3. Alcance

La herramienta contempla dos componentes:

**Diagnóstico automatizado**
- Inventario de archivos y directorios.
- Identificación de lenguajes de programación.
- Reconocimiento de archivos de configuración.
- Identificación de dependencias.
- Inventario de documentación.
- Reconocimiento de pruebas.
- Recopilación de métricas estructurales.

**Auditoría técnica especializada**
- Evaluación conceptual.
- Evaluación matemática y científica.
- Revisión de algoritmos.
- Evaluación de implementación computacional.
- Revisión de resultados y validación.
- Evaluación de reproducibilidad.

La segunda componente requiere interpretación y evaluación especializada. No se considera completamente automatizable.

## 4. Arquitectura del proyecto

```text
auditoria/
├── README.md
├── LICENSE
├── .gitignore
├── auditoria.sh
├── config/
├── scripts/
├── templates/
├── docs/
├── latex/
└── output/
```

## 5. Requisitos

- Linux o macOS.
- Bash.
- Git.
- Herramientas estándar de Unix.

Herramientas opcionales:
- Pandoc.
- LaTeX.
- cloc.

## 6. Instalación

```bash
git clone https://github.com/Nickware/auditoria.git
cd auditoria
```

## 7. Uso

Clonar el repositorio que se desea evaluar:

```bash
git clone https://github.com/usuario/proyecto.git
```

Ejecutar la herramienta:

```bash
./auditoria.sh ../proyecto
```

Los informes generados se almacenarán en el directorio de salida configurado.

## 8. Informes

La herramienta podrá generar informes independientes:

- Resumen general.
- Inventario del repositorio.
- Arquitectura y organización.
- Lenguajes de programación.
- Dependencias.
- Documentación.
- Pruebas.
- Métricas.
- Hallazgos.
- Evaluación científica y matemática.
- Evaluación computacional.

## 9. Principios de funcionamiento

- Preservación del código fuente auditado.
- Trazabilidad de los hallazgos.
- Separación entre evidencia e interpretación.
- Reproducibilidad del diagnóstico.
- Transparencia sobre las limitaciones.
- No ejecución automática de código del repositorio evaluado.

## 10. Estado del proyecto

Proyecto en desarrollo.

| Versión | Alcance |
|---|---|
| v0.1 | Inventario y generación de informes Markdown |
| v0.2 | Análisis de Git, lenguajes y dependencias |
| v0.3 | Documentación, pruebas y métricas |
| v1.0 | Protocolo consolidado y generación PDF |