---
featured: false
subtitle: ""
summary: "Organizing a research project effectively involves numerous considerations. In this post, we'll explore various methods for structuring a project folder that includes code, data, publications, and more. Additionally, we'll look into the specifics of organizing your code folder."
date: "2024-06-11"
header-includes:
  - "\\newcommand{\\M}{\\mathcal{M}}"
draft: false
title: "A multi-language overview on how to organise your research project"
tags:
  - Julia
authors:
  - admin
  - Mauro Werder
lastmod: "2024-06-11"
---

Organizing a research project effectively involves numerous considerations. In this post, we'll explore various methods for structuring a project folder that includes code, data, publications, and more. Additionally, we'll look into the specifics of organizing your code folder.

This post is part of a series of posts on best practices for managing research project code. Much of this material was developed in collaboration with [Mauro Werder](https://github.com/mauro3) as part of the [Course On Reproducible Research, Data Pipelines, and Scientific Computing (CORDS)](https://github.com/mauro3/CORDS/tree/master). If you have experiences to share or spot any errors, please reach out!

- [Project folder structures](#project-folder-structures)
  - [Other folder structures](#other-folder-structures)
- [`code/` folder structure](#code-folder-structure)
- [Turning your `code/` into a "package"](#turning-your-code-into-a-package)
- [Wrapping up](#wrapping-up)
  - [Take-home messages](#take-home-messages)


## Project folder structures
I quite like this project folder structure

```
|-- code/
|-- data/
|    |-- own
|    |-- foreign
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

**Advantages**
- stuff which also belongs to a project, say `admin/` is not mixed with code specifics, such as `environment.yml`
- it feels to me that raw data may should be elsewhere than in a code-folder
- submission to a data-repository of a folder containing `data`, `results` and `code` seems to have a nice setup
- typically I want to have a different git repo for the paper than for the code (but there opinions may also differ)

**Disadvantages**
- code will write results into its parent directory, which is not so nice
- stuff such as admin, etc., will still need to be weeded out before submission

### Other folder structures

The [Good Research Code Handbook](https://goodresearch.dev/setup#create-a-project-skeleton) suggests
```
|-- data
|-- docs
|-- results
|-- scripts
|-- src
|-- tests
 -- .gitignore
 -- environment.yml
 -- README.md
```


One good option could be to put all processing and data stuff into `analysis`
```
MyScientificProject/
 -- README.md
|-- admin/
|-- personnel/
|-- publications/
|-- analysis/
|   |-- README.md
|   |-- src/
|   |-- data/
|   |   |-- raw/
|   |   |-- processed/
|   |-- results/
|   |-- docs/
|   |-- scripts/
|   |-- tests/
|   |-- environment.yml
|   |-- requirements.txt
```
The data-submission would then be the `analysis` folder.


The structure of `code/` deserves here some attention.

## `code/` folder structure

Programming languages typically have their own conventions, but often the folders follow this scheme
- a README.md file at the top level
- the "package" code, e.g. `src/`
- example usages, e.g. `examples/`
- scripts to run models, evaluation, etc., e.g. `scripts/`
- documentation (often generated), e.g. `docs/`

Note that we will get to where to put data and results a bit later, so far we're only developing the model.

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

To import functions and classes (types) located in the `src` folder, you typically need to indicate in each script the relative path of `src`. In Julia, you would typically do something like `include("../src/path/to/your/src_file.jl")`. In Python, you would do something like:

```python
import sys
sys.path.append("../src/")

from src.path.to.your.src_file import my_fun
```

If `src/` directory grows, it’s beneficial to convert it into a separate package. Although this process is a bit more complex, it eliminates the need for path specifications, simplifies the import of functions and classes, and makes the codebase easily accessible for other research projects.

There are typically ways to turn a code-project into an installable package.  This is in particular useful for code which other people (or yourself) use for different projects.  If our mass-balance model takes off, we can think of turning it into a package!  Again this differs from language to language and we will not look into it further.

Further reading for
- [Python](https://goodresearch.dev/setup#create-a-pip-installable-package-recommended)
- [R](https://statisticsglobe.com/create-package-r) (this one I cannot vouch for)
- [Julia](https://pkgdocs.julialang.org/v1/creating-packages/)

## Wrapping up
Explore these exemplary toy research repositories in different programming languages:

- [Julia](https://github.com/mauro3/toy-research-project-breithorn), using relative paths for importing `src` functions.
- [Python](https://github.com/vboussange/rere), implementing `src` as a package.
- [R](https://github.com/vboussange/breithornToyProjectCORDS), also implementing `src` as a package.

These repositories showcase what I consider to be best practices in research project organization.

### Take-home messages

- there is not one way to structure your research project folders
- a chosen structure should be suitable to both work with and to submit (parts) to a data repository

What is your preference?
