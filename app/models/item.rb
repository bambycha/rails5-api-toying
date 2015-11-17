class Item < ActiveRecord::Base
  acts_as_copy_target

  belongs_to :supplier, foreign_key: :supplier_external_id, primary_key: :external_id

  monetize :price_cents, allow_nil: true
end
