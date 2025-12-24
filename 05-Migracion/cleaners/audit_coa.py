import pandas as pd
import os
import sys

# CONFIGURACIÓN
# Ruta relativa al archivo maestro
FILE_PATH = '02-Master-Data/COA-Maestro/master_coa.csv'

def audit_coa():
    print(f"🕵️  Iniciando Auditoría del Catálogo: {FILE_PATH}")
    
    # 1. Verificar existencia
    if not os.path.exists(FILE_PATH):
        print(f"❌ ERROR CRÍTICO: No se encuentra el archivo en {FILE_PATH}")
        return

    try:
        # Intentamos leer el CSV. Asumimos codificación UTF-8 o Latin-1
        try:
            df = pd.read_csv(FILE_PATH, encoding='utf-8')
        except UnicodeDecodeError:
            df = pd.read_csv(FILE_PATH, encoding='latin-1')
            print("⚠️  Aviso: Archivo leído con codificación 'latin-1' (Excel estándar). Recomendado pasar a UTF-8.")

        print(f"📊 Filas detectadas: {len(df)}")
        print(f"📋 Columnas detectadas: {list(df.columns)}")

        # 2. Normalización de Columnas (Limpiar espacios en nombres de cabecera)
        df.columns = [c.strip().lower().replace(' ', '_') for c in df.columns]
        
        # 3. Validaciones de Integridad
        errors = []

        # A. Chequeo de columnas obligatorias mínimas para Zoho
        required_cols = ['account_name', 'account_code', 'account_type']
        for col in required_cols:
            if col not in df.columns:
                errors.append(f"Falta columna obligatoria: '{col}' (o nombre similar)")

        # Si faltan columnas clave, abortamos chequeos profundos
        if errors:
            for e in errors: print(f"❌ {e}")
            return

        # B. Chequeo de Duplicados en Códigos
        duplicates = df[df.duplicated('account_code', keep=False)]
        if not duplicates.empty:
            print("\n❌ ALERTA: Códigos de Cuenta Duplicados encontrados:")
            print(duplicates[['account_code', 'account_name']])
            errors.append("Existen códigos de cuenta duplicados.")
        else:
            print("✅ No hay códigos duplicados.")

        # C. Chequeo de Nombres Vacíos
        empty_names = df[df['account_name'].isna() | (df['account_name'] == '')]
        if not empty_names.empty:
            print(f"\n❌ ALERTA: {len(empty_names)} cuentas no tienen nombre.")
            errors.append("Existen cuentas sin nombre.")

        # RESULTADO FINAL
        print("-" * 30)
        if not errors:
            print("✅ EL CATÁLOGO PARECE SANO Y LISTO PARA PROCESAR.")
            print("   Sugerencia: Haz un commit de este archivo CSV validado.")
        else:
            print("⚠️  SE ENCONTRARON ERRORES. NO SUBIR A ZOHO AÚN.")
            print("   Corrige el CSV original y vuelve a correr este script.")

    except Exception as e:
        print(f"❌ Error fatal leyendo el archivo: {e}")

if __name__ == "__main__":
    audit_coa()