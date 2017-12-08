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

The `ITree` functor instance was a bit harder to prove - I had to use induction and
the fact that fmap over lists also obeys the associative law. But before that I had
to convince myself that I *could* indeed use induction on this structure in some
intuitive way. I did not define a formal ordering on it, but if we look at it
synctatically we could define subwords or looking at it like a tree we could
define subtrees and work with that.

I think the answer to the question "What can you not make an instance of `Functor`?"
is ADTs which have built-in type constraints. I have not figured out any other
case yet.
