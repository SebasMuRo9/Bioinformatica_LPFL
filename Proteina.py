class Proteina: # Clase para representar una proteína con sus atributos relacionados con Pfam
    def __init__(self, id_uniprot, familia=None, accesion_pfam=None, evalue=None, score=None):
        self.id_uniprot = id_uniprot
        self.familia = familia
        self.accesion_pfam = accesion_pfam
        self.evalue = evalue
        self.score = score

    def mostrar(self): # Método para mostrar la información de la proteína
        print("ID UniProt:", self.id_uniprot)
        print("Familia Pfam:", self.familia)
        print("Accesión Pfam:", self.accesion_pfam)
        print("E-value:", self.evalue)
        print("Score:", self.score)