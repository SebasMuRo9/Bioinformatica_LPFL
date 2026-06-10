archivo = "resultados_pfam.tbl"

resultados = []

with open(archivo, "r") as f:
    for linea in f:
        if linea.startswith("#"):
            continue

        partes = linea.split()

        if len(partes) > 0:
            familia = partes[0]
            accesion_familia = partes[1]
            proteina = partes[2]
            evalue = partes[4]
            score = partes[5]

            resultados.append([familia, accesion_familia, proteina, evalue, score])

print("Número de resultados encontrados:", len(resultados))

for resultado in resultados:
    print(resultado)