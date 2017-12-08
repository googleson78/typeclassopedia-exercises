data ITree a = Leaf (Int -> a)
             | Node [ITree a]

instance Functor ITree where
    fmap g (Leaf h) = Leaf (g . h)
    fmap g (Node hs) = Node (fmap (fmap g) hs)

-- id
-- fmap id z
-- case z <-> (Leaf h) = Leaf (id . h) = Leaf h = id (Leaf h)
-- case z <-> (Node hs) = Node (fmap (fmap id) hs) =induct.= Node (fmap id hs) =
--                        Node hs = id (Node hs)
--
-- assoc 
-- fmap (g . h) z 
-- case z <-> (Leaf x) = Leaf ((g . h) x) = Leaf (g (h x)) = fmap g (Leaf (h x)) =
--                       fmap g (fmap h (Leaf x)) = (fmap g . fmap h) (Leaf x)
-- case z <-> (Node hs) = Node (fmap (fmap (g . h)) hs) =induct.=
-- Node (fmap (fmap g . fmap h) hs) = Node ((fmap (fmap g) . fmap (fmap h)) hs =
-- Node (fmap (fmap g) (fmap (fmap h) hs)) = fmap g (Node (fmap (fmap h) hs)) =
-- fmap g (fmap h (Node hs)) = (fmap g . fmap h) (Node hs)
