Download_famUniProt.sh
mkdir famUniProt #make directory, crea una carpeta llamada famUniProt
cd famUniProt #entra a la carpeta famUniProt
wget "https://rest.uniprot.org/uniprotkb/P00533.fasta" -O secuencias_uniprot.fasta #descarga la secuencia de la proteína con el ID P00533 desde UniProt y la guarda en un archivo llamado secuencias_uniprot.fasta
