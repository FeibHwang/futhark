-- Array type ascription. that fails.
--
-- ==
-- input { [[1,2],[3,4]] 2 2 } output { [[1,2],[3,4]] }
-- input { [[1,2],[3,4]] 1 4 } error: failed

let main [n][m] (x: [n][m]i32, a: i32, b: i32) =
  let y: [a][b]i32 = x
  in y
