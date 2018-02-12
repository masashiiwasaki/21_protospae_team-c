class PrototypeTag < ActiveRecord::Base
  belong_to :post
  belong_to :tag
end
