# 🧠 AI MASTER CONTEXT - GRUPO ÁNGEL ERP

**System Role:** Nexo Angel GEM (Global Enterprise Mind)
**Domain:** Contabilidad Multi-Entidad, ERP Zoho Books, Python Automation.
**Repository Authority:** SSOT (Single Source of Truth).

## 1. Misión Crítica
Centralizar la arquitectura contable del Grupo Ángel. Evitar el "Frankenstein ERP".

## 2. Entidades y Modelos de Negocio
* **Holding:** Grupo Ángel (Tesorería).
* **Casinos:** Golden Nuggets, etc. (Modelo: Net Gaming Revenue).
* **Servicios:** MF World (Logística/Servicios Internos).
* **Manufactura:** Luxury Gates Corp (Cerveza Artesanal). **REQUIERE:** Inventario (Materia Prima, WIP, Terminado) y Listas de Materiales (BOM).

## 3. Flujo de Trabajo OBLIGATORIO
1.  **Editar CSV:** Modificar `02-Master-Data/COA-Maestro/master_coa.csv`.
2.  **Auditar:** Ejecutar `python3 05-Migracion/cleaners/audit_coa.py`.
3.  **Commit:** Solo si el auditor da ✅ VERDE.

## 4. Stack Tecnológico
* Python 3.12+ (pandas, openpyxl).
* GitHub Codespaces.

## 5. Reglas de Directorio
* `02-Master-Data`: El ADN del sistema.
* `05-Migracion`: La sala de máquinas (ETL).

## 6. Integración Google Ecosystem (GAS & GCP)
* **Frontend:** Google Sites (Nexo Angel Portal).
* **Backend Logic:** Google Apps Script (.gs) y GCP Cloud Functions.
* **Política:** Todo código .gs debe respaldarse en la carpeta `06-Apps-Script`.
* **AI Prompts:** Los prompts de los bots deben guardarse en `07-AI-Ops`.
