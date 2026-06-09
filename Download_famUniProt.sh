mkdir -p famUniProt #make directory, crea una carpeta llamada famUniProt para guardar las secuencias

rm -f famUniProt/secuencias_uniprot.fasta #elimina el archivo secuencias_uniprot.fasta si ya existe, evitando errores al descargar nuevas secuencias

while read id  #lee cada línea del archivo ids_uniprot.txt, que contiene los IDs de UniProt a descargar
do
    echo "Descargando: $id" #imprime un mensaje indicando el ID que se está descargando

    wget "https://rest.uniprot.org/uniprotkb/${id}.fasta" -O famUniProt/temp.fasta #descarga la secuencia en formato FASTA para el ID actual y la guarda temporalmente en temp.fasta

    if grep -q ">" famUniProt/temp.fasta #verifica si el archivo temp.fasta contiene una secuencia válida (buscando el símbolo ">" que indica el inicio de una secuencia FASTA)
    then
        cat famUniProt/temp.fasta >> famUniProt/secuencias_uniprot.fasta #si la secuencia es válida, se agrega al archivo secuencias_uniprot.fasta, acumulando todas las secuencias descargadas
        echo "" >> famUniProt/secuencias_uniprot.fasta #agrega una línea en blanco después de cada secuencia para mejorar la legibilidad del archivo final
        echo "Descarga exitosa: $id"  #imprime un mensaje indicando que la descarga fue exitosa para el ID actual
    else
        echo "No se pudo descargar: $id" #si el archivo temp.fasta no contiene una secuencia válida, se imprime un mensaje indicando que no se pudo descargar el ID actual
    fi #elimina el archivo temporal temp.fasta para evitar confusiones en la próxima iteración

done < ids_uniprot.txt #finaliza el ciclo, aquí se indica cual archivo va a leer

fi #elimina el archivo temporal temp.fasta para evitar confusiones en la próxima iteración

