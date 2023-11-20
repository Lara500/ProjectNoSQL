module Mongoid
    module Document
      def as_json(options={})
        attrs = super(options)
        attrs["id"] = attrs["_id"]["$oid"]
        attrs
      end
    end
end

Mongoid.raise_not_found_error = true