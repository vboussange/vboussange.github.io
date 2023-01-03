---
title: "Mini-batching ecological data to improve ecosystem models with machine learning"

# Authors
# If you created a profile for a user (e.g. the default `admin` user), write the username (folder name) here 
# and it will be replaced with their full name and linked to their profile.
authors:
- admin
- Pau Vilimelis Aceituno
- Loïc Pellissier

# Author notes (optional)
# author_notes:
# - "Equal contribution"
# - "Equal contribution"

date: "2022-07-26T00:00:00Z"
doi: "10.1101/2022.07.25.501365"

# Schedule page publish date (NOT publication's date).
publishDate: "2017-01-01T00:00:00Z"

# Publication type.
# Legend: 0 = Uncategorized; 1 = Conference paper; 2 = Journal article;
# 3 = Preprint / Working Paper; 4 = Report; 5 = Book; 6 = Book section;
# 7 = Thesis; 8 = Patent
publication_types: ["2"]

# Publication name and optional abbreviated publication name.
publication: bioRxiv
publication_short:

abstract: Ecosystems are involved in global biogeochemical cycles that regulate climate and provide essential services to human societies. Mechanistic models are required to describe ecosystem dynamics and anticipate their response to anthropogenic pressure, but their adoption has been limited in practice because of issues with parameter identification and because of model inaccuracies. While observations could be used to directly estimate parameters and improve models, model nonlinearities as well as shallow, incomplete and noisy datasets complicate this process. Here, we propose a machine learning (ML) framework relying on a mini-batch method combined with automatic differentiation and state-of-the-art optimizers. By splitting the data into mini-batches with a short time horizon, we show both analytically and numerically that the mini-batch method regularizes the learning problem. When combined with the proposed numerical implementation, the resulting ML framework can efficiently learn the parameter of complex dynamical models and is a workhorse for model selection. We evaluate the performance of the ML framework in recovering the dynamics of a simulated food-web. We show that it can efficiently learn from noisy, incomplete and independent time series, accurately estimating the model parameters and providing reliable short-term forecasts. We further show that the ML framework can provide statistical support for the true generating model among several candidates. In summary, the proposed ML framework can efficiently learn from data and elucidate mechanistic pathways to improve our understanding and predictions of ecosystem dynamics.

# Summary. An optional shortened abstract.
summary: Ecosystems are involved in global biogeochemical cycles that regulate climate and provide essential services to human societies. Mechanistic models are required to describe ecosystem dynamics and anticipate their response to anthropogenic pressure, but their adoption has been limited in practice because of issues with parameter identification and because of model inaccuracies. We propose a machine learning (ML) framework relying on a mini-batch method combined with automatic differentiation and state-of-the-art optimizers. The proposed ML framework can efficiently learn from data and elucidate mechanistic pathways to improve our understanding and predictions of ecosystem dynamics.

tags: [Scientific machine learning, Inverse modelling, Ecosystem modelling, Model selection, Food-webs]

# Display this page in the Featured widget?
featured: true

# Custom links (uncomment lines below)
# links:
# - name: Custom Link
#   url: http://example.org

url_pdf: 'https://www.biorxiv.org/content/10.1101/2022.07.25.501365v1'
url_code: 'https://github.com/vboussange/mini-batching-ecological-data'
url_dataset: ''
url_poster: ''
url_project: ''
url_slides: ''
url_source: ''
url_video: ''

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder. 
# Placement options: 1 = Full column width, 2 = Out-set, 3 = Screen-width
# Focal point options: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight
# Set `preview_only` to `true` to just use the image for thumbnails.
image:
  # placement: ["1"]
  caption: 'Graphical representation of the proposed learning strategy to improve ecosystem models with data. To regularise the learning problem associated with complex ecosystem models, the time series is split into mini-batches with short time horizons (blue and red portions of the time series).'
  # focal_point: "Center"
  preview_only: false

# Associated Projects (optional).
#   Associate this publication with one or more of your projects.
#   Simply enter your project's folder or file name without extension.
#   E.g. `internal-project` references `content/project/internal-project/index.md`.
#   Otherwise, set `projects: []`.
projects:
- ecology-informed-ML

# Slides (optional).
#   Associate this publication with Markdown slides.
#   Simply enter your slide deck's filename without extension.
#   E.g. `slides: "example"` references `content/slides/example/index.md`.
#   Otherwise, set `slides: ""`.
# slides: example
---
<!-- 
{{% callout note %}}
Click the *Cite* button above to demo the feature to enable visitors to import publication metadata into their reference management software.
{{% /callout %}}

{{% callout note %}}
Create your slides in Markdown - click the *Slides* button to check out the example.
{{% /callout %}}

Supplementary notes can be added here, including [code, math, and images](https://wowchemy.com/docs/writing-markdown-latex/). -->
