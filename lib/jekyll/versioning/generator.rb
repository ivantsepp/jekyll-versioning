require 'rbconfig'

module Jekyll
  module Versioning
    class Generator < Jekyll::Generator

      safe true

      def generate(site)
        current_branch = self.current_branch
        %x{git stash}
        tags.each do |tag|
          %x{git checkout #{tag}}

          config = Jekyll.configuration({
            'destination' => site.config["destination"] + "/#{tag}",
            'url' => site.config['url'].to_s + "/#{tag}"
          })

          tagged_site = Jekyll::Site.new(config)
          tagged_site.generators.delete_if {|g| g.to_s == to_s }
          tagged_site.process
        end
        site.keep_files = site.keep_files + tags
        %x{git checkout #{current_branch}}
        %x{git stash pop}
      end

      def tags
        %x{git tag -l 'v*.0.0'}.split("\n")
      end

      def to_s
        'Jekyll::Versioning'
      end

      def current_branch
        %x{git rev-parse --abbrev-ref HEAD}
      end

    end
  end
end
