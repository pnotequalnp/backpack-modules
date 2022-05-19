module Main where

import IO qualified
import MaybeT.IO qualified
import Monad.Trans.Maybe.IO (M (..))
import Text.Read (readMaybe)
import Prelude hiding (Applicative (..), Functor (..), Monad (..), (<$>))

main :: IO ()
main = IO.do
  putStrLn "Enter 3 numbers:"
  ints <- runMaybeT (getInts 3)
  case ints of
    Nothing -> putStrLn "That's not a valid number"
    Just xs -> putStrLn $ "Your total is " <> show (sum xs)

getInt :: MaybeT.IO.M Int
getInt = MaybeT (readMaybe IO.<$> getLine)

getInts :: Int -> MaybeT.IO.M [Int]
getInts n = MaybeT.IO.replicateM n getInt
