data Maybe' a = Nothing' | Just' a

instance Functor Maybe' where
    fmap _ Nothing' = Nothing'
    fmap f (Just' x) = Just' $ f x

instance Applicative Maybe' where
    -- pure :: a -> Maybe' a
    pure = Just'
    -- <*> :: Maybe' (a -> b) -> Maybe' a -> Maybe' b
    Nothing <*> jx = Nothing
    (Just' g) <*> jx = fmap g jx


-- id
-- pure id <*> v = (Just' id) <*> v = fmap id v = v
--
-- homomorphism
-- pure f <*> pure x = Just' f <*> Just' x = 
-- fmap f Just' x = Just' (f x) = pure (f x)
--
-- interchange
-- h <*> pure x =
--  case h <-> Nothing' = 
--      Nothing' <*> pure x =
--      Nothing' = fmap ($ x) Nothing' = 
--      Just' ($ x) <*> Nothing = pure ($ x) <*> h
--  case h <-> Just' g = 
--      Just' g <*> pure x =
--      fmap g (pure x) = fmap g (Just' x) =
--      Just' (g x) = Just' (($) g x) =
--      fmap' ($ x) (Just' g) = 
--      Just' ($ x) <*> Just' g =
--      pure ($ x) <*> h
--
-- composition
-- u <*> (v <*> w) = 
--  case u <-> Nothing' =
--      Nothing' <*> (v <*> w) = Nothing' =
--      Nothing' <*> w =
--      Nothing' <*> v <*> w =
--      fmap (.) Nothing' <*> v <*> w =
--      Just' (.) <*> Nothing' <*> v <*> w =
--      pure (.) <*> u <*> v <*> w
--  case u <-> Just' g =
--      fmap' g (v <*> w) =
--       case v <-> Nothing' =
--          Nothing' ..just above
--       case v <-> Just' h =
--          fmap g (fmap h w) = 
--          (fmap g . fmap h) w =
--          fmap (g . h) w = 
--          Just' (g . h) <*> w =
--          fmap ((.) g) (Just' h) <*> w =
--          Just' ((.) g) <*> Just' h <*> w =
--          Just' ((.) g) <*> v <*> w =
--          fmap (.) (Just' g) <*> v <*> w =
--          Just' (.) <*> u <*> v <*> w =
--          pure (.) <*> u <*> v <*> w
--
-- fmap relation is trivial
