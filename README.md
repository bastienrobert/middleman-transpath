# Middleman-transpath
You're using i18n for your middleman website ? This extension is for you !

## Why ?
Translating path with middleman, or access to the same page but different locale and slug is not integrate by default in middleman-i18n.

For example, you cannot access from :

`/a-propos` to `/en/about`

## Install
Add the following line to your **Gemfile**: `gem 'middleman-transpath'`
and this to your **config.rb**: `activate :transpath`

## Solution ?
Yep, easily. Install and configure i18n with your favorite locales, and don't forget to specify your default locale (for example : `activate :i18n, :mount_at_root => :fr` in your **config.rb**, to use French as default locale), check the [documentation](https://middlemanapp.com/advanced/localization/)

## Path configuration
Add a slug on your page [frontmatter](https://middlemanapp.com/basics/frontmatter/).
```YAML
---
slug: about
---
```

Then, you'll need your locales files (**/locales/LANG\_SYMBOL.yml**). For each locale, you have to set, one by one (not in a list):
- The title translation in *titles*
- The slug translation in *paths*

```YAML
titles:
  about: 'A propos' # Page title
paths:
  about: 'a-propos' # URL slug
```

If you want to see an example, go to the [wiki section](https://github.com/bastienrobert/middleman-transpath/wiki/Locale-example)

### Subdirectories
If you have subdirectories, like **/projects/project-one**, it's not a problem, set in your locales files:
```YAML
paths:
  projects: 'projects'
  project-one: 'project-one'
```

and on your page'frontmatter:
```YAML
slug: project-one
dir:
  - projects
```

You need to add all slugs, even if it's not a page. For example if you have a page like /about/me, and about is not a page, you need to set a translation for about anyway.

### Dynamic pages
When you generate dynamic pages using proxy, add `:data => { :slug => project.en.slug }`. You'll have to generate it on multiple languages like this:
```RUBY
data.projects.each do |project|
  proxy "/projets/#{project.fr.slug}/index.html", "templates/project.html", :locals => { :project => project }, :locale => :fr, :ignore => true, :data => { :slug => project.fr.slug }
  proxy "en/projects/#{project.en.slug}/index.html", "templates/project.html", :locals => { :project => project }, :locale => :en, :ignore => true, :data => { :slug => project.en.slug }
end
```

Then, the frontmatter config is a bit difficult:
```YAML
---
dynamic:
  enable: true
  data: project # The data you send using locals in your proxy
  name: name # What you want to use for your page title (here: project.name)
  slug: slug # What you want to use as slug (here: project.slug)
dir:
  - projects # You'll can access through /projects/the-project-slug
---
```

The data in the data/projects.yml looks like this:
```YAML
- fr:
    name: Premier projet
    slug: premier-projet
  en:
    name: First Project
    slug: first-project
```

### AAAAAAH! I need a complete example!
Okok, just go here, to get everyting completely detailled:
- [Simple static page](https://github.com/bastienrobert/middleman-transpath/wiki/Simple-static-page)
- [Simple static with subfolder](https://github.com/bastienrobert/middleman-transpath/wiki/Simple-static-with-subfolder)
- [Dynamic page](https://github.com/bastienrobert/middleman-transpath/wiki/Dynamic-page)

## Helper to translate the current page
Simply use the following helper to translate your current page in another language. Replace the **:fr** by the locale symbol of your choise.
```RUBY
<%= link_translate(:fr) %>
```

## Helper to translate the page title
Add `title_translate` in your layout `<title>`. It'll use the title you specified in frontmatter, automaticly.

## Contributing
1. Fork it ( https://github.com/bastienrobert/middleman-transpath/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request


## License

See LICENSE, which applies to everything in this repository.
