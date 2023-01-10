module Main where
    import Test.HUnit
    import qualified IntervalOps
    import qualified System.Exit as Exit

    main = do
         status <- runTestTT tests
         if failures status > 0 then Exit.exitFailure else return ()
-- run tests with:
--     cabal test

-- here are some standard tests
-- you should augment them with your own tests for development purposes

    expand = IntervalOps.expand
    collapse = IntervalOps.collapse
    union = IntervalOps.union
    intersection = IntervalOps.intersection
    difference = IntervalOps.difference
    is_disjoint = IntervalOps.is_disjoint
    is_subset = IntervalOps.is_subset

    tests = test [
      "expand_1" ~: [] ~=? expand "",
      "expand_2" ~: [42] ~=? expand "42",
      "expand_3" ~: [4,5] ~=? expand "4-5",
      "expand_4" ~: [4,5,6,10,11,12,16] ~=? expand "4-6,10-12,16",
      "expand_5" ~: [1,3,4,5,12,13,14,9999] ~=? expand "1,3-5,12-14,9999",

      "collapse_1" ~: "" ~=? collapse [],
      "collapse_2" ~: "1-2,4-6,8-9,12" ~=? collapse [1,2,4,5,6,8,9,12],
      "collapse_3" ~: "1-9" ~=? collapse [1,2,3,4,5,6,7,8,9],
      "collapse_4" ~: "2,4,6,8,10" ~=? collapse [2,4,6,8,10],
      
      "union_1" ~: "1-6" ~=? union "2,4,6" "1,3,5",
      "union_2" ~: "1-6" ~=? union "1-3" "4-6",
      "union_3" ~: "1-10" ~=? union "1-9" "10",
      "union_4" ~: "1,3-6,10-14,16" ~=? union "4-6,10-12,16" "1,3-5,12-14",

      "intersection_1" ~: "" ~=? intersection "2,4,6" "1,3,5",
      "intersection_2" ~: "4,6" ~=? intersection "2,4,6" "4-8",
      "intersection_3" ~: "4-5,12" ~=? intersection "4-6,10-12,16" "1,3-5,12-14",

      "difference_1" ~: "1-3,9" ~=? difference "1-5,7-9" "4-8",
      "difference_2" ~: "6" ~=? difference "4-8" "1-5,7-9",
      "difference_3" ~: "" ~=? difference "" "10",

      "is_disjoint_1" ~: True ~=? is_disjoint "4-7" "1-3,8-9",
      "is_disjoint_2" ~: False ~=? is_disjoint "4-6,10-12,16" "1,3-5,12-14",
      "is_disjoint_3" ~: True ~=? is_disjoint "" "10",

      "is_subset_1" ~: True ~=? is_subset "1-5,7-9" "1-9",
      "is_subset_2" ~: False ~=? is_subset "4-6,10-12,16" "1,3-5,12-14",
      "is_subset_3" ~: True ~=? is_subset "" "10"
      ]
