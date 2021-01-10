(*TP1*)

(*EXO1*)
(*3*)
(*
2.0 -> float 

2,0 -> int *int
2;0 -> Warning : this expression should have type unit
a ->Unbound value a
’a’ ->char
"a" ->string
true -> bool
() -> unit
[] -> a list
 [1] -> int list
[1, true] ->(int * bool) list
[1;true] ->this expression has type bool but an expression was expected of type int 
*)

(*4*)
(*
a) 3, 4.9 -> int * float 
c) ["John"; "Mary"] ->  string list

d) ([true, false], "abc") ->bool list * string
*)
(*EXO2*)

let max a b = 
  if a < b then  b 
  else  a ;;

let min a b c = 
  if a<b && a<c then a 
  else if b<a && b<c then b 
  else c ;;

let pair a = 
  if a mod 2 = 0 then  print_int a 
  else print_string "odd" ;;



(* le code est faux *)


let f a  = 
  if a<10 then  print_string "small" 
  else  print_string "large" ;;

(*EXO3*)
let average x y z = (x +.  y +. z)/. 3.0;;



let impliess a b = 
  if a = true && b = false then false
  else if a = true && b = true then true 
  else false;;


(*3*)

(* Le type de fst est 'a * 'b -> 'a = <fun> *)

(* Le type de snd est 'a * 'b -> 'b = <fun> *)


(*4*)
(*  fst ->  renvoie le premier elmt d'un couple
    snd ->  renvoie le second elmt d'un couple*) 


(*5*)
let  inv c =  (snd c , fst c) ;;


(*EXO4*)
let rec fib n = match n with
 |0->0
 |1->1
 |_->fib(n-1)+fib(n-2);;

(*EXO5*)
let rec pgcd a b = 
  if a = 0 then b 
  else pgcd (b mod a) a;;



(*EXO6*)
let rec pair n = 
  if n= 0 then true 
  else impair (n-1) and impair n = if n= 0 then false 
                                   else pair(n-1);;


(*EXO7*)
let fact n =
  let rec facto n m =
    if n <2 then m
    else facto (n-1) (n * m) 
  in facto n 1 ;;

(*EXO8*)
let fib n =
  let rec fibo n m  v=
    if n =0 then m 
    else fibo (n-1) v (m+v)
  in fibo n 1 0;;


(*EXO9*)
let rec exp x n =
  if n = 0 then 1
  else if x = 1 then 1
  else x * exp x (n-1);;
   
 
let exp' x n =
  let rec expo x n acc =
    if n =0 then acc 
    else if x =1 then acc
    else  expo x (n-1) (acc*x)
  in expo x n 1   ;;
    
  

  
(*EXO10*)   
let rec sum1 n m = 
  if n>m then 0
  else n+n+ sum1 (n+1) m;;
       