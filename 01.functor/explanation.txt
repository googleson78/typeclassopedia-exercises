Finally realised that 'Functor' is called that because it quite literally is a
functor (if we assume the Hask cat). The type function which we are declaring
to be an instance of 'Functor' (for example []) is a function from the types
to the types (* -> *) which are the objects of Hask. And fmap is the morphism
that preserves doms and cods (takes an arrow a -> b and makes it's dom 
equal to [a] and it's cod to [b]). So as long as we are sane (obey
fmap id = id, and also composition of arrows - fmap g . h = fmap g . fmap h)
the Functor instance together with fmap have indeed all the 
required properties of a functor.
