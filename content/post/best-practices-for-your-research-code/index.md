---
featured: false
subtitle: ""
summary: " In this post, we'll explore various methods for structuring a research project folder that includes code, data, publications, and more. Additionally, we'll look into the specifics of organizing your code folder."
date: "2024-06-11"
header-includes:
  - "\\newcommand{\\M}{\\mathcal{M}}"
draft: false
title: "A multi-language overview on how to organise your research project code and documents"
tags:
  - Julia
authors:
  - Mauro Werder
  - admin
lastmod: "2024-06-11"
---

I personally find that one of the biggest challenge when doing research is to keep things neat and organized. Having a good management system for your code and resources is key to optimizing time and brain resources. In this post, I discuss various methods for structuring a research project folder that includes code, data, publications, and more. Additionally, I discuss the specifics of organizing your research code. As I started my PhD, I wish I could have had some of such guidelines. But starting from scratch allowed me to build, with trials and errors, a good system for my later life. Hopefully, some of this can apply to you! 

This post is part of a series of posts on best practices for managing research code. Much of this material was developed in collaboration with [Mauro Werder](https://github.com/mauro3) as part of the [Course On Reproducible Research, Data Pipelines, and Scientific Computing (CORDS)](https://github.com/mauro3/CORDS/tree/master). If you have experiences to share or spot any errors, please reach out!

## Content
- [Content](#content)
- [Project folder structures](#project-folder-structures)
- [`code/` structure](#code-structure)
- [Turning your `code/` into a "package"](#turning-your-code-into-a-package)
- [Wrapping up](#wrapping-up)
  - [Take-home messages](#take-home-messages)


## Project folder structures
I quite like this project folder structure, which keeps apart raw data and results from the code, but still place them relatively close, together with admin and publications. Having a separate git repo for the paper is something I would recommend as well (possibly linked to an Overleaf project). 

```
|-- code/
|-- data/
|-- results
|-- publications
|    |-- talks
|    |-- posters
|    |-- papers
|-- admin
|-- meetings
|-- more-folders
 -- README.md
```
You may want to place `results` within `code`, together with `data` (which you should not git track)
The structure of `code/` deserves here some attention.

## `code/` structure

Programming languages typically have their own conventions, but often the folders follow this scheme
- a `README.md` file at the top level
- a `src/` folder, containing models and other generic function and classes, that will be used in `script/` files,
- example usages, e.g. `examples/`
- scripts to run models, evaluation, etc., e.g. `scripts/`
- documentation (often generated), e.g. `docs/`

It can make sense for research projects to distinguish between scripts placed in `scripts/` and reused functions, models, etc., placed in `src`. 

<details>
<summary>Python Folder structure</summary>

```
|-- src/            # package code
|-- scripts/        # Custom analysis or processing scripts
|-- tests/
|-- examples/       # Example scripts using the package
|-- docs/           # documentation
 -- environment.yml # to handle project dependencies
 -- README.md
```

</details>

<details>
<summary>R Folder structure</summary>

```
|-- R/               # R scripts and functions (package code)
|-- scripts/         # Custom analysis or processing scripts
|-- man/             # Documentation files
|-- tests/
|-- examples/        # Example scripts using the package
|-- vignettes/       # Long-form documentation
 -- DESCRIPTION      # Package description and metadata
 -- NAMESPACE        # Namespace file for package
 -- README.md        # Project overview and details
```

</details>

<details>
<summary>Julia Folder structure</summary>

```
|-- src/            # package code
|-- scripts/        # Custom analysis or processing scripts
|-- test/
|-- examples/       # Example scripts using the package
|-- docs/           # documentation
 -- Project.toml    # to handle project dependencies
 -- README.md
```

</details>


## Turning your `code/` into a "package"

You may want to specify the `src` folder as a package. This has a few advantages, including

- not having to deal with relative position of files to call the functions in `src/`
- maximizing your productivity by creating a generic package additionally to your main research project.

To import functions and classes (types) located in the `src` folder, you typically need to indicate in each script the relative path of `src`. In Julia, you would typically do something like `include("../src/path/to/your/src_file.jl")`. In Python, you would do something like:

```python
import sys
sys.path.append("../src/")

from src.path.to.your.src_file import my_fun
```

If `src/` directory grows, it’s beneficial to convert it into a separate package. Although this process is a bit more complex, it eliminates the need for path specifications, simplifies the import of functions and classes, and makes the codebase easily accessible for other research projects.

There are typically ways to turn a code-project into an installable package.  This is in particular useful for code which other people (or yourself) use for different projects. 

You can achieve this easily with development tools.

For Python, tools like `setuptools` and `poetry` facilitate package development. If you're working in R, `devtools` is the go-to tool for developing packages. In Julia, the `Pkg` tool serves a similar purpose.

Package templates can be useful to simplify the creation of packages by generating package skeletons. In Python, checkout out `cookiecutter`. In R, check `usethis`. For Julia, use the `Pkg.generate()` built-in functionality, or the more advanced `PkgTemplates.jl` package.

Note that you may want at some point to locate your `src/` (and associated `tests`, `docs`, etc...) in a separate git repo.


Further reading for
- [Python](https://goodresearch.dev/setup#create-a-pip-installable-package-recommended)
- [R](https://statisticsglobe.com/create-package-r)
- [Julia](https://pkgdocs.julialang.org/v1/creating-packages/)

## Wrapping up
Explore these exemplary toy research repositories in different programming languages:

- [Julia](https://github.com/mauro3/toy-research-project-breithorn), using relative paths for importing `src` functions.
- [Python](https://github.com/vboussange/rere), implementing `src` as a package.
- [R](https://github.com/vboussange/breithornToyProjectCORDS), also implementing `src` as a package.

These repositories showcase what I consider to be best practices in research project organization.

### Take-home messages

- There is not one way to structure your research project folders, but general guidelines. Create the one that makes most sense for you!
- A chosen structure should be suitable to both work during the development of your project, and to submit (parts) of it to a repository in a future stage.
- Consider turning your `src/` into a folder. This can increase your academic productivity, as you could eventually be the developer of a cool package that people re-use, with minimum efforts!
