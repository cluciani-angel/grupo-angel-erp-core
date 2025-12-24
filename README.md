# Grupo Angel ERP - Core Architecture

Este repositorio contiene la "Fuente Única de Verdad" (SSOT) para la configuración contable y operativa de las empresas del Grupo Ángel en Zoho Books.

## 🏢 Estructura del Grupo
* **Holding:** Grupo Angel (Tesorería)
* **Casinos:** Golden Nuggets, Panama Sin Límites, etc. (Regulados por JCJ)
* **Servicios:** MF World (Logística y Servicios Internos)
* **Manufactura:** Luxury (Manufactura  y Maquila de Cervezas Atesanales)

## 🛡️ Reglas de Oro
1. **Nadie crea cuentas contables en Zoho** sin agregarlas primero al `master_coa.csv`.
2. **Datos Sensibles:** Nunca subir CSVs con datos financieros reales o claves API a este repositorio. Usar la carpeta `input_data` (está ignorada por git).
3. **Nomenclatura:** Seguir el estándar definido en `01-Gobernanza`.

## 🚀 Cómo iniciar
1. Instalar dependencias: `pip install -r 05-Migracion/requirements.txt`
2. Consultar el Manual Contable en `01-Gobernanza`.
