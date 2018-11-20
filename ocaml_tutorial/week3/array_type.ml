(*
The previous week, we asked you the following question: Consider a non empty array of integers a, write a function min_index : int array -> int that returns the index of the minimal element of a.
As the arrays contain integers and the indices of arrays are also represented by integers, you might have confused an index and the content of a cell. To avoid such a confusion, let us define a type for index (given in the prelude below).
This type has a single constructor waiting for one integer.
For instance, if you want to represent the index 0, use the value Index 0.
Defining such a type is interesting because it allows the type-checker to check that an integer is not used where an index is expected (or the converse).

1. Write a function read : int array -> index -> int such that read a (Index k) returns the k-th element of a.
2. Write a function inside : int array -> index -> bool such that inside a idx is true if and only if idx is a valid index for the array a.
3. Write a function next : index -> index such that next (Index k) is equal to Index (k + 1).
4. Consider a non empty array of integers a, write a function min_index : int array -> index that returns the index of the minimal element of a.
*)

type index = Index of int

let read a index =
    match index with 
    | Index(i) -> a.(i) ;;

let inside a index =
  match index with 
    | Index(i) -> let len = Array.length a in i >= 0 && i < len ;;

let next index =
  match index with Index(i) -> Index (i + 1) ;;

let min_index a =
  let rec findMin a index minIndex =
    if index == Array.length a then (Index minIndex)
    else if a.(index) < a.(minIndex) then findMin a (index + 1) index
    else findMin a (index + 1) minIndex
  in
    if Array.length a = 1 then (Index 0)
    else 
      findMin a 1 0 ;;

let arr = [| 1;2;3;|]
let res = read arr (Index 1) ;;

let printIndex index = 
  match index with Index(i) -> print_endline (string_of_int i) ;;

print_endline (string_of_int res) ;;

printIndex (next (Index 10));;