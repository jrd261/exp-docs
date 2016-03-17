# exp-docs

## Contributing documentation

* New doc pages go in (note the existing YML front-matter blocks at the top of each, `last_updated` can be omitted, but keep the others): https://github.com/ScalaInc/exp-docs/tree/gh-pages/_pages
* You can add your topics to both the index: https://github.com/ScalaInc/exp-docs/blob/gh-pages/_includes/index.md
* And the sidebar: https://github.com/ScalaInc/exp-docs/blob/gh-pages/_data/sidebar.yml

## Running exp-docs locally

You must have jekyll installed. For OSX that installation might look something like
```
~ $ cd exp-docs
~/exp-docs $ gem install jekyll
```

Then just run it with
```
~/exp-docs $ jekyll serve
```
It should serve at `localhost:4009`.
