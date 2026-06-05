mkdir pfam
cd pfam
wget ftp://ftp.ebi.ac.uk/pub/databases/Pfam/releases/Pfam35.0/Pfam-A.full.uniprot.gz
wget ftp://ftp.ebi.ac.uk/pub/databases/Pfam/releases/Pfam35.0/Pfam-A.full.uniprot.gz.md5
md5sum -c Pfam-A.full.uniprot.gz.md5
gunzip Pfam-A.full.uniprot.gz