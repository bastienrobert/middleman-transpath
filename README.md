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
Yep, easily. Follow these steps :
- Install and configure i18n with your favorite locales! Presize your default locale too (for example : `activate :i18n, :mount_at_root => :fr` in your **config.rb**, to use French as default locale), check the [documentation](https://middlemanapp.com/advanced/localization/)
- Then, generate a file named `languages.yml`, and configure how you want your languages links to be displayed. Here an example:

```yaml
fr: "🇫🇷 - FR"
en: "🇺🇸 - EN"
```

- Wow, such great, your links are displayed ! Now, let's configure paths in the next step.

## Path configuration
Here is the most difficult part. You'll need your locales files (**/locales/YOUR\_LANG.yml**). For each locale and page, you have to set:
- The title title of the page (identifier)
- The title translation : in locale.titles
- Subdirectories dir in a list (URL direction)
- Subdirectories translation : in locale.paths (one by one, not a list)

If you want to see an example, go to the [wiki section](https://github.com/bastienrobert/middleman-transpath/wiki/Locale-example)

## Helper to translate the current page
Simply use the following helper to translate your current page in another language. Replace the **:fr** by the locale symbol of your choise.
```RUBY
<%= link_translate(:fr) %>
```

## Contributing

1. Fork it ( https://github.com/bastienrobert/middleman-transpath/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request


## License

See LICENSE, which applies to everything in this repository.
