# Page-Rank
Page Rank algorithms implemented using  Numerical Methods.

Iuga, Florin-Eugen, 312CA

Project 1 Numerical Methods - PageRank


Voi descrie fiecare functie in parte.

  Functia Iterative(): 

  ->Incep prin citirea datelor din fisierul input. Astfel, folosesc
  functia strtok() pentru a imparti sirul de caractere in tokeni.
  In continuare, creez matricea de adiacenta in functie de 
  link-urile dintre pagini. Totodata, fac vectorul care contine
  iesirile(link-urile) fiecarei pagini. Am initializat vectorul
  initial de PageRank, pr_init, cu 1/N, fiind distribuit in mod egal.
  Apoi, implementez algoritmul Iterative indicat de cerinta problemei,
  calculand la fiecare iteratie noul PageRank. Algoritmul se opreste
  cand se atinge acuratetea dorita pentru valori.

  Functia Algebraic():

  ->Incep tot prin citirea datelor din fisier. Fac initializarile si creez
  matricea unitate, respectiv matricea de adicenta. Apoi, implementez algoritmul
  Algebraic astfel: calculez matricea M in functie de link-urile de iesire
  ale fiecarei pagini, iar ulterior, folosesc algoritmul din cerinta care
  calculeaza vectorul de pageRank. Inversa o aflu utilizand functia GramSchmidt().

  Functia GramSchmidt():

  ->Foloseste GramSchmidt modificat pentru a intoarce inversa matricei data ca 
  parametru, concatenand fiecare vector x aflat prin functia SST() la matricea
  rezultat (adica inversa).

  Functia Apartenenta():

  ->Calculeaza gradul de apartenenta al paginii a carui PageRank este x la multimea
  paginilor importante. Valorile a si b le-am aflat (pe hartie) prin conditia de
  continuitate a functiei respective.

  Functia SST():

  ->Intoarce vectorul rezultat x al sistemului superior triunghiular (este folosita in functia
  GramSchmidt()).

  Functia PageRank():
  
  ->Apeleaza functiile implementate mai sus si scrie fisierele de iesire in formatul
  dorit.
