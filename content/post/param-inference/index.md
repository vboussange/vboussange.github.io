---
title: Parameter Inference in dynamical systems
subtitle: One of the challenges modellers face in biological sciences is to calibrate models in order to match as closely as possible observations and gain predictive power. Scientific machine learning addresses this problem by applying optimisation techniques originally developed within the field of artificial intelligence to mechanistic models, allowing  to infer parameters directly from observation data.

# Summary for listings and search engines
summary: One of the challenges modellers face in biological sciences is to calibrate models in order to match as closely as possible observations and gain predictive power. Scientific machine learning addresses this problem by applying optimisation techniques originally developed within the field of artificial intelligence to mechanistic models, allowing  to infer parameters directly from observation data.

# Link this post with a project
projects: []

# Date published
date: "2021-01-09T00:00:00Z"

# Date updated
# lastmod: "2020-12-13T00:00:00Z"

# Is this an unpublished draft?
draft: false

# Show this page in the Featured widget?
featured: false

# Featured image
# Place an image named `featured.jpg/png` in this page's folder and customize its options here.
image:
  caption: "Calibrating a system of differential equations on data for the project Econobiology."
  focal_point: ""
  placement: 2
  preview_only: false

authors:
- admin
# - 吳恩達

tags:
- Scientific Machine Learning
- Julia

categories:
- Demo
# - 教程
---


_One of the challenges modellers face in biological sciences is to calibrate models in order to match as closely as possible observations and gain predictive power. This can be done via direct measurements through experimental design, but this process is often costly, time consuming and even sometimes not possible.
Scientific machine learning addresses this problem by applying optimisation techniques originally developed within the field of artificial intelligence to mechanistic models, allowing  to infer parameters directly from observation data.
In this blog post, I shall explain the basics of this approach, and how the Julia ecosystem has efficiently embedded such techniques into ready to use packages. This promises exciting perspectives for modellers in all areas of environmental sciences._

> 🚧 This is Work in progress 🚧

Dynamical systems are models that allow to reproduce, understand and forecast systems. They connect the time variation of the state of the system to the fundamental processes we believe driving it, that is 

$$
\begin{equation*}
\text{ time variation of }  🌍_t  = \sum \text{processes acting on }  🌍_t
\end{equation*}
$$

where $🌍_t$ denotes the state of the system at time $t$. This translates mathematically into

$$
\begin{equation}
  \partial_t(🌍_t) = f_\theta( 🌍_t )
\end{equation}
$$

where the function $f_\theta$ captures the ensembles of the processes considered, and depend on the parameters $\theta$.

Eq. (1) is a Differential Equation, that can be integrated with respect to time to obtain the state of the system at time $t$ given an initial state $🌍_{t_0}$.

$$
\begin{equation}
  🌍_t = 🌍_{t_0} + \int_0^t f_\theta( 🌍_s ) ds
\end{equation}
$$

Dynamical systems have been used for hundreds of years and have successfully captured e.g. the motion of planets ([second law of Kepler](https://en.wikipedia.org/wiki/Kepler%27s_laws_of_planetary_motion#Second_law)), [the voltage in an electrical circuit](https://en.wikipedia.org/wiki/RC_circuit#Natural_response), population dynamics ([Lotka Volterra equations](https://en.wikipedia.org/wiki/Lotka–Volterra_equations)) and morphogenesis ([Turing patterns](https://en.wikipedia.org/wiki/Turing_pattern))...

Such models can be used to **forecast the state of the system in the future**, or can be used in the sense of **virtual laboratories**. In both cases, one of the requirement is that they **reproduce patterns** - at least at a qualitative level. To do so, the modeler needs to find the true parameter combination $\theta$ that correspond to the system under consideration. And this is tricky! In this post we adress this challenge.

## Model calibration
> How to determine $\theta$ so that $\text{simulations} \approx \text{empirical data}$?

The best way to do that is to design an experiment!

<iframe src="https://giphy.com/embed/0DYipdNqJ5n4GYATKL" width="480" height="360" frameBorder="0" class="giphy-embed" allowFullScreen></iframe><p><a href="https://giphy.com/gifs/BTTF-back-to-the-future-bttf-one-0DYipdNqJ5n4GYATKL"></a></p>

When possible, measuring directly the parameters in a controlled experiment with e.g. physical devices is a great approach. This is a very powerful scientific method, used e.g. in [global circulation models](https://en.wikipedia.org/wiki/General_circulation_model) where scientists can measure the water viscosity, the change in water density with respect to temperature, etc... Unfortunately, such direct methods are often not possible considering other systems!

An opposite approach is to infer the parameters undirectly with the empirical data available.

### Parameter exploration
One way to find right parameters is to perform parameter exploration, that is, slicing the parameter space and running the model for all parameter combinations chosen. Comparing the simulation results to the empirical data available, one can elect the combination with the higher explanatory power.

But as the parameter space becomes larger (higher number of parameters) this becomes tricky. Such problem is often refered to as the [curse of dimensionality](https://en.wikipedia.org/wiki/Curse_of_dimensionality)

Feels very much like being lost in a giant maze. We need more clever technique to get out!

### A Machine Learning problem
In artificial intelligence, people try to predict a variable $y$ from predictors $x$ by finding suitable parameters $\theta$ of a parametric function $F_\theta$ so that

$$
\begin{equation}
y = F_\theta(x)
\end{equation}
$$

For example, in computer vision, this function might be designed for the specific task of labelling images, such as for instance

$F_\theta ($ ![](/images/misc/cat.png) $) \to \\{\text{cat}, \text{dog}\\}$

Usually people use neural networks, as they are good approximators for high dimensional function (see the [Universal approximation theorem](https://en.wikipedia.org/wiki/Universal_approximation_theorem)).

$$
\begin{equation*}
  F_\theta \equiv NN_\theta
\end{equation*}
$$

One should really see neural networks as functions ! For example, feed forward neural networks are mathematically described by matrix multiplications

$$
\begin{equation*}
  NN_\theta (x) = A x + b 
\end{equation*}
$$

_(without activation function)_

**Notice that Eq. (2) is similar to Eq. (3)**! Indeed one can think of $🌍_0$ as the analogous to $x$ - i.e. the predictor - and $🌍_t$ as the variable $y$ to predict.

$$
\begin{equation*}
  🌍_t = F_\theta(🌍_{t_0})
\end{equation*}
$$

where $$F_\theta (🌍_{t_0}) \equiv 🌍_{t_0} + \int_0^t f_\theta( 🌍_s ) ds .$$ 

With this perspective in mind, techniques developed within the field of Machine Learning - to find suitable parameters $\theta$ that best predict $y$ - become readily available to reach our specific needs: model calibration!


## Parameter inference 
The general strategy to find a suitable neural network that can perform the tasks required is to "train" it, that is, to find the parameters $\theta$ so that its predictions are accurate.

In order to train it, one "scores" how good a combination of parameter $\theta$ performs. A way to do so is to introduce a "**Loss function**" 

$$
\begin{equation*}
L(\theta) = (F_\theta(x) - y_{\text{empirical}})^2
\end{equation*}
$$

One can then use an optimisation method to find a local minima (and in the best scenario, the global minima) for $L$.

### Gradient descent
You ready?

<iframe src="https://giphy.com/embed/l2Je5HLxfeuppOkuc" width="480" height="270" frameBorder="0" class="giphy-embed" allowFullScreen></iframe><p><a href="https://giphy.com/gifs/toferra-ski-skiing-into-the-mind-l2Je5HLxfeuppOkuc"></a></p>

Gradient descent and stochastic gradient descent are "iterative optimisation methods that seek to find a local minimum of a differentiable function" ([Wikipedia](https://en.wikipedia.org/wiki/Gradient_descent)). Such methods have become widely used with the development of artifical intelligence.

Those methods are used to compute iteratively $\theta$ using the sensitivity of the loss function to changes in $\theta$, denoted by $\partial_\theta L(\theta)$

$$
\begin{equation*}
\theta^{i+1} = \theta^{(i)} - \lambda \partial_\theta L(\theta)
\end{equation*}
$$

where $\lambda$ is called the learning rate.


## In practice
The sensitivity with respect to the parameters $\partial_\theta L(\theta)$ is in practice obtained by differentiating the code ([Automatic Differentiation](https://en.wikipedia.org/wiki/Automatic_differentiation)).

For some programming languages this can be done automatically, with low computational cost. In particular, [Flux.jl](https://github.com/FluxML/Flux.jl) allows to efficiently obtain the gradient of any function written in the wonderful language [Julia](https://julialang.org).

The library [DiffEqFlux.jl](https://github.com/SciML/DiffEqFlux.jl) based on [Flux.jl](https://github.com/FluxML/Flux.jl) implements differentiation rules ([custom adjoints](https://juliadiff.org/ChainRulesCore.jl/stable/)) to obtain even more efficiently the sensitivity of a loss function that depends on the numerical solution of a differential equation. That is, [DiffEqFlux.jl](https://github.com/SciML/DiffEqFlux.jl) precisely allows to do parameter inference in dynamical systems. Go and check it out!