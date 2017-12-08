require "middleman-core"

Middleman::Extensions.register :middleman-transpath do
  require "middleman-transpath/extension"
  Transpath
end
