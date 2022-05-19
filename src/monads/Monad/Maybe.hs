module Monad.Maybe where

type M = Maybe

pure :: a -> M a
pure = Just

(>>=) :: M a -> (a -> M b) -> M b
Just x >>= f = f x
Nothing >>= _ = Nothing
