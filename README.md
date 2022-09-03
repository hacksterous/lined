# lined
Line Editor for FreeBASIC - a miniature replacement for GNU readline using [linenoise](https://github.com/antirez/linenoise).
This supports hints and tab-based command completion.

Generate the linenoise library archive:

```bash
# make clean && make lib
```

This creates a library archive called libnoise.a

Compile the example FreeBASIC code

```bash
# fbc -l noise lined.bas
```
