# Require core library
require 'middleman-core'

# Extension namespace
class Transpath < ::Middleman::Extension

  option :label, {en: '🇺🇸 - EN', fr: '🇫🇷 - FR'}, 'This hash should contain the lang symbol and his label'

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
        r = current_page
            .locals[dynamic.data.parameterize.underscore.to_sym]
        if dynamic.name_and_slug_translate == false
          r = r.send(dynamic.slug.to_s)
        else
          r = r[lang.to_s].send(dynamic.slug.to_s)
        end
      else
        t("paths.#{current_page.data.slug}", locale: lang, :default => current_page.data.slug)
      end
    end

    def title_translate
      dynamic = current_page.data.dynamic
      unless (defined?(dynamic.enable)).nil?
        r = current_page
          .locals[dynamic.data.parameterize.underscore.to_sym]
        if dynamic.name_and_slug_translate == false
          r = r.send(dynamic.name.to_s).capitalize
        else
          r = r[locale.to_s].send(dynamic.name.to_s).capitalize
        end
      else
        r = t("titles.#{current_page.data.slug}", locale: lang, :default => "").capitalize
      end
      if r == ""
        r = data.meta.title
      else
        r = data.meta.title + " | " + r
      end
      return r
    end

    def description_translate
      dynamic = current_page.data.dynamic
      unless (defined?(dynamic.enable)).nil?
        current_page
          .locals[dynamic.data.parameterize.underscore.to_sym][locale.to_s]
          .send(dynamic.description.to_s)
          .capitalize
      else
        t("descriptions.#{current_page.data.slug}", locale: lang, :default => data.meta.description).capitalize
      end
    end

    def link_translate(lang, params={})
      return link_to (params[:label] ||= params['label'] ||= extensions[:transpath].options.label[lang]),
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
