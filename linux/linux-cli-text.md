# Linux: CLI: text edit

## Replace in files

### Replace in files with wrg

The idea is to first search and see what matches:

```
rg something
```

Then, press the Up arrow and edit in a replacement:

```
rg something --replace SOMETHING
```

If it looks good, press the Up arrow again and add a `w` at the beginning (w for write) (although my script is called `pre`, not [wrg script](https://github.com/lydell/dotfiles/blob/d279dedf4904687bd537ee33a4146715abe0ba14/bin/pre) for historical reasons):

```
wrg something --replace SOMETHING
```

- https://github.com/BurntSushi/ripgrep/issues/74#issuecomment-309213936

- / by [lydell (Simon Lydell)](https://github.com/lydell)