(* 
 1. Write a function filter : ('a -> bool) -> 'a list -> 'a list that takes a predicate p (a function returning a boolean) and a list l and returns all the elements of l that satisfy p (for which p returns true).

 2. Define, using List.fold_right, a function partition : ('a -> bool) -> 'a list -> 'a list * 'a list that takes a predicate p and a list l, and that partitions l by p. It returns a pair of two lists (lpos,lneg), where lpos is the list of all elements of l that satisfy p, and lneg is the list of all elements that do not satisfy p. 

 3. One way of sorting a list is as follows:

    The empty list is already sorted.
    If the list l has a head h and a rest r, then a sorted version of l can be obtained in three parts:
        first a sorted version of all elements of r that are smaller or equal to h,
        then h,
        then a sorted version of all elements of r that are greater than h.

Write a function sort:'a list-> 'a list that implements this algorithm, using the function partition of the previous question. This sorting algorithm is also known as Quicksort where the pivot is always the first element of the list. 
*)

let rec filter p l =
  match l with 
  | [] -> []
  | x :: xs -> let rest = (filter p xs) in 
               if (p x) then x :: rest else rest

let partition p l =
  let zero = ([], []) in
  let iter = fun next (lpos, lneg) -> 
    if p next then (next::lpos, lneg)
    else (lpos, next::lneg)
  in
  List.fold_right iter l zero

let rec sort l = 
 let isGreaterThan x y = x > y in 
 match l with 
 | [] -> []
 | h::r -> let (smaller, larger) = (partition (isGreaterThan h) r) in 
           let small_sorted = sort smaller in 
           let large_sorted = sort larger in 
           small_sorted @ [h] @ large_sorted
