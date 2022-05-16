---
title: "Highly dimensional non-local non-linear PDEs in Biology, Finance and Economics"
summary: ""
authors: []
tags: []
categories: []
date: 2021-05-01T00:20:37+01:00
draft: true

# Optional external URL for project (replaces project detail page).
external_link: ""

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
image:
  caption: "Phenotypic diversity in Hemerocallis. Plants can be caracterised by many different traits, all of which can be assigned numerical values:  Flower colour, Specific Leaf Area (SLA), seed mass, Plant nitrogen fixation capacity, Leaf shape, Flower sex, plant woodiness. Source: [H Cui et al. 2019](https://doi.org/10.1371/journal.pone.0216460)"
  focal_point: ""

authors:
- admin

tags:
- Deep Learning
- Scientific Machine Learning

categories:
- Scientific Machine Learning
---

PDEs are useful mathematical objects to model a variety of processes in fields such as physics, engineering, finance and biology.

Non-local PDE models are generalisations of their local counterparts and provide more accurate predictions since they can for example capture non-local interactions. Yet they lead to further complications in obtaining approximation solutions. Non-local nonlinear PDEs can generally not be solved analytically in practical cases, and it is one of the most challenging issues in applied mathematics and numerical analysis to design and analyze approximation methods.

### Where do such equations arise?
In **finance**, non-local PDEs arise e.g. in jump-diffusion models for the pricing of derivatives, where underlying stochastic processes experience large jumps.  Nonlinearities occur when considering e.g. large investor, where the agent policy affects the assets prices, considering default risks, transactions costs or Knightian uncertainty. 

In **economics**, non-local nonlinear PDEs arise e.g. in evolutionary game theory with the so-called replicator mutator equation considering infinite strategy spaces, or in growth model where consumption is non-local. 

In **biology**, non-local nonlinear PDEs appear e.g. in models of morphogeneis and cancer evolution, or in models of gene regulatory networks. They are also present in many models of evolution, for example in population genetics with the non-local Fisher KPP equation, or in quantitative genetics where populations are structured with quantitative traits.

### Why is it important to solve such equations in high dimensions
In financial modelling, the dimensionality of the problem corresponds to the **number of financial assets** (such as stocks, commodities, exchange rates and interest rates) in the involved portfolio. In evolutionary dynamics, it relates to the dimension of the **strategy space**. In biology, it usually corresponds to the dimension of the **phenotypic space** and / or of the **geographical space** that represent the population. 