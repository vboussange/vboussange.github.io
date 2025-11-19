---
title: Accelerating ecological connectivity analysis with graph neural networks 
summary: "This project develops a graph neural network approach to accelerate ecological connectivity analysis by mapping fine-scale landscape features onto lower-dimensional graph representations, overcoming the computational bottlenecks of traditional resistance distance calculations. The research aims to enable high-resolution gene flow predictions across fragmented landscapes while maintaining computational tractability, with potential applications to real-world conservation planning for identifying critical ecological corridors and restoration priorities."
tags:
- Graph theory
- Graph Neural Networks
- Ecological Connectivity
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
Landscape fragmentation represents a primary driver of biodiversity loss, leading to genetic impoverishment in ecological populations and reduced species resilience to environmental perturbations. Mitigating these effects requires identifying priority areas that function as ecological corridors to maintain connectivity (for protection) and bottleneck regions (for restoration) to enhance ecological connectivity across fragmented landscapes.

Central to this challenge is the modeling of gene flow dynamics. Gene flow between populations can be predicted through resistive distance [1], a measure of distance on a graph, applied to a spatial graph representing the landscape. 

In such spatial graphs, vertices represent discrete locations and edges are weighted by resistance values that quantify the resistance to movement imposed by landscape features for a given species. A fundamental challenge in current approaches lies in incorporating fine-grained landscape features (roads, buildings, land cover heterogeneity) into gene flow predictions while maintaining computational tractability. 

State-of-the-art methods [2] typically represent each landscape cell as a graph vertex, resulting in prohibitive computational costs for resistance distance calculations that constrain the spatial resolution achievable for predictions. 

This project explores a novel approach leveraging graph neural networks (GNNs) to address these computational limitations. GNNs provide a principled framework for learning embeddings that map fine-scale landscape features onto lower-dimensional graph representations, potentially enabling accurate gene flow predictions with significantly reduced computational overhead compared to traditional methods. Key research directions include: (1) theoretical or empirical identification of optimal graph coarsening strategies that preserve resistance distance accuracy, (2) formal characterization of approximation error bounds when computing resistive distances on reduced graphs, and (3) validation on synthetic and real-world ecological datasets with empirical genetic connectivity measurements.

The project scope is flexible and can emphasize theoretical foundations or empirical applications depending on the student's background and interests.

## References

[1] Klein, D. J., & Randić, M. (2008). Minimizing Effective Resistance of a Graph. SIAM Review. https://epubs.siam.org/doi/abs/10.1137/050645452

[2] Ghosh, A., Boyd, S., Saberi, A. (2021). Graph Learning for Inverse Landscape Genetics. AAAI. https://ojs.aaai.org/index.php/AAAI/article/view/17731
