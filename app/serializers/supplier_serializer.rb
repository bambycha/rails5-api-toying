class SupplierSerializer < ActiveModel::Serializer
  attributes :id, :name, :external_id

  has_many :items
end
