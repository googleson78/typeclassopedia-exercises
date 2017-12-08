f :: Int -> Int
f x = x + 1

-- we redifine functions so we can create another instance
newtype Fn a b = Fn (a -> b)

-- coslice category
instance Functor (Fn x) where
    fmap g (Fn h) = Fn (g . h)

-- normally:
-- id
-- fmap id g = id . g
--
-- assoc
-- fmap g . h x = g . h . x
--
-- but let's do it anyway:
-- id
-- fmap id (Fn h) = Fn (id . h) = Fn h
--
-- assoc
-- fmap (g . h) x = Fn ((g . h) . x) = Fn (g . h . x) = Fn (g . (h . x)) =
-- fmap g (h . x) = fmap g (fmap h x) = (fmap g . fmap h) x
