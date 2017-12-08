# Require core library
require 'middleman-core'

# Extension namespace
class Transpath < ::Middleman::Extension

  def initialize(app, options_hash={}, &block)
    super
  end

  helpers do
    def path_translate(lang)
      begin
        current_page.data.dir.map { |dir| t("paths.#{dir}", locale: lang, :default => dir) + '/'}.join('')
      rescue
        return ''
      end
    end

    def title_translate(lang)
      t("paths.#{current_page.data.title}", locale: lang, :default => current_page.data.title)
    end

    def link_translate(lang)
      return link_to data.languages.send(lang.to_s),
      if lang === I18n.default_locale
        config[:host] + '/' +
        path_translate(lang) +
        title_translate(lang)
      else
        config[:host] + '/' +
        lang.to_s + '/' +
        path_translate(lang) +
        title_translate(lang)
      end
    end
  end
end