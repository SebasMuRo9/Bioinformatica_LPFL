mkdir pfam #make directory, crea una carpeta llamada pfam
cd pfam #entra a la carpeta pfam
wget https://ftp.ebi.ac.uk/pub/databases/Pfam/releases/Pfam38.2/Pfam-A.hmm.gz #descarga el archivo Pfam-A.hmm.gz desde el servidor FTP de EBI
gunzip Pfam-A.hmm.gz #descomprime el archivo Pfam-A.hmm.gz
hmmpress Pfam-A.hmm #prepara el archivo Pfam-A.hmm para su uso con HMMER, creando los archivos necesarios para la búsqueda de perfiles de HMM
