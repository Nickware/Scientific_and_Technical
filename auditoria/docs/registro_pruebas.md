# REGISTRO DE PRUEBAS

**Identificador:** RP-001  
**Versión:** 0.1  
**Fecha:** 13 de noviembre de 2026  
**Proyecto:** auditoria  
**Estado:** Validación funcional inicial completada

---

## 1. Propósito

Este documento registra las pruebas funcionales realizadas sobre los componentes de la herramienta `auditoria`, con el propósito de conservar evidencia de su comportamiento, verificar el cumplimiento de los resultados esperados y facilitar la trazabilidad de las actividades de validación.

El registro permite identificar:

- Los escenarios evaluados.
- Las condiciones de ejecución.
- Los resultados esperados.
- Los resultados observados.
- El estado de cada prueba.
- Las observaciones y limitaciones identificadas.

Este documento se actualizará progresivamente a medida que se implementen y validen nuevos módulos.

## 2. Alcance

Esta primera versión comprende:

| Componente | Versión | Alcance evaluado |
|---|---|---|
| Orquestador `auditoria.sh` | 0.2.0 | Integración y gestión de resultados |
| Módulo 01 `01_inventario.sh` | 0.1.0 | Inventario estructural |
| Módulo 02 `02_git.sh` | 0.1.2 | Identificación y análisis de repositorios Git |

Las pruebas se realizaron sobre un entorno Linux, utilizando Bash, GNU Find y Git.

## 3. Criterios de evaluación

Se emplean los siguientes estados:

| Estado | Descripción |
|---|---|
| SUPERADA | El resultado observado coincide con el resultado esperado. |
| FALLIDA | El resultado observado no cumple el comportamiento esperado. |
| PENDIENTE | La prueba todavía no se ha ejecutado. |
| NO APLICABLE | El escenario no corresponde al alcance del componente. |

Una prueba superada acredita el comportamiento observado en el escenario evaluado, pero no implica una validación exhaustiva del componente.

## 4. Registro de pruebas del módulo 02

### 4.1. T1 – Repositorio Git convencional

**Objetivo:** verificar que el módulo identifica correctamente un repositorio Git y recupera su información general e histórica.

**Entorno de prueba:**

- Proyecto: `data_science/project_1`.
- Rama: `master`.
- Repositorio Git: `/home/nickthor/workspace/github/data_science`.

**Procedimiento:**

Ejecutar el módulo 02 sobre un proyecto perteneciente a un repositorio Git convencional.

**Resultado esperado:**

- Identificación del repositorio y su raíz.
- Recuperación de la rama activa.
- Identificación del último commit.
- Recuperación del historial.
- Identificación de los repositorios remotos.
- Generación del informe Markdown.

**Resultado observado:**

- Repositorio identificado correctamente.
- Rama `master`.
- HEAD activo.
- Estado limpio.
- 67 commits alcanzables desde HEAD.
- Historial de los últimos diez commits generado correctamente.
- Remoto `origin` identificado.
- Informe generado sin errores.

**Estado:** SUPERADA.

### 4.2. T2 – Directorio sin repositorio Git

**Objetivo:** verificar que la ausencia de Git se interpreta como una condición del proyecto y no como un error de ejecución.

**Entorno de prueba:**

`/tmp/prueba_sin_git`

**Procedimiento:**

Crear un directorio convencional sin inicializar Git y ejecutar el módulo 02.

**Resultado esperado:**

- Identificación de la ausencia de un repositorio Git.
- Clasificación del proyecto como `NO VERSIONADO`.
- Generación del informe.
- Código de salida 0.

**Resultado observado:**

El informe presentó:

`Estado: NO VERSIONADO`

También identificó la información que no estaba disponible:

- Rama activa.
- Historial de commits.
- Estado de cambios.
- Repositorios remotos.

La ejecución fue satisfactoria y el informe indicó que la ausencia de Git no constituye un error de ejecución.

**Estado:** SUPERADA.

### 4.3. T3 – Identificación de cambios locales

**Objetivo:** comprobar que el módulo diferencia correctamente los estados staged, unstaged y untracked.

**Entorno de prueba:**

`/tmp/prueba_git`

**Preparación del escenario:**

Se creó un repositorio Git con un commit inicial y posteriormente se introdujeron tres modificaciones:

| Archivo | Operación | Estado esperado |
|---|---|---|
| `staged.txt` | Creación y ejecución de `git add` | Staged |
| `README.md` | Modificación sin preparar | Unstaged |
| `untracked.txt` | Creación sin agregar a Git | Untracked |

**Verificación independiente:**

Se utilizó:

`git status --short`

La salida confirmó los tres estados esperados.

**Resultado esperado:**

El módulo debía identificar un elemento en cada categoría y generar el informe correspondiente.

**Resultado observado:**

| Tipo de cambio | Cantidad esperada | Cantidad obtenida |
|---|---:|---:|
| Staged | 1 | 1 |
| Unstaged | 1 | 1 |
| Untracked | 1 | 1 |
| Deleted | 0 | 0 |
| Renamed / Copied | 0 | 0 |
| Conflicts | 0 | 0 |

El módulo identificó correctamente la raíz del repositorio, la rama `master`, el commit inicial y la presencia de cambios pendientes.

**Estado:** SUPERADA.

### 4.4. T4 – Repositorio Git bare

**Objetivo:** comprobar que el módulo reconoce un repositorio bare y lo excluye del alcance de la versión actual.

**Entorno de prueba:**

`/tmp/auditoria_prueba_bare`

**Preparación:**

Se utilizó:

`git init --bare /tmp/auditoria_prueba_bare`

**Resultado esperado:**

- Identificación del repositorio bare.
- Rechazo del análisis por parte del módulo 02.
- Código de salida 4.

**Resultado observado:**

El módulo presentó los siguientes mensajes:

- Se identificó un repositorio bare.
- Los repositorios bare están fuera del alcance de esta versión.

El módulo terminó con código 4.

En la prueba de integración, el módulo 01 completó el inventario, el módulo 02 informó el error y el orquestador generó un resumen parcial con código de salida global 2.

**Estado:** SUPERADA.

### 4.5. T5 – Protección del directorio de salida

**Objetivo:** comprobar que el módulo impide generar los informes dentro del repositorio auditado.

**Entorno de prueba:**

Repositorio: `/tmp/prueba_git`

Directorio de salida propuesto:

`/tmp/prueba_git/informe_auditoria`

**Procedimiento:**

Ejecutar el módulo 02 indicando como directorio de salida una ubicación interna al repositorio.

**Resultado esperado:**

- Rechazo de la operación.
- Código de salida distinto de cero.
- Ausencia del directorio de salida.

**Resultado observado:**

El módulo presentó:

`[INFO] Repositorio Git identificado.`

`[ERROR] El directorio de salida no puede estar dentro del repositorio.`

Código de salida: 2.

La comprobación posterior confirmó:

`OK: el directorio de salida fue rechazado`

El directorio `informe_auditoria` no fue creado.

**Estado:** SUPERADA.

## 5. Registro de pruebas de integración

### 5.1. I1 – Ejecución satisfactoria del orquestador

**Objetivo:** comprobar que el orquestador ejecuta los módulos disponibles y consolida sus resultados.

**Entorno de prueba:**

Proyecto: `data_science/project_1`.

Orquestador: `auditoria.sh` v0.2.0.

**Resultado esperado:**

- Ejecución satisfactoria del módulo 01.
- Ejecución satisfactoria del módulo 02.
- Generación de los informes individuales.
- Generación del resumen general.
- Código de salida global 0.

**Resultado observado:**

Los dos módulos finalizaron correctamente.

Se generaron los siguientes archivos:

- `00_RESUMEN_GENERAL.md`
- `01_INVENTARIO.md`
- `02_AUDITORIA_GIT.md`

Se verificó que los tres archivos existieran y no estuvieran vacíos.

El resumen indicó estado general `COMPLETADA` y código de salida 0.

**Estado:** SUPERADA.

### 5.2. I2 – Manejo de errores y ejecución parcial

**Objetivo:** comprobar que el orquestador puede continuar cuando uno de los módulos no consigue completar su análisis.

**Entorno de prueba:**

Repositorio bare: `/tmp/auditoria_prueba_bare`.

Orquestador: `auditoria.sh` v0.2.0.

**Resultado esperado:**

- Módulo 01 completado.
- Módulo 02 rechazado con código 4.
- Generación del resumen general.
- Estado global parcial.
- Código de salida global 2.

**Resultado observado:**

| Componente | Resultado |
|---|---|
| Módulo 01 – Inventario | COMPLETADO |
| Módulo 02 – Git | ERROR, código 4 |
| Resumen general | Generado |
| Estado global | PARCIAL / CON ERRORES |
| Código de salida | 2 |

El orquestador continuó su ejecución después del fallo del módulo 02 y consolidó los resultados.

Durante las primeras ejecuciones se identificó una advertencia de GNU `find` en el módulo 01. Se corrigió la ubicación de `-mindepth` en las expresiones de búsqueda. La ejecución posterior se realizó sin dicha advertencia y conservó los resultados esperados.

**Estado:** SUPERADA.

## 6. Resumen general de resultados

| Identificador | Componente | Escenario | Estado |
|---|---|---|---|
| T1 | Módulo 02 | Repositorio Git convencional | SUPERADA |
| T2 | Módulo 02 | Directorio sin Git | SUPERADA |
| T3 | Módulo 02 | Cambios staged, unstaged y untracked | SUPERADA |
| T4 | Módulo 02 | Repositorio bare | SUPERADA |
| T5 | Módulo 02 | Protección del directorio de salida | SUPERADA |
| I1 | Orquestador | Integración satisfactoria | SUPERADA |
| I2 | Orquestador | Manejo de errores y ejecución parcial | SUPERADA |

**Resultado:** 7 escenarios superados de 7 escenarios registrados.

## 7. Observaciones y limitaciones

Las pruebas realizadas permiten verificar los comportamientos fundamentales del módulo 02 y la integración inicial de los módulos 01 y 02.

Sin embargo, no constituyen una validación exhaustiva de todas las condiciones posibles.

Se identifican los siguientes escenarios para futuras pruebas:

1. Archivos eliminados.
2. Archivos renombrados y copiados.
3. Conflictos durante operaciones de integración de ramas.
4. Repositorios con submódulos.
5. Repositorios con enlaces simbólicos.
6. Directorios con permisos restringidos.
7. Repositorios con historiales extensos.
8. Directorios de salida con rutas relativas y simbólicas.
9. Compatibilidad con diferentes versiones de Bash y Git.

También se reconoce que los contadores de estados de Git representan categorías de modificaciones y no necesariamente archivos únicos. Un mismo archivo puede presentar simultáneamente cambios staged y unstaged.

Las evidencias de esta versión corresponden a resultados observados durante las sesiones de prueba. No se adjuntan registros completos de terminal ni archivos de ejecución originales.

## 8. Conclusión

Las pruebas funcionales iniciales permiten considerar satisfactorio el comportamiento observado de los módulos 01 y 02, así como la integración implementada en `auditoria.sh` v0.2.0.

Se verificó que:

- El inventario estructural puede ejecutarse de manera independiente.
- El módulo Git reconoce repositorios convencionales y directorios sin versionamiento.
- Los principales estados de modificación local se identifican correctamente.
- Los repositorios bare se excluyen del alcance de la versión actual.
- El módulo protege el repositorio frente a la generación de informes dentro de su estructura.
- El orquestador integra los módulos y gestiona correctamente las ejecuciones parciales.

Con estos resultados se cierra la primera etapa de validación funcional.

La implementación de nuevos módulos deberá acompañarse de sus respectivas especificaciones funcionales, procedimientos de prueba y registro de resultados.

---

## 9. Control de versiones del documento

| Versión | Fecha | Descripción |
|---|---|---|
| 0.1 | 2026-11-13 | Registro inicial de pruebas funcionales de los módulos 01 y 02 y del orquestador. |