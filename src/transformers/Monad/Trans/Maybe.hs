module Monad.Trans.Maybe where

import Monad qualified
import Prelude hiding (Applicative (..), Functor (..), Monad (..))

newtype M a = MaybeT {runMaybeT :: Monad.M (Maybe a)}

pure :: a -> M a
pure = MaybeT . Monad.pure . Just

(>>=) :: M a -> (a -> M b) -> M b
MaybeT x >>= f = MaybeT Monad.do
  y <- x
  case y of
    Nothing -> Monad.pure Nothing
    Just z -> runMaybeT (f z)
