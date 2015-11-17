class Supplier < ActiveRecord::Base
  acts_as_copy_target

  has_many :items, foreign_key: :supplier_external_id, primary_key: :external_id
end
