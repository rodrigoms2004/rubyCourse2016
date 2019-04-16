module I18n
  module Backend
    module Base
      def load_file(filename)
        type = File.extname(filename).tr('.', '').downcase
        raise UnknownFileType.new(type, filename) unless self.methods.include?(:"load_#{type}")
        data = send(:"load_#{type}", filename) # TODO raise a meaningful exception if this does not yield a Hash
        data.each { |locale, d| store_translations(locale, d) }
      end
    end
  end
end

module ActiveRecord
  module Associations
    class AssociationCollection
      def proxy_respond_to?(method, include_private = false)
        super(method, true) || @reflection.klass.respond_to?(method, true) #include_private)
      end
    end
  end
end

class ActiveRecord::Base
  def assign_attributes(attributes={})
    multiparameter_attributes = []

    attributes.each do |k, v|
      if k.to_s.include?("(")
        multiparameter_attributes << [ k, v ]
      else
        respond_to?(:"#{k}=", true) ? send(:"#{k}=", v) : raise(ActiveRecord::UnknownAttributeError, "unknown attribute: #{k}")
      end
    end

    assign_multiparameter_attributes(multiparameter_attributes) unless  multiparameter_attributes.empty?
  end
end
