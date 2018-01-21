data List a = Nil | Cons a (List a) deriving (Show, Eq)

instance Functor List where
    fmap g Nil = Nil
    fmap g (Cons x xs) = Cons (g x) (fmap g xs)

instance Applicative List where
    pure x = Cons x $ pure x
    Nil <*> _ = Nil
    _ <*> Nil = Nil
    (Cons g gs) <*> (Cons x xs) = Cons (g x) (gs <*> xs)

-- functor relationship
-- pure g <*> x = 
--  case x <-> Nil = 
--      Nil = g <$> Nil
--  case x <-> (Cons z zs) =
--      Cons (g z) (pure g <*> zs) = -- induction on list length
--      Cons (g z) (fmap g zs) =
--      fmap g (Cons z zs) =
--      g <$> x
--      
-- id
-- pure id <*> z =
--  case z <-> Nil =
--      Nil = z
--  case z <-> (Cons x xs) =
--      Cons (id x) (pure id <*> xs) = -- induction on list length
--      Cons x xs = z
--
-- homomorphism
-- pure f <*> pure x = (Cons f (pure f)) <*> (Cons x (pure x)) =
-- Cons (f x) (pure f <*> pure x) = Cons (f x) (pure $ f x) =  -- induction list length
-- pure (f x)
--
-- interchange
-- u <*> pure x =
--  case u <-> Nil =
--      Nil = pure ($ x) <*> Nil
--  case u <-> (Cons g gs) =
--      (Cons g gs) <*> (Cons x (pure x)) =
--      Cons (g x) (gs <*> (pure x)) =       -- induction
--      Cons (g x) (pure ($ x) <*> gs) =
--      Cons (($ x) g) (pure ($ x) <*> gs) =
--      (Cons ($ x) (pure ($ x))) <*> (Cons g gs) =
--      pure ($ x) <*> u
--
-- composition 
-- u <*> (v <*> w)
--  case u <-> Nil =
--      Nil <*> (v <*> w) = Nil =
--      Nil <*> v = (Nil <*> v) <*> w =
--      Nil <*> v <*> w =
--      pure (.) <*> Nil <*> v <*> w =
--      pure (.) <*> u <*> v <*> w
--  case u <-> (Cons f fs) =
--      (Cons f fs) <*> (v <*> w) =
--       case v <-> Nil =
--          u <*> (Nil <*> w) =
--          Nil = Nil <*> w =
--          (Cons ((.) f) (pure (.) <*> fs)) <*> Nil <*> w =
--          pure (.) <*> (Cons f fs) <*> v <*> w =
--          pure (.) <*> u <*> v <*> w
--       case w <-> Nil = 
--          u <*> v <*> Nil = Nil =
--          (Cons (((.) f) g) ((pure (.) <*> fs) <*> gs)) <*> Nil =
--          (Cons ((.) f) (pure (.) <*> fs)) <*> v <*> Nil =
--          pure (.) <*> u <*> v <*> w
--      case v <-> (Cons g gs) && w <-> (Cons h hs)
--          (Cons f fs) <*> ((Cons g gs) <*> (Cons x xs)) =
--          (Cons f fs) <*> (Cons (g x) (gs <*> xs)) =
--          (Cons (f (g x)) (fs <*> (gs <*> xs))) = -- induction
--          (Cons ((f . g) x) (pure (.) <*> fs <*> gs <*> xs)) =
--          (Cons ((((.) f) g) x) (((pure (.) <*> fs) <*> gs) <*> xs)) =
--          (Cons (((.) f) g) ((pure (.) <*> fs) <*> gs)) <*> (Cons x xs) =
--          (Cons ((.) f) (pure (.) <*> fs)) <*> (Cons g gs) <*> w =
--          (Cons (.) (pure (.))) <*> (Cons f fs) <*> v <*> w =
--          pure (.) <*> u <*> v <*> w
