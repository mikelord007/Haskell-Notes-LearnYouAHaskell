import Data.List


-- import some functions: import Data.List (nub,sort)
-- import everything except some fn: import Data.List hiding (nub)
-- in case of fn name classes, import modules as qualified: import qualified Data.Map as M    // to use Data.Map's filter fn, use M.filter
-- http://www.haskell.org/ghc/docs/latest/html/libraries/


numUniques :: (Eq a) => [a] -> Int
numUniques = length . nub