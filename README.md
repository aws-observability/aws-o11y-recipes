## AWS o11y recipes

See [aws-observability.github.io/aws-o11y-recipes/][recipes-live].

## Security

See [CONTRIBUTING](CONTRIBUTING.md#security-issue-notifications) for more information.

## License

This library is licensed under the MIT-0 License. See the LICENSE file.

## Writing recipes

To write recipes we're using [MkDocs][mkdocs] with the [Material][mkdocs-material]
theme. MkDocs is a static site generator, converting the Markdown files you
edit to static HTML pages which are then served as via GitHub pages

### Local preview

In order to locally preview the recipes site you need to have MkDocs installed.

* Make sure to upgrade pip installer
```
pip3 install --upgrade pip
pip --version
```

* Install mkdocs
```
pip install mkdocs
```

* Validate mkdocs setup
```
pip check mkdocs
pip show mkdocs
```

* Depending on python version and OS configuration, execute mkdocs by running one of the following commands
```
$ python -m mkdocs [OPTIONS] COMMAND [ARGS]...
```
```
$ mkdocs [OPTIONS] COMMAND [ARGS]...
```

* Further, we depend on the Material theme and some plugins you can install as follows:

```
pip install mkdocs-material mkdocs-awesome-pages-plugin mkdocs-macros-plugin
```

To generate a local preview do:

```
$ mkdocs serve
INFO     -  Building documentation...
INFO     -  Cleaning site directory
...
```

Now head over to `http://127.0.0.1:8000/aws-o11y-recipes/` where you should
find the local preview of the recipes site.

If you are looking for formatting tips, check out the [Material theme
reference][material-formatting].

Note the following when writing a recipe:

* The recipes are located in the [docs/recipes/][recipes-home].
* The name of the recipe follows in general the dimensions, for example,
  `ec2-eks-metrics-go-adot-ampamg.md` indicates a recipe for an EKS on EC2 setup,
  showing how to ingest metrics from a Go app into AMP and consume in AMG.
* If you have any supporting files such as YAML manifests or scripts, create a
  directory with the same name as the recipe Markdown file, so in above case you
  would find a directory `docs/recipes/ec2-eks-metrics-go-adot-ampamg/` that
  contains YAML files used in the recipes.
* Put all your images, be it a screen shot or the like, into the 
  [docs/images][recipes-images] directory.
* When you create a new recipe, don't forget to link it from one of the
  top-level pages found in the `docs/` directory. For example, above recipe
  you could add to `amg.md`, `amp.md`, and `eks.md`.

**IMPORTANT** Before you send in a PR, make sure that the local preview with
`mkdocs serve` renders OK, that is, all images are shown and the rest of the
formatting, such as code, displays as you would expect.

### Publishing

Once you PR the repo, we will review and test the recipes and the merge of
your PR kicks of a [GitHub action][publishing-ghaction] that publishes your 
recipe automatically.

[recipes-live]: https://aws-observability.github.io/aws-o11y-recipes/
[mkdocs]: https://www.mkdocs.org/
[mkdocs-material]: https://squidfunk.github.io/mkdocs-material/
[material-formatting]: https://squidfunk.github.io/mkdocs-material/reference/formatting/
[recipes-home]: https://github.com/aws-observability/aws-o11y-recipes/tree/main/docs/recipes
[recipes-images]: https://github.com/aws-observability/aws-o11y-recipes/tree/main/docs/images
[publishing-ghaction]: https://github.com/aws-observability/aws-o11y-recipes/actions/workflows/main.yml
