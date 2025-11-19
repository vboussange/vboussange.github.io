---
title: Developing an algebraic multigrid solver in JAX
summary: "This project aims to develop a high-performance algebraic multigrid (AMG) solver in JAX that supports automatic differentiation and GPU acceleration, addressing critical gaps in existing Python and Julia implementations. The work will enable efficient gradient-based optimization in scientific machine learning applications requiring large-scale linear system solves, with potential to significantly impact the JAX ecosystem for differentiable physics simulations and inverse problems."
tags:
- JAX
- Algebraic Multigrid
- Scientific Machine Learning
date: "2025-11-19T00:00:00Z"

# Optional external URL for project (replaces project detail page).
external_link: ""

image:
  focal_point: Top
  preview_only: true

links:
# - icon: twitter
#   icon_pack: fab
#   name: Follow
#   url: https://twitter.com/georgecushen
# url_code: ""
# url_pdf: ""
# url_slides: ""
# url_video: ""

# Slides (optional).
#   Associate this project with Markdown slides.
#   Simply enter your slide deck's filename without extension.
#   E.g. `slides = "example-slides"` references `content/slides/example-slides.md`.
#   Otherwise, set `slides = ""`.
# slides: example
---
Multigrid methods represent the state-of-the-art for solving large-scale linear systems arising from discretized partial differential equations, offering optimal computational complexity for many problem classes.

Established implementations such as [pyAMG](https://github.com/pyamg/pyamg) and [AMG.jl](https://github.com/JuliaLinearAlgebra/AlgebraicMultigrid.jl) provide robust solvers but lack two critical capabilities for modern scientific machine learning: GPU acceleration and automatic differentiation compatibility. These features are essential for scientific machine learning workflows where differentiable simulation components (e.g., neural networks embedded in physical models) require efficient iterative solves with gradient backpropagation for end-to-end optimization.

This project aims to develop an algebraic multigrid (AMG) solver in JAX that natively supports automatic differentiation and GPU acceleration. The work involves analyzing existing Python and Julia implementations to design an architecture compatible with JAX's functional programming paradigm and just-in-time compilation model. A successful implementation could have substantial impact on the JAX ecosystem, from [accelerating finite element packages](https://github.com/deepmodeling/jax-fem) to [accelerating ecological connectivity analysis](https://github.com/vboussange/jaxscape) tools.

The project scope is flexible and can emphasize software engineering or algorithmic optimization depending on the student's background and interests. Prior experience with JAX or advanced numerical linear algebra is beneficial but not required; students will gain deep expertise in iterative solvers, functional programming patterns, and best practices for scientific open-source software development.