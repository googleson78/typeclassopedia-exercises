data Either' a b = Left' a | Right' b deriving (Show)

instance Functor (Either' e) where
    fmap _ (Left' err) = Left' err
    fmap g (Right' x) = Right' $ g x
