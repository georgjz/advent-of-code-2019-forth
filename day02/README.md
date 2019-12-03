## How to run

I cheated a bit on this one by changing the input into a format that Forth can "run". See `Cheat.hs` for details. It basically replaces the commas with `\n` and reverses the order the numbers appear (and in which order they are therefore placed on stack).

Use [gForth][gf] to run this file:

```bash 
gforth Computer.f
```

[gf]: https://www.gnu.org/software/gforth/