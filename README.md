# First Steps with Tuist

A Tuist implementation example for Medium article:

* [castellano](https://medium.com/@daviddvd19/ccbeb3cba008)
* [english]()

# How To Install Tuist

## Using Mise

```bash
$> mise install tuist
```

## Using Homebrew

```bash
$>brew tap tuist/tuist
$>brew install --formula tuist
```

You could read Tuist install documentation [here](https://docs.tuist.io/guides/quick-start/install-tuist).

And there is an autocomplete hook for Tuist [CLI here](https://docs.tuist.io/guides/quick-start/install-tuist#shell-completions).


# How to launch this project?

Once you have _Tuist_ installed execute de following commands:

```bash
$> tuist install
$> tuist generate
```

The first one will install the dependencies, the second configure the project and launch Xcode.

And, if you want to edit the Tuist configuration to try your own labs execute:

```bash
$> tuist edit
```