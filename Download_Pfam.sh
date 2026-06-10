
sudo apt update #actualiza la lista de paquetes disponibles en el sistema
sudo apt install hmmer -y #instala el software HMMER, que se utiliza para buscar

mkdir -p pfam #make directory, crea una carpeta llamada pfam y -p evita errores si la carpeta ya existe
cd pfam #entra a la carpeta pfam

wget https://ftp.ebi.ac.uk/pub/databases/Pfam/releases/Pfam38.2/Pfam-A.hmm.gz #descarga el archivo Pfam-A.hmm.gz

gunzip Pfam-A.hmm.gz #descomprime el archivo Pfam-A.hmm.gz

hmmfetch --index Pfam-A.hmm #crea un índice para el archivo Pfam-A.hmm, lo que permite buscar perfiles de HMM específicos dentro del archivo
hmmfetch -f Pfam-A.hmm ../familias_pfam.txt > Pfam_reducido.hmm #extrae las familias de Pfam especificadas en el archivo familias_pfam.txt y guarda en Pfam_reducido.hmm

hmmpress Pfam_reducido.hmm #prepara el archivo Pfam_reducido.hmm para su uso con HMMER, creando los archivos necesarios para la búsqueda de perfiles de HMM

#utiliza el comando hmmscan para buscar perfiles de HMM en el archivo Pfam_reducido.hmm contra las secuencias en secuencias_uniprot.fasta, y guarda los resultados en un archivo llamado resultados_pfam.tbl
hmmscan --tblout resultados_pfam.tbl pfam/Pfam_reducido.hmm famUniProt/secuencias_uniprot.fasta 
