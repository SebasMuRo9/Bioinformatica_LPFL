# Pipeline Bioinformática - Identificación de familias pfam
Lógica de Programación y Fundamentos de Linux

Este repositorio tiene como objetivo identificar a qué familias de proteínas de Pfam pertenecen un conjunto de proteínas d einterés obtenidas desde UniPrtot

Se utiliza la base de datos Pfam 38.2 y el programa HMMER, específicamente la herramiente hmmscan, la cual permite comparar secuencias de proteínas en formato FASTA contra modelos ocultos de Markov, tambien conocidos como perfiles HMM

Se han separado en varios archivos las etapas prinicpales del proceso: descarga de la base de datos Pfam, descarga de proteínas desde UniProt, ejecución de HMMER y lectura de resultados con Python

# Herramientas utilizadas

Para ejecutar este pipeline se utilizaron las siguientes herramientas:

Ubuntu / WSL
Visual Studio Code
Git y GitHub
Python 3
HMMER
wget
Base de datos Pfam 38.2
UniProt

# Descripción de los archivos principales
Download_Pfam.sh: script encargado de descargar la base de datos Pfam, crear una versión reducida y prepararla con hmmpress.
Download_famUniProt.sh: script encargado de descargar las secuencias de proteínas desde UniProt usando los identificadores guardados en ids_uniprot.txt.
leer_resultados.py: script en Python que lee el archivo de resultados generado por hmmscan.
proteina.py: archivo que contiene una clase para representar la información básica de una proteína.
ids_uniprot.txt: archivo con los identificadores UniProt de las proteínas de interés.
familias_pfam.txt: archivo con las familias Pfam de interés.
.gitignore: archivo usado para evitar subir a GitHub bases de datos, resultados y archivos pesados.

# Archivos que no se suben al repositorio

Algunos archivos generados durante la ejecución del pipeline no se suben a GitHub porque son pesados o son archivos de resultados. Estos archivos se ignoran mediante .gitignore.

Entre ellos se encuentran:

pfam/
famUniProt/
*.hmm
*.hmm.gz
*.h3f
*.h3i
*.h3m
*.h3p
*.ssi
*.tbl
__pycache__/

Esto permite que el repositorio solo contenga los códigos necesarios para reproducir el pipeline.

# Paso 1: descarga de proteínas desde UniProt

El segundo paso consiste en descargar las secuencias de proteínas desde UniProt. Para esto se utiliza el archivo ids_uniprot.txt, donde cada línea contiene un identificador UniProt.

Ejemplo:

P00533
P35968
P17948

La descarga se ejecuta con:

bash Download_famUniProt.sh

Este script genera un archivo FASTA con todas las proteínas descargadas:

famUniProt/secuencias_uniprot.fasta

# Paso 2: descarga y preparación de Pfam

El primer paso consiste en descargar la base de datos Pfam desde el servidor oficial de EBI:

https://ftp.ebi.ac.uk/pub/databases/Pfam/releases/Pfam38.2/

Este proceso se realiza con el script:

bash Download_Pfam.sh

El script descarga el archivo Pfam-A.hmm.gz, lo descomprime, crea un archivo reducido llamado Pfam_reducido.hmm y luego lo prepara con hmmpress.

Como resultado, se generan archivos necesarios para que HMMER pueda usar la base de datos:

Pfam_reducido.hmm
Pfam_reducido.hmm.h3f
Pfam_reducido.hmm.h3i
Pfam_reducido.hmm.h3m
Pfam_reducido.hmm.h3p

Después de preparar Pfam y descargar las proteínas, se ejecuta hmmscan para comparar las secuencias de UniProt contra las familias Pfam.

El comando utilizado es:

hmmscan --tblout resultados_pfam.tbl pfam/Pfam_reducido.hmm famUniProt/secuencias_uniprot.fasta

Este comando genera el archivo:

resultados_pfam.tbl

# Paso 3: lectura de resultados con Python

El archivo resultados_pfam.tbl se analiza con el script:

python3 leer_resultados.py

Este script lee el archivo de resultados, ignora las líneas de comentarios y extrae la información más importante de cada coincidencia encontrada.

Los datos principales que se extraen son:

Familia Pfam
Accesión Pfam
Proteína
E-value
Score

# Clase Proteina

Como parte del pipeline se creó una clase en Python para representar la información básica de una proteína.

La clase permite almacenar datos como:

Identificador UniProt
Familia Pfam asociada
Accesión de la familia Pfam
E-value
Score

Esta clase ayuda a organizar mejor la información obtenida durante el análisis y permite aplicar conceptos básicos de programación orientada a objetos.
