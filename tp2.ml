(*TP2-Listes, Fonctions sur listes*)
(*EXO1*)


let rec integers n = 
  match n with 
  | 0-> [0] 
  | n -> (integers(n-1)) @ [n] ;;


let rec integers2 z =
  let rec aux n = match n with
    |0 -> [0]
    |n -> n :: (aux(n-1))
  in List.rev (aux z);;


let rec integers3 n =
  
  match n with 
  | 0-> [0] 
  | n -> n :: integers3 (n-1) ;;



(*EXO2*)  
  
let  rec size l = 
  match l with 
  | [] -> 0
  | e::t -> 1 + (size t) ;;


let three_or_more l = 
  if size l >= 3 then true 
  else false;;




let last l =
  match l with 
  |[] -> failwith ("liste vide")
  |[e] -> e
  | l -> List.hd (List.rev(l)) ;;



 
let rec sum l =
  let rec sum l acc = match l with
    |[] -> acc
    |e::t -> sum t (acc+e)
  in sum l 0;;

 
let  find  e l =
  match l with 
  |[] -> failwith " liste vide" 
  |d::f -> if d= e then true else false;;


let rec nth  n l =
  match  l with
  | [] -> failwith "liste vide"
  | d::f< -> if n = 0 then d else nth (n-1) f ;;



let  is_increasing l =
  match l with
    | [] -> failwith " liste vide " 
    | d::f -> if d < List.hd (f)  then true else false ;;


let rec max_list l =
  match l with 
    |[] -> 0 
    |[x] -> x 
    | l -> if (is_increasing l) then last l 
          else if List.hd(l) < List.hd (List.tl(l)) then max_list (List.tl(l)) 
          else List.hd(l);;

(*EXO3*)

let list_copy l = match l with 
  |[] -> []
  |[x] -> [x]
  |x::y -> x:: y ;;


let rec reverse l = match l with 
  |[] -> [] 
  |[x] -> [x] 
  | x::y ->  reverse y @ [x] ;;


let rec flatten_list l = match l with 
  |[] -> []
  |x::y -> x @flatten_list y ;;


let rec without_duplicates m = match m with 
  |[] -> []
  |x::y::z -> if  x==y then y::(without_duplicates z) else without_duplicates (y::z)
  |_::_ ->failwith "liste vide";;
 
  
(*EXO4*)
let rec filter f l = match l with 
  |[]-> failwith " liste vide" 
  | x::y ->  if (f x ) then x::(filter f y) else filter f y ;;
   
   

let  rec includes e l = match l with 
  |[]-> false
  |x::y -> if e == x then true 
          else includes e y ;;



let  rec including l1 l2 = match l1,l2 with 
  |[],[] -> false 
  |(x::y),(e::f) -> if x==e then true else including y f 
  |_,_ -> failwith "liste vide" ;;
    


let  rec excludes e l = match l with 
  |[]-> true
  |x::y -> if e == x then false 
          else includes e y ;;

      
let  rec excluding l1 l2 = match l1,l2 with 
  |[],[] -> true
  |(x::y),(e::f) -> if x==e then false else including y f 
  |_,_ -> failwith "liste vide" ;;
 

let rec zip l1 l2 = match l1,l2 with 
  |[],[] -> [] 
  |x::y, e::f-> (x,e)::zip y f
  |_,_ -> failwith "liste vide" ;;
 

(*EXO5*)
(* le résultat de l'appel: 
[1; 2; 3; 4] |> List.filter (fun x -> x mod 2 = 0) ;;
- : int list = [2; 4] 
*)
 
   

let reverse l =
  let rec aux l1 res = match l1 with
    |[] -> res
    |d::q -> aux f (d::res)
  in aux l [];;
    
     
let rec reverse_pair l =
  match l with 
  |[] -> []
  | x::y -> if x mod 2 = 0 then renverse  (x::pair_inverse y)  else renverse(pair_inverse y );;




let impaire l =
  let rec nb l cpt= match l with 
    | [] -> cpt
    |x::y-> if x mod 2 !=0 then nb y cpt+1  else nb y cpt
  in nb l 0 ;;
              

let rec carre l = match l with 
  |[] -> []
  |x::y-> if  x mod 2 != 0 then (x*x)::(carre y) 
          else carre y;;

(*EXO6*)           
let rec split l=match l with
  |[]->[],[]
  |a::[]->l,[]
  |a::b::c->let (l1,l2)=split c in a::l1,b::l2;;


let rec merge l1 l2=
  match l1,l2 with
  |[],_->l2;
  |_,[]->l1;
  |d1::f1,d2::f2->if d1<d2 then d1::(merge f1 l2)
                  else d2::(merge l1 f2);;

let rec fusion_sort l= match l with
  |[]->[];
  |a::[]->l;
  |_ ->begin
        let (l1,l2)=split l in
        merge(fusion_sort(l1)) (fusion_sort(l2));
      end;;

