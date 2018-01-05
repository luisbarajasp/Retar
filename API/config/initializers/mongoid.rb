module Mongoid
    module Document
        # convert object key "_id" to "id"
        # def as_json(options={})
        #     attrs = super(options)
        #     attrs["id"] = attrs["_id"].to_s
        #     attrs
        # end
    end
end