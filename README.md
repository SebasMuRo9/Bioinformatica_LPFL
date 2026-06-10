# Pipeline Bioinformática - Identificación de familias pfam
Lógica de Programación y Fundamentos de Linux

Este repositorio tiene como objetivo identificar a qué familias de proteínas de Pfam pertenecen un conjunto de proteínas d einterés obtenidas desde UniPrtot

Se utiliza la base de datos Pfam 38.2 y el programa HMMER, específicamente la herramiente hmmscan, la cual permite comparar secuencias de proteínas en formato FASTA contra modelos ocultos de Markov, tambien conocidos como perfiles HMM

Se han separado en varios archivos las etapas prinicpales del proceso: descarga de la base de datos Pfam, descarga de proteínas desde UniProt, ejecución de HMMER y lectura de resultados con Python
