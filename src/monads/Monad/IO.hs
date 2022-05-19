module Monad.IO where

import GHC.Base (bindIO, returnIO)

type M = IO

pure :: a -> M a
pure = returnIO

(>>=) :: M a -> (a -> M b) -> M b
(>>=) = bindIO
