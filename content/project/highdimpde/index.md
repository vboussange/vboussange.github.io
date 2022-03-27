---
title: Machine learning to solve highly dimensional non-local nonlinear PDEs
summary: "[Partial Differential Equations](https://en.wikipedia.org/wiki/Partial_differential_equation) (PDEs) are equations that arise in a variety of models in physics, engineering, finance and biology. I develop **numerical schemes** based on **machine learning techniques** to solve for a special class of PDEs (cf below) in high dimension. "
tags:
- Deep Learning
- PDEs
- Applied Mathematics
- Scientific Machine Learning
date: "2020-06-27T00:00:00Z"

# Optional external URL for project (replaces project detail page).
external_link: ""

image:
  caption: Neural network architectures used to approximate solutions to Eq. (1). The output neuron $\mathbb{V}_n(\theta ,x)$ approximates $u(t_n,x)$.
  focal_point: Top

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

[Partial Differential Equations](https://en.wikipedia.org/wiki/Partial_differential_equation) (PDEs) are equations that arise in a variety of models in physics, engineering, finance and biology. I develop **numerical schemes** based on **machine learning techniques** to solve for a special class of PDEs (cf below) in high dimension. 

The equation below defines the class of PDEs I am interested in. These PDEs are also referred in the literature as non-local reaction diffusion equations.

$$
\begin{aligned}
  (\tfrac{\partial}{\partial t}u)(t,x)
  &=
  \int_{D} f\big(t,x,{\bf x}, u(t,x),u(t,{\bf x}), ( \nabla_x u )(t,x ),( \nabla_x u )(t,{\bf x} ) \big) \\, \nu_x(d{\bf x}) \\\\
  & \quad + \big\langle \mu(t,x), ( \nabla_x u )( t,x ) \big\rangle + \tfrac{ 1 }{ 2 }
  \text{Trace}\big(
  \sigma(t,x) [ \sigma(t,x) ]^*
  ( \text{Hess}_x u)( t,x )
  \big).
\end{aligned}
$$

Such PDEs permit to e.g. **model the evolution of biological populations in a realistic manner**, by describing the dynamics of several *traits* characterising individuals (for a population of birds, think of traits as the beak length, the body size, or the color of the birds).

I have implemented those schemes in [HighDimPDE.jl](https://github.com/vboussange/HighDimPDE.jl), a Julia package that should allow scientists to develop models that better capture the complexity of life. These techniques extend beyond biology and are also relevant for other fields, such as finance.

Check out my [blog post](../_posts/2021-05-01-highdimpde.md) to read more about it!

#### Related papers
- Boussange, V., Becker, S., Jentzen, A., Pellissier, L., _Deep learning approximations for non-local nonlinear PDEs with Neumann boundary conditions_. In preparation.