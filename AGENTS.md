# AGENTS.md

This guide applies to the whole repository. The site is a Hugo/Wowchemy personal website with a tag-centered content model. When adding any new publication, software package, resource, funding item, student project, or student entry, prefer structured content/data over hand-written homepage bullets.

## Core Principles

- Use `tags` as the connective tissue across posts, publications, software, resources, funding, and student projects.
- Keep item bodies minimal. Most structured records can have an empty body; use front matter for listing metadata.
- Keep descriptions short: one sentence or one line unless the item is a true article/project page.
- Do not edit generated output under `public/` or `resources/`; both are ignored build artifacts.
- Run a Hugo build after edits:

```sh
hugo --gc --minify --cleanDestinationDir
```

Use `--ignoreCache` if theme/CSS/data changes do not appear locally.

## Tags And Interests

The public topic chips under Biography come from:

```text
content/authors/admin/_index.md
```

Specifically, `interests:` is the curated public vocabulary. These terms are also normal Hugo tags, so each interest should link to `/tag/<slug>/`.

Current public interests include:

- Scientific machine learning
- Bayesian inference
- Scientific computing
- Graph neural networks
- Spatio-temporal forecasting
- Geospatial deep learning
- Partial differential equations
- Scientific software
- Spatial optimization
- Biomathematics
- Biodiversity science
- Weather and climate science
- Energy markets

Secondary technical tags such as `Julia`, `JAX`, `Python`, `Deep learning`, or `Graph theory` are fine, but do not add them to `interests:` unless they should become public top-level navigation chips.

Before finishing, check for tag drift:

```sh
rg -n "Scientific Machine Learning|Ecological Connectivity|scientific machine learning|Bayesian Inference" content data
```

Normalize case and spelling. Prefer `Biodiversity science`, `Scientific machine learning`, `Bayesian inference`, etc.

## Homepage Sections

Homepage sections live in `content/home/`.

Important generated sections:

- `content/home/software.md` uses `{{< software_list >}}`.
- `content/home/posts.md` uses `{{< post_list >}}`.
- `content/home/publications.md` uses `{{< publication_grouped_list >}}`.
- `content/home/funding.md` uses `{{< funding_list >}}`.
- `content/home/teaching.md` uses `{{< student_list >}}`.
- `content/resources.md` uses `{{< resource_list >}}`.

Do not replace these generated lists with manual bullets unless the user explicitly asks for a one-off manual item.

Long homepage lists use the shared `homepage-scroll-panel` styling in `layouts/partials/custom_head.html`. Software, publications, posts, selected funding, and students should remain independently scrollable on the homepage, with scroll chaining enabled so the page continues scrolling when a panel reaches an edge.

## Publications

Create one directory per publication:

```text
content/publication/<slug>/index.md
```

Use front matter like:

```yaml
---
title: "Paper title"
authors:
- A. Author
- admin
- B. Author
date: "2026-01-09T00:00:00Z"
publishDate: "2026-01-09T00:00:00Z"
doi: "10.xxxx/xxxxx"
publication_types: ["2"]
publication_class: peer-reviewed
publication: "Full Journal Name"
publication_short: "Full Journal Name"
abstract: ""
summary: ""
status_note: ""
tags:
- Scientific machine learning
- Biodiversity science
featured: false
url_pdf: ""
url_code: ""
url_dataset: ""
url_poster: ""
url_project: ""
url_slides: ""
url_source: ""
url_video: ""
projects: []
---
```

Publication groups are controlled by `publication_class`:

- `peer-reviewed`
- `books`
- `conference-papers`
- `preprints`

Keep `publication_types` for Wowchemy compatibility. Common values used here:

- `["2"]` for journal articles
- `["3"]` for preprints
- `["4"]` for reports
- `["7"]` for thesis-like records

Publication rendering rules:

- Publication titles are intentionally not clickable in citation and compact views.
- DOI, PDF, code, dataset, and other attachment buttons should remain clickable.
- Do not use journal abbreviations. Use full names such as `Methods in Ecology and Evolution`, not abbreviations.
- If the item says `Accepted at ...`, `Accepted in ...`, `Submitted to ...`, or `Revision requested from ...`, keep `publication` as the preprint server (`arXiv`, `bioRxiv`, `SSRN`, etc.) and put the journal/conference status in `status_note`.
- If a paper is actually published, update `publication_class`, `publication_types`, `publication`, `doi`, date, and clear or revise `status_note`.
- Browse/verify current publication metadata when the user gives a DOI, journal page, or says a status changed.

Renderer files:

- `layouts/partials/publication_grouped_list.html`
- `layouts/partials/views/citation.html`
- `layouts/partials/views/compact.html`

## Software

Create one directory per software item:

```text
content/software/<slug>/index.md
```

Use front matter like:

```yaml
---
title: PackageName.jl
summary: One-line description.
software_class: ML library
tags:
- Scientific machine learning
- Scientific software
- Julia
external_link: https://github.com/user/repo
github_user: user
github_repo: repo
github_stars: 0
date: "2026-01-01T00:00:00Z"
publishDate: "2026-01-01T00:00:00Z"
weight: 20
---
```

Allowed `software_class` values and display order:

- `ML library`
- `ML model`
- `Domain-centric library`

Optional model fields:

```yaml
model_url: https://huggingface.co/...
dataset_url: https://huggingface.co/datasets/...
app_url: https://huggingface.co/spaces/...
```

Software notes:

- The main title link comes from `external_link`.
- Add `github_user` and `github_repo` to render the GitHub star badge.
- Keep `github_stars` as a fallback count so the badge is not empty if GitHub/Shields requests fail.
- Do not duplicate GitHub button script loading; it is handled in `layouts/partials/custom_head.html`.

Renderer files:

- `layouts/partials/software_list.html`
- `layouts/partials/github_button.html`

The homepage software list is scrollable. The `/software/` section page uses `layouts/section/software.html` to render the same grouped software list in normal page flow while preserving GitHub star widgets.

## Resources

Create one directory per resource:

```text
content/resource/<slug>/index.md
```

Use front matter like:

```yaml
---
title: Resource title
summary: One-line resource description.
tags:
- Scientific computing
- Scientific software
external_link: https://example.org
date: "2026-01-01T00:00:00Z"
publishDate: "2026-01-01T00:00:00Z"
weight: 30
---
```

Resources are rendered on the dedicated `/resources/` page via `content/resources.md` and participate in tag pages.

Renderer file:

- `layouts/partials/resource_list.html`

## Funding

Create one directory per public, non-pending grant:

```text
content/funding/<slug>/index.md
```

Use front matter like:

```yaml
---
title: "Grant short title"
summary: "One-sentence description."
amount: "100,000"
currency: CHF
year: 2025
funder: SNSF Spark
tags:
- Graph neural networks
- Biodiversity science
external_link: https://data.snf.ch/grants/grant/237783
related_resources:
- slug: cords
  label: CORDS
date: "2025-01-01T00:00:00Z"
publishDate: "2025-01-01T00:00:00Z"
weight: 10
---
```

Funding notes:

- Do not add pending grants unless the user asks.
- The amount badge expects `amount` and `currency`.
- `related_resources` links to pages under `content/resource/<slug>/`.

Renderer file:

- `layouts/partials/funding_list.html`

## Students And Alumni

Homepage student rows are data-driven:

```text
data/students.yaml
```

Use:

```yaml
current:
  - name: Student Name
    role: Master thesis
    project: Project title
    project_url: /studentprojects/example/
    institution: EPFL, IC
    period: 2026
    note: Optional note
    external_link: https://public-profile.example
    image_url: https://remote-public-image.example/image.jpg
    image_position: 50% 50%

alumni:
  - name: Former Student
    role: Research internship
    institution: University
    period: 2020
```

Student image rule:

- Use `external_link` only for a student's own public homepage or profile, preferably an institutional profile, personal website, ORCID, GitHub, or similar self/profile page.
- Do not link student names to interview articles, news stories, unrelated project pages, social posts, or pages where the match is ambiguous.
- If no clearly relevant student profile is found, omit `external_link`; plain text is better than a weak link.
- Never upload student pictures to this repository.
- Only use `image_url` when it is a public remote URL from an institutional or clearly public page.
- Prefer initials unless student portraits are available consistently enough to avoid a one-off row looking different from the rest of the list.
- If no remote image is available, omit `image_url`; the renderer shows initials.
- Use `image_position` to crop remote images without copying/editing them.

Renderer files:

- `layouts/partials/student_list.html`
- `layouts/shortcodes/student_list.html`

The homepage student list is scrollable. The dedicated `/students/` page calls `{{< student_list scroll="false" >}}` so all students render in normal page flow.

## Student Projects

Student project pages live under:

```text
content/studentprojects/<slug>/index.md
```

They are real content pages and can have longer bodies. They should still include tags so tag pages aggregate them with publications/software/resources/funding.

Use canonical tags where possible. For example, prefer `Biodiversity science` and `Graph neural networks`. Avoid introducing near-duplicates like `Ecological Connectivity` unless the user explicitly wants that term.

## Theme And Custom Styling

The site uses a local Wowchemy `minimal` theme override:

```text
data/themes/minimal.toml
```

Current accent color is `#3A5A40`. Additional layout and accent overrides live in:

```text
layouts/partials/custom_head.html
```

If theme changes do not show up in the browser:

1. Run `hugo --gc --minify --cleanDestinationDir --ignoreCache`.
2. Restart `hugo server --disableFastRender --bind 127.0.0.1 --port 1313`.
3. Hard-refresh the browser tab.

## Verification Checklist

After adding or editing items:

```sh
hugo --gc --minify --cleanDestinationDir
```

Then verify:

- Homepage section renders the item in the expected group/order.
- `/resources/` renders all resource records when resources are edited.
- Relevant tag page exists, e.g. `/tag/scientific-machine-learning/`.
- Tags are consistently capitalized.
- Publication titles are not clickable in lists, but DOI/PDF/code buttons still are.
- Software GitHub star badge has a visible fallback count.
- No student photos were uploaded to the repo.
- No generated `public/`, `resources/`, `go.sum`, or `.hugo_build.lock` files are staged.

Useful checks:

```sh
git status --short
rg -n "Scientific Machine Learning|Bayesian Inference|Ecological Connectivity" content data
rg -n "JOSS|TMLR|SIAM Rev|Methods Ecol" content/publication content/home
```

## Git Hygiene

- Preserve unrelated user changes.
- Do not revert files you did not intentionally change.
- Keep commits focused when possible.
- If a server is running, do not leave stale or broken sessions around; restart cleanly when template/data changes do not appear.
