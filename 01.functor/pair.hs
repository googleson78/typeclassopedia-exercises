data Pair a = Pair a a 

instance Show a => Show (Pair a) where
    show (Pair x y) = "(" ++ show x ++ "," ++ show y ++ ")"

instance Functor Pair where
    fmap g (Pair x y) = Pair (g x) (g y)

-- id
-- fmap id (Pair x y) = Pair (id x) (id y) = Pair x y = id (Pair x y)
--
-- assoc
-- fmap (g . h) (Pair x y) = Pair ((g . h) x) ((g . h) y) = Pair (g (h x)) (g (h y)) =
-- fmap g (Pair (h x) (h y)) = fmap g (fmap h (Pair x y)) = (fmap g . fmap h) (Pair x y)
