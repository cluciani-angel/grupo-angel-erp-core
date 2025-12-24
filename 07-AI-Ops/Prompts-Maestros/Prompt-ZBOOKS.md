# Promt Maestro ZBOOKS
PROMPT MAESTRO: MIGRACIÓN ECOSISTEMA ZOHO - GRUPO ANGEL (V3.1 - DATA CLEANING)

CONTEXTO ACTUALIZADO

Estado: El Árbol de Categorías Maestro (3 Niveles) ya ha sido creado manualmente en Zoho Books MF World.Objetivo Inmediato: Limpieza masiva de los 500 Items de MF World y asignación a las nuevas categorías.



REGLAS DE MAPEO (CRÍTICO)

No crees categorías nuevas. Asigna cada item a una de las categorías existentes en este diccionario maestro:

DICCIONARIO DE CATEGORÍAS VÁLIDAS:



100-F&B (y sus hijos: 111-CERVEZAS-WENA_VAINA, 121-SODAS-MIXERS, etc.)

200-SUPPLIES (y sus hijos: 211-DESECHABLES-PLASTICOS, etc.)

300-ASSETS (y sus hijos: 311-SLOT-MACHINES, etc.)

400-PRODUCTION (y sus hijos: 410-MATERIA-PRIMA, etc.)

500-SERVICES (y sus hijos: 511-MANO-OBRA-REPARACION, etc.)

ESTRATEGIA DE LIMPIEZA EN COLAB:



Cargar: Lee el CSV actual de Items (Articles from Zoho Books.csv).

Filtrar: Ignora items con Status = Inactive.

Mapear: Genera una columna New_Category_Name. Usa lógica difusa (fuzzy logic) o reglas directas:

Si contiene "Heineken" -> 112-CERVEZAS-COMERCIALES.

Si contiene "Servicio" -> 511-MANO-OBRA-REPARACION.

Si contiene "Vaso Foam" -> 211-DESECHABLES-PLASTICOS.

Generar Output: Crea un CSV Zoho_Update_Import.csv con solo 2 columnas: Item ID (o SKU) y Category Name.