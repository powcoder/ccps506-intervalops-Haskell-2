module IntervalOps (main, expand, collapse, union, intersection, difference, is_disjoint, is_subset) where

main :: IO ()
main = do
    putStrLn "Hello, world!"

{--
CCPS506 Haskell Project: Operations on Integer Intervals

Function stubs with type signatures for you to fill in are given below. 
Feel free to add as many additional helper functions as you want. 

The tests for these functions can be found in src/TestSuite.hs. 
You are encouraged to add your own tests in addition to those provided.

Run the tester by executing 'cabal test' from the intervalops directory 
(the one containing intervalops.cabal)
--}
    
expand :: [Char] -> [Int]
expand intervals = []

collapse :: [Int] -> [Char]
collapse items = ""

union :: [Char] -> [Char] -> [Char]
union intervals_1 intervals_2 = ""

intersection :: [Char] -> [Char] -> [Char]
intersection intervals_1 intervals_2 = ""

difference :: [Char] -> [Char] -> [Char]
difference intervals_1 intervals_2 = ""

is_disjoint :: [Char] -> [Char] -> Bool
is_disjoint intervals_1 intervals_2 = False

is_subset :: [Char] -> [Char] -> Bool
is_subset intervals_1 intervals_2 = False

               
    
