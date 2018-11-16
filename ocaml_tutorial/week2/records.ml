
(*
The given prelude defines three types, one for three dimensional points, another for velocity vectors in three dimensions, and another one representing moving objects in space.

1. Write a function move : point -> dpoint -> point such that move p dp is the point p whose coordinates have been updated according to dp.
    (x is now x +. dx, y is now y +. dy, z is now z +. dz.
    
2. Write a function next : physical_object -> physical_object such that next o is the physical object o at time t + dt.
    The position of next o is the position of o moved according to its velocity vector.
    
3. Suppose that these objects are spheres whose radius is 1.0. Write a function will_collide_soon : physical_object -> physical_object -> bool that tells if at the next instant, the two spheres will intersect.

*)

type point  = { x : float; y : float; z : float } ;;
type dpoint = { dx : float; dy : float; dz : float } ;;
type physical_object = { position : point; velocity : dpoint } ;;

let move p dp =
  { x = p.x +. dp.dx; 
    y = p.y +. dp.dy;
    z = p.z +. dp.dz; 
  } ;;

let next obj =
  { position=(move obj.position obj.velocity); velocity=obj.velocity };;

let will_collide_soon p1 p2 =
  let dist_btw_p1_p2 = Math.sqrt()

(* let ans = next { position={x=1.0; y=2.0; z=3.0;}; velocity={dx=2.0; dy=3.0; dz=4.0;}} ;; *)

(* print_endline (string_of_float ans.position.x);; *)
