class Tag < ActiveRecord::Base

  has_many :tag_prototype_indices, dependent: :destroy
  has_many :prototypes, :thorough => :tag_prototype_indices

end
