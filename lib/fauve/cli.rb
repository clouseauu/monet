require 'trollop'
require 'rails'

module Fauve

  #fauve -o x/y/x.html [rails/public] -i x/y/z.yml [rails/config/fauve.xml] -v [variations default true]

  module CLI

    def run
    end

    module_function :run

    def options
      # Trollop::options do
      #   opt :output, "Output",  :type => :string, :default => ( defined?(Rails) ? Rails.public_path.to_s : "./" )
      #   opt :input, "Input",    :type => :string, :default => ( defined?(Rails) ? "#{Rails.root}/config" : "./" )
      #   opt :skip_variations, "Skip variations", :short => "-v"
      # end
    end
    module_function :options


  end

end