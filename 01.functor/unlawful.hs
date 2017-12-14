data Fake a = F a Int deriving (Show, Eq)

instance Functor Fake where
    -- fmap :: (a -> b) -> (Fake a -> Fake b)
    fmap h (F x n) = F (h x) (const 0 n)

-- id counterexample
-- fmap id (F 'a' 5) = F (id 'a') (const 0 n) = F 'a' (const 0 n) /= F 'a' 0 == id (F 'a' 5)
-- fmap id (F 'a' 5) /= id (F 'a' 5)
--
-- assoc proof
-- fmap (g . h) (F x n) = F ((g . h) x) (const 0 n) = F (g (h x)) (const 0 n) =
-- F (g (h x) (const 0 (const 0 n)) = fmap g (F (h x) (const 0 n)) = 
-- fmap g (fmap h (F x n)) = (fmap g) . (fmap h) (F x n)
