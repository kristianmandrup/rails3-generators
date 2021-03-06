require 'generators/machinist'

module Machinist
  module Generators
    class ModelGenerator < Base
      argument :attributes, :type => :array, :default => [], :banner => "field:type field:type"
      class_option :dir, :type => :string, :default => "test/blueprints", :desc => "The directory where the blueprints should go"
      class_option :extenstion, :type => :string, :default => "rb", :desc => "file extenstion name"
      
      def create_machinist_initializer
        return if File.exists?(File.expand_path("config/initializers/machinist.rb", self.destination_root))
        template "machinist_initializer.rb", "config/initializers/machinist.rb"
      end
      
      def create_blueprint_file
        template 'blueprint.rb', File.join(options[:dir], "#{table_name}.#{options[:extenstion].to_s}")
      end
    end
  end
end
