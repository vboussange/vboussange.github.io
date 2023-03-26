#=
File to generate the blogposts from .jmd files located in MyTutorials.

- tutorials listed in `to_generate` should be stored in folder `MyTutorials`
followng the structure `tuto/tuto.jmd`

- /!\ make sure to replace "../" by "". 
Unfortunately the code below for now is not working
```julia
open(tuto_path_hugo_md, "w") do mdfile
    replace(mdfile,"../" =>"")
end

- replace "\\" in multiline equations by \\\\
```
=#
using Weave
cd(@__DIR__)

path_to_tutorials = "/Users/victorboussange/ETHZ/projects/MyTutorials"
tuto = "PiecewiseInference"
tuto_path_jmd = joinpath(path_to_tutorials, tuto, "PiecewiseInference_tuto_3sp.jmd")

post_path = "./content/post"
tuto_path_hugo = joinpath(post_path, tuto)
tuto_path_hugo_md = joinpath(tuto_path_hugo, "index.md")

if isfile(tuto_path_hugo) # this is not working, one should check at the index.md
    @info("Skipping $(tuto)")
else
    isdir(tuto_path_hugo) ? nothing : mkpath(tuto_path_hugo)
    weave(tuto_path_jmd, doctype="hugo", out_path=tuto_path_hugo_md)
end
