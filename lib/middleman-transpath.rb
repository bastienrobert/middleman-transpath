require "middleman-core"

Middleman::Extensions.register :transpath do
  require "middleman-transpath/extension"
  Transpath
end
