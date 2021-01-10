(* TP4*)
(*EXO1*)

type matL = Valeur of  int 
          |Binopp of string*matL*matL 
          |Unop of string*matL ;;


let e1 = Binopp("+", Valeur(3), Valeur(4));;
let e2 = Binopp("+",Valeur(1),Binopp("+",Valeur(2),Valeur(-3)));;


let rec evaluate_expr matL = match matL with 
  | Binopp ("+",a,b) -> (evaluate_expr a) + ( evaluate_expr b)
  | Binopp ("-",a,b) -> (evaluate_expr  a) - (evaluate_expr b)
  | Binopp ("/",a,b) -> (evaluate_expr a) / (evaluate_expr b)
  | Binopp ("*",a,b) -> (evaluate_expr a) * (evaluate_expr b)
  | Binopp (_,_,_ )-> failwith ("error") 
  | Unopp (_,_ )-> failwith ("error")
  | Unopp ("-",a) -> (evaluate_expr  a) 
  | Valeur (x) -> x ;;
  
(*EXO2*)
(*1*) 
let list l = [("+",(+));("-",(-));("*",( * ));("/",(/))];;

(*2*)
let rec operation op l = match l with 
  | [] -> failwith "error" 
  | x::y -> if fst (x) = op  then snd (x) else operation op y;;
  

(* 3*)


let rec evaluate_epx p l =  match p with 
  | Valeur x -> x
  | Binopp(op,a,b) -> (operation op l) (evaluate_expr a) (evaluate_expr b )
  | Unopp ("-",a) -> (evaluate_expr a )
  | Unopp (_,_)-> raise(failwith "error") ;;


(*4*)
let rec exp x n = match n with
  |0 ->1 
  |1-> n 
  |n -> x*(exp x (n-1)) ;;

(*EXO3*)
(*1*)
type expr = Valeur of int | Binaire of (string * expr * expr) | Unaire of (string * expr) | Var of string;;

type statement = Expression of expr | Affectation of (string * expr);;
(*3*)

let expression = Affectation ("a",Binaire("+",Valeur 6,Binaire("*",Valeur 4,Valeur 5)));;




(*4) On peut conserver ces informations dans une liste qui va contenir la variable "string" et sa valeur "int"

let environnement = [("a",int)] *)
(*5*)

(* Oui, on peut bien utiliser la fonction permettant la  recherche de la valeur d'une variable par son nom en échangeant l'opérateur par le nom de la variable et le modele par l'environnement*)


let environnement = [("a",5);("b",6)];;
let findValue a env = findFonction a env;;

let rec evaluate_expr2 l expr env= match expr with
| Valeur v -> v
| Binaire(op,a,b) ->  (findFonction op l) (evaluate_expr2 l a env) (evaluate_expr2 l b env)
| Unaire (op,a) when op = "-" -> -1*(evaluate_expr2 l a env)
| Unaire _ -> failwith ("negative operation expected")
| Var x -> findValue x env;;

(*6*)

let evaluate_Affectation v e env = (v,(evaluate_expr2 model e env))::env;;

let evaluate_expr3 e env= evaluate_expr2 model e env;;

let evaluate_statement statement env = match statement with
| Expression e -> (evaluate_expr3 e env,env)
| Affectation (s,e) -> (evaluate_expr3 e env,evaluate_Affectation s e env);;

(*EXO4*)

(*1*)
type statements = Statement of statement | Sequence of (statement * statements);;

(*2*)

let expression1 = Sequence(Affectation("a",Binaire("+",Valeur 4,Valeur 5)),Sequence(Affectation("b",Binaire("+",Var "a",Valeur 1)),Statement(Expression(Binaire("+",Var "a",Var "b")))));;

(*3*)

let rec evaluate_matL seq env = match seq with
| Statement s -> fst (evaluate_statement s env)
| Sequence(s,stmt) -> evaluate_matL stmt (snd (evaluate_statement s env));;




                    
