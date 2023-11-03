# Deno: env

## Multiple flags in single-file Deno script shebang

- See [d9k-scripts: budget-to-formula.ts](https://github.com/d9k/d9k-scripts/blob/master/budget-to-formula.ts):

```bash
#!/usr/bin/awk BEGIN{system("deno run --unstable --allow-read --allow-run "ARGV[1]"  "ARGV[2]" "ARGV[3]" "ARGV[4]" "ARGV[5])}
```


https://github.com/d9k/d9k-scripts/blob/master/budget-to-formula.ts

- [deno run with flags · Issue #5901 · denoland/deno](https://github.com/denoland/deno/issues/5901)