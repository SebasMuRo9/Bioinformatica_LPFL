
sudo apt update #actualiza la lista de paquetes disponibles en el sistema
sudo apt install hmmer -y #instala el software HMMER, que se utiliza para buscar

mkdir -p pfam #make directory, crea una carpeta llamada pfam y -p evita errores si la carpeta ya existe
cd pfam #entra a la carpeta pfam

# Borrar archivos anteriores de Pfam reducido
rm -f Pfam_reducido.hmm
rm -f Pfam_reducido.hmm.h3f
rm -f Pfam_reducido.hmm.h3i
rm -f Pfam_reducido.hmm.h3m
rm -f Pfam_reducido.hmm.h3p

# Borrar índice viejo del Pfam completo
rm -f Pfam-A.hmm.ssi

# Descargar Pfam solo si no existe
if [ ! -f Pfam-A.hmm ] && [ ! -f Pfam-A.hmm.gz ]
then
    wget https://ftp.ebi.ac.uk/pub/databases/Pfam/releases/Pfam38.2/Pfam-A.hmm.gz
fi

# Descomprimir solo si todavía existe el .gz
if [ -f Pfam-A.hmm.gz ]
then
    gunzip -f Pfam-A.hmm.gz
fi

# Borrar índice viejo del archivo grande
rm -f Pfam-A.hmm.ssi

 #awk para leer el archivo Pfam-A.hmm y crear un nuevo Pfam_reducido.hmm con las primeras 50 familias de Pfam
awk 'BEGIN{cont=0} {print} /^\/\// {cont++; if(cont==50) exit}' Pfam-A.hmm > Pfam_reducido.hmm

hmmpress Pfam_reducido.hmm #prepara el archivo Pfam_reducido.hmm para su uso con HMMER
echo "Pfam reducido creado correctamente."

cd .. #regresa al directorio anterior
#utiliza el comando hmmscan para buscar perfiles de HMM en el archivo Pfam_reducido.hmm contra las secuencias en secuencias_uniprot.fasta, y guarda los resultados en un archivo llamado resultados_pfam.tbl
hmmscan --tblout resultados_pfam.tbl pfam/Pfam_reducido.hmm famUniProt/secuencias_uniprot.fasta 
echo "hmmscan terminado correctamente."
