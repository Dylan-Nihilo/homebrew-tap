# Dylan-Nihilo/homebrew-tap

Homebrew formulae for my projects.

    brew install Dylan-Nihilo/tap/iris

| Formula | What it is |
| --- | --- |
| [`iris`](Formula/iris.rb) | [Iris](https://github.com/Dylan-Nihilo/iris): screen recordings that zoom on what matters, for people and for AI agents |

The full name matters for `iris`: plain `iris` is another program in Homebrew.

## Releasing a new version of a formula

Each formula carries a bottle, kept as a release of this repository. Without one Homebrew
counts the install as a build from source and refuses it on a machine whose Command Line
Tools are out of date.

1. In the formula, set the new `url` and its `sha256`, delete the `bottle do` block, commit
   and push.
2. Build the bottle from the pushed formula (`V` is the new version):

       export HOMEBREW_NO_AUTO_UPDATE=1 HOMEBREW_NO_AUTOREMOVE=1
       brew install --build-bottle Dylan-Nihilo/tap/iris
       brew bottle --no-rebuild Dylan-Nihilo/tap/iris
       brew uninstall Dylan-Nihilo/tap/iris

   The binary is universal, so one bottle serves every Mac: rename the file from
   `iris--V.<system>.bottle.tar.gz` to `iris-V.all.bottle.tar.gz`.
3. Publish it: `gh release create iris-V iris-V.all.bottle.tar.gz --title "iris V bottle"`.
4. Put the `bottle do` block back with the new `root_url` and the `sha256` that
   `brew bottle` printed, under the tag `all:`. Commit and push.
5. Check that `brew install Dylan-Nihilo/tap/iris` says "Pouring".
