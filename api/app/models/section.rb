class Section < ActiveRecord::Base
  has_ancestry
  belongs_to :project
end
