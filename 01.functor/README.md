Finally realised that `Functor` is called that because it quite literally is a
functor (if we assume the *Hask* cat). The type function which we are declaring
to be an instance of `Functor` (for example `[] :: * -> *`) is a function from the types
to the types (`* -> *`) which are the objects of *Hask*. And `fmap` is the morphism
that preserves *dom*s and *cod*s (takes an arrow *a -> b* and makes it's *dom* 
equal to `[a]` and it's *cod* to `[b]`). So as long as we are sane (obey
`fmap id = id`, and also composition of arrows - `fmap (g . h) = (fmap g . fmap h)`)
the `Functor` instance together with `fmap` have indeed all the 
required properties of a functor.

The "Reader monad" is just the functor which takes *Hask* to it's coslice category
for a fixed object *X*