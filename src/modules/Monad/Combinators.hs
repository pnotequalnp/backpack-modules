module Monad.Combinators where

import Monad qualified
import Prelude hiding (Applicative (..), Functor (..), Monad (..), (<$>))

type M = Monad.M

pure :: a -> M a
pure = Monad.pure

(>>=) :: M a -> (a -> M b) -> M b
(>>=) = (Monad.>>=)
infixl 1 >>=

fmap :: (a -> b) -> M a -> M b
fmap f x = x >>= pure . f

(<$>) :: (a -> b) -> M a -> M b
(<$>) = fmap
infixl 4 <$>

(*>) :: M a -> M b -> M b
x *> y = x >>= \_ -> y
infixl 4 *>

(>>) :: M a -> M b -> M b
(>>) = (*>)
infixl 1 >>

replicateM :: Int -> M a -> M [a]
replicateM 0 _ = pure []
replicateM n x = Monad.do
  y <- x
  (y :) <$> replicateM (n - 1) x
