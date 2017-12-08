-- again renaming because of default Functor instance
newtype Tag a b = Tag (a,b) deriving (Show)

instance Functor (Tag t) where
    fmap g (Tag (x, b)) = Tag (x, g b)

-- id
-- fmap id (Tag (x, b)) = Tag (x, id b) = Tag (x, b) = id (Tag (x, b))
--
-- assoc
-- fmap (g . h) (Tag (x, b)) = Tag (x, (g . h) b) = Tag (x, g (h b)) = 
-- fmap g (Tag (x, h b)) = fmap g (fmap h (Tag (x, b))) = (fmap g . fmap h) (Tag (x, b))
