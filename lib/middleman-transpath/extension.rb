# Require core library
require 'middleman-core'

# Extension namespace
class Transpath < ::Middleman::Extension

  def initialize(app, options_hash={}, &block)
    super
  end

  helpers do
    def link_translate_path(lang)
      begin
        current_page.data.dir.map { |dir| t("paths.#{dir}", locale: lang, :default => dir) + '/'}.join('')
      rescue
        return ''
      end
    end

    def link_translate_slug(lang)
      dynamic = current_page.data.dynamic
      unless (defined?(dynamic.enable)).nil?
        current_page
        .locals[dynamic.data.parameterize.underscore.to_sym][lang.to_s]
        .send(dynamic.slug.to_s)
      else
        t("paths.#{current_page.data.slug}", locale: lang, :default => current_page.data.slug)
      end
    end

    def title_translate
      dynamic = current_page.data.dynamic
      unless (defined?(dynamic.enable)).nil?
        current_page
          .locals[dynamic.data.parameterize.underscore.to_sym][locale.to_s]
          .send(dynamic.name.to_s)
          .capitalize
      else
        t("titles.#{current_page.data.slug}", locale: lang, :default => current_page.data.slug).capitalize
      end
    end

    def link_translate(lang)
      return link_to data.languages.send(lang.to_s),
      if lang === I18n.default_locale
        config[:host] + '/' +
        link_translate_path(lang) +
        link_translate_slug(lang)
      else
        config[:host] + '/' +
        lang.to_s + '/' +
        link_translate_path(lang) +
        link_translate_slug(lang)
      end
    end
  end
end
