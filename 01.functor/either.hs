data Either' a b = Left' a | Right' b deriving (Show)

instance Functor (Either' e) where
    fmap _ (Left' err) = Left' err
    fmap g (Right' x) = Right' $ g x

-- id 
-- fmap id z =
-- case z <-> (Left' err) = Left' err = id (Left' err) = id z
-- case z <-> (Right' x) = Right' (id x) = Right' x = id (Right' x) = id z
--
-- assoc
-- fmap g . h z =
-- case z <-> (Left' err) = Left' err = fmap h (Left' err) = fmap g . fmap h z
-- case z <-> (Right' x) = Right' (g . h x) = fmap g (Right' h x) =
-- fmap g (fmap h (Right' x)) = fmap g . fmap h z
