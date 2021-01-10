(*TP3*)
(*EXO1*)

 type ('n, 'f) bintree = Feuille of 'f | Noeud of 'n * ('n, 'f) bintree * ('n,'f) bintree;;
  (*test*)
  let f = Feuille ("f") 
  and a = Noeud("n1", Noeud("n2", Feuille("f21"), Feuille("f22")), 
             Noeud("n3", Feuille("f31"), Noeud("n4", Feuille("f41"),Feuille("f42"))));;

(*EXO2*)

(*calculer le nbr de noeuds*)
let rec bintree_count_nodes = function 
    |Feuille(_) -> 0
    |Noeud(_,g,d) -> 1 + (bintree_count_nodes g) + (bintree_count_nodes d);;

(*calculer le nbr de feuilles*)

let rec bintree_count_leaves = function
    |Feuille(_) -> 1
    |Noeud(_,g,d) -> (bintree_count_leaves g) + (bintree_count_leaves d);;