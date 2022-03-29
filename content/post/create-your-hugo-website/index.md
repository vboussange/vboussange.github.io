---
# Documentation: https://wowchemy.com/docs/managing-content/

title: "Create and deploy your Hugo website"
subtitle: ""
summary: ""
authors: []
tags: []
categories: []
date: 2022-03-27T17:40:15+02:00
lastmod: 2022-03-27T17:40:15+02:00
featured: false
draft: false

# Featured image
# To use, add an image named `featured.jpg/png` to your page's folder.
# Focal points: Smart, Center, TopLeft, Top, TopRight, Left, Right, BottomLeft, Bottom, BottomRight.
image:
  caption: ""
  focal_point: ""
  preview_only: false

# Projects (optional).
#   Associate this post with one or more of your projects.
#   Simply enter your project's folder or file name without extension.
#   E.g. `projects = ["internal-project"]` references `content/project/deep-learning/index.md`.
#   Otherwise, set `projects = []`.
projects: []
---
This website is based on the [wowchemy template]() that relies on [Hugo](https://gohugo.io), a fast framework for building static websites. Although Hugo has many advantages over its brother Jekyll, a Hugo website is not as easy to deploy on [GitHub Pages](https://pages.github.com), the free service offered by GitHub to host a personal website. If you want to build your Hugo website and deploy it easily, here is the recipe.

## Build your Hugo website
- Fork the [github repo](https://github.com/wowchemy/starter-hugo-academic) of the wowchemy template.
- Rename the repo as `your-username.github.io`
- Clone the repo and customise the template following your own taste, following the [wowchemy tutorial](https://wowchemy.com/docs/getting-started/).
- You can locally build the website with the command `hugo server`
and access it at the adress indicated in the the text printed after the execution of the command.
- Once you are satified with your local website, it is time to publish it! I found out that the easiest way to do so is to create a GitHub Action.

## Deploy automatically a Hugo website on GitHub pages
Here I detail how to set up a workflow that will build your website and publish it at each new commit. The idea is to set up a GitHub Action, which job will be to 
1. Clone the `master` from your repo
2. Build the Hugo website
3. Create / clone a `gh-pages` branch
4. Copy the static files generated in 2. to the `gh-pages` repo
5. Push those changes to the `gh-pages`.

To do so, first create a file `.github/workflows/gh-pages.yml` and add the following content, replacing `your-username` by your ... username.
```
name: Build and Deploy

on:
  push:
    branches:
      - master

jobs:
  build:

    runs-on: ubuntu-latest

    steps:
    - name: Checkout master
      uses: actions/checkout@v1
      with:
        submodules: true

    - name: Hugo Deploy GitHub Pages
      uses: benmatselby/hugo-deploy-gh-pages@master
      env:
        GO_VERSION: 1.17
        HUGO_VERSION: 0.95.0
        HUGO_EXTENDED: true
        TARGET_REPO: your-username/your-username.github.io
        TARGET_BRANCH: gh-pages
        TOKEN: ${{ secrets.TOKEN_HUGO_DEPLOY }}
        CNAME: vboussange.github.io
```
You then need to generate a personnal access token. [Here is a tutorial to do so](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/creating-a-personal-access-token). Tick the box "repo", to grant full control of private repo. More details on why you need to do so are given in Jame Wright post (see below). Copy the generated code, and go in the settings of your "your-username.github.io" repo. There, [create a secret](https://docs.github.com/en/actions/security-guides/encrypted-secrets), call it `TOKEN_HUGO_DEPLOY` and paste the previously generated token.

You are almost all set! Make your first commit. Wait for the action to execute. Once you see the green badge symbolising the success of the deployment Action, go to the Settings of your repo, and in "Pages" in the left side bar, under "Source" select the branch `gh-pages`. After a few minutes, your website should be available at https://your-username.github.io/.

Enjoy!

> This post was greatly inspired by [James Wright blog post](https://www.jameswright.xyz/post/20200409/deploy_wowchemy_to_githubio/) on the same topic, although his Github Action was not quite working for me.