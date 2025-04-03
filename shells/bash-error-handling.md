# Bash: errors handling

- `|| exit 1`

## `set -e`

- :newspaper: [Why doesn't set -e (or set -o errexit, or trap ERR) do what I expected | BashFAQ/105 | Greg's Wiki](https://mywiki.wooledge.org/BashFAQ/105)

### So-called strict mode

In the mid 2010s, some people decided that the combination of `set -e`, `set -u` and `set -o` pipefail should be used by default in all new shell scripts. They call this unofficial bash strict mode, and they claim that it "makes many classes of subtle bugs impossible" and that if you follow this policy, you will "spend much less time debugging, and also avoid having unexpected complications in production".

As we've already seen in the exercises above, these claims are dubious at best. The behavior of set -e is quite unpredictable. If you choose to use it, you will have to be hyper-aware of all the false positives that can cause it to trigger, and work around them by "marking" every line that's allowed to fail with something like ||true.


