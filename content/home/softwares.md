---
# An instance of the Portfolio widget.
# Documentation: https://wowchemy.com/docs/page-builder/
widget: blank

# This file represents a page section.
headless: true

# Order that this section appears on the page.
weight: 30

title: Open source softwares 🧑🏽‍💻
subtitle: ""

design:
  columns: "2"


content:
  # Page type to display. E.g. project.
  page_type: software

  # Default filter index (e.g. 0 corresponds to the first `filter_button` instance below).
  filter_default: 0

  # Filter toolbar (optional).
  # Add or remove as many filters (`filter_button` instances) as you like.
  # To show all items, set `tag` to "*".
  # To filter by a specific tag, set `tag` to an existing tag name.
  # To remove the toolbar, delete the entire `filter_button` block.
  # filter_button:
  # - name: All
  #   tag: '*'
  # - name: Deep Learning
  #   tag: Deep Learning
  # - name: Other
  #   tag: Demo

design:
  # Choose how many columns the section has. Valid values: '1' or '2'.
  columns: '2'

  # Toggle between the various page layout types.
  #   1 = List
  #   2 = Compact
  #   3 = Card
  #   5 = Showcase
  view: 5

  # For Showcase view, flip alternate rows?
  flip_alt_rows: false
---
<script async defer src="https://buttons.github.io/buttons.js"></script>

# [EvoId.jl](https://github.com/vboussange/EvoId.jl)
Evolutionary Individual based modelling, mathematically grounded. A user friendly package aimed at simulating the evolutionary dynamics of a population structured over a complex spatio-evolutionary structures.

{{< github_button button="star" user="vboussange" repo="evoid.jl" count="true" dark="true" large="true">}}

# [HighDimPDE.jl](https://github.com/vboussange/HighDimPDE.jl)
Solver for **highly dimensional, non-local, nonlinear PDEs**. It is integrated within the SciML ecosystem (see below). Try it out! &#128515; If you want to learn more about the algorithms implemented, check out my [research interests]({{site.url}}/research/#developping-numerical-schemes-for-solving-high-dimensional-non-local-nonlinear-pdes).

{{< github_button button="star" user="vboussange" repo="highdimpde.jl" count="true" dark="true" large="true">}}


# [SciML](https://github.com/SciML/)
I am a member of the **SciML** organisation, an open source ecosystem for Scientific Machine Learning in the Julia programming language. On top of being the author of **HighDimPDE.jl**, I actively participate in the development of other packages such as [DiffEqFlux.jl](https://github.com/SciML/DiffEqFlux.jl), a library to train differential equations with data.

{{< github_button button="star" user="SciML" repo="DiffEqFlux.jl" count="true" dark="true" large="true">}}