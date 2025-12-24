#!/bin/bash

# ==========================================
# SCRIPT DE INICIALIZACIÓN - GRUPO ÁNGEL ERP
# Autor: Nexo Angel GEM (AI Consultant)
# ==========================================

echo "🚀 Iniciando despliegue de arquitectura Grupo Ángel ERP..."

# 1. CREACIÓN DE DIRECTORIOS (ARQUITECTURA SSOT)
echo "📂 Creando estructura de directorios..."

# Gobernanza y Documentación
mkdir -p 01-Gobernanza

# Datos Maestros (SSOT)
mkdir -p 02-Master-Data/COA-Maestro
mkdir -p 02-Master-Data/Items

# Entidades (Configuración Multi-Compañía)
mkdir -p 03-Entidades/01-Holdings/GrupoAngel_Treasury
mkdir -p 03-Entidades/02-Casinos/GoldenNuggets
mkdir -p 03-Entidades/02-Casinos/PanamaSinLimites
mkdir -p 03-Entidades/02-Casinos/MultiLineSlots
mkdir -p 03-Entidades/03-Casinos/Bannet
mkdir -p 03-Entidades/04-Servicios/MF_World
mkdir -p 03-Entidades/05-Manufactura/Luxury

# Automatización (Zoho Deluge & Scripts)
mkdir -p 04-Automatizacion/Workflows
mkdir -p 04-Automatizacion/CustomFunctions

# Migración y ETL (Python)
mkdir -p 05-Migracion/cleaners
mkdir -p 05-Migracion/mappers
mkdir -p 05-Migracion/input_data  # Carpeta para archivos crudos (será ignorada por git)
mkdir -p 05-Migracion/output_data # Carpeta para resultados (será ignorada por git)

# 2. CREACIÓN DE ARCHIVOS BASE Y DOCUMENTACIÓN
echo "📝 Generando archivos de documentación y configuración..."

# --- README.md ---
cat <<EOT > README.md
# Grupo Angel ERP - Core Architecture

Este repositorio contiene la "Fuente Única de Verdad" (SSOT) para la configuración contable y operativa de las empresas del Grupo Ángel en Zoho Books.

## 🏢 Estructura del Grupo
* **Holding:** Grupo Angel (Tesorería)
* **Casinos:** Golden Nuggets, Panama Sin Límites, etc. (Regulados por JCJ)
* **Servicios:** MF World (Logística y Servicios Internos)
* **Manufactura:** Luxury (Manufactura  y Maquila de Cervezas Atesanales)

## 🛡️ Reglas de Oro
1. **Nadie crea cuentas contables en Zoho** sin agregarlas primero al \`master_coa.csv\`.
2. **Datos Sensibles:** Nunca subir CSVs con datos financieros reales o claves API a este repositorio. Usar la carpeta \`input_data\` (está ignorada por git).
3. **Nomenclatura:** Seguir el estándar definido en \`01-Gobernanza\`.

## 🚀 Cómo iniciar
1. Instalar dependencias: \`pip install -r 05-Migracion/requirements.txt\`
2. Consultar el Manual Contable en \`01-Gobernanza\`.
EOT

# --- MANUALES ---
echo "# Políticas Contables - Grupo Ángel" > 01-Gobernanza/Manual-Contable.md
echo "1. El reconocimiento de ingresos de Casinos es neto (Cash In - Cash Out - Impuestos)." >> 01-Gobernanza/Manual-Contable.md

echo "# Diccionario de Datos" > 01-Gobernanza/Diccionario-Datos.md
echo "| Término | Definición | Contexto |" >> 01-Gobernanza/Diccionario-Datos.md
echo "|---------|------------|----------|" >> 01-Gobernanza/Diccionario-Datos.md
echo "| Win/Loss| Resultado neto de máquinas tragamonedas | Casinos |" >> 01-Gobernanza/Diccionario-Datos.md
echo "| RevShare| Participación de terceros (Pasivo, no gasto) | Partners |" >> 01-Gobernanza/Diccionario-Datos.md

# --- PLACEHOLDERS DE DATOS ---
touch 02-Master-Data/COA-Maestro/master_coa.csv
echo '{ "description": "Mapeo de IDs antiguos a nuevos" }' > 02-Master-Data/COA-Maestro/mapping_rules.json

# --- PYTHON REQUIREMENTS ---
cat <<EOT > 05-Migracion/requirements.txt
pandas==2.1.0
openpyxl==3.1.2
numpy==1.26.0
requests==2.31.0
EOT

# 3. SEGURIDAD (.gitignore)
echo "🔒 Configurando seguridad (.gitignore)..."

cat <<EOT > .gitignore
# --- Python ---
__pycache__/
*.py[cod]
*$py.class
.env
venv/

# --- Datos Sensibles (IMPORTANTE) ---
# Ignoramos todos los CSV por defecto para evitar subir contabilidad real por error
*.csv
*.xlsx
*.xls

# Pero permitimos los archivos maestros de estructura (excepciones)
!02-Master-Data/COA-Maestro/*.csv
!02-Master-Data/Items/*.csv

# Ignorar carpetas de trabajo temporal
05-Migracion/input_data/*
05-Migracion/output_data/*

# --- Sistema ---
.DS_Store
Thumbs.db
.vscode/
EOT

echo "✅ ¡Despliegue completado con éxito!"
echo "   Tu estructura de carpetas está lista para trabajar."
echo "   Siguiente paso: Carga tu catálogo en '02-Master-Data/COA-Maestro/master_coa.csv'"