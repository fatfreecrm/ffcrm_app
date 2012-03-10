#
# Provides easy switching between development and production gems,
# specifically for fat_free_crm, and ffcrm_* plugin gems.
# If $GEM_DEV variable is set, bundler will search for gems in the
# path specified by $GEM_DEV_DIR (or $HOME/code/gems by default.)
module Bundler
  class << self
    def development_gems=(search_strings)
      @@development_gems = search_strings
    end
    def development_gems; @@development_gems ||= []; end
  end

  class Dsl
    alias :gem_without_development :gem 
    def gem_with_development(name, *args)
      if ENV['GEM_DEV'] && Bundler.development_gems.any?{ |s| name[s] }
        gem_dev_dir = ENV['GEM_DEV_DIR'] || "#{`echo $HOME`.strip}/code/gems"
        path = File.join(gem_dev_dir, name)
        if File.exist?(path)
          return gem_without_development name, :path => path
        end
      end
      gem_without_development(name, *args)
    end
    alias :gem :gem_with_development
  end
end

