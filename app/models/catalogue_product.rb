# == Schema Information
#
# Table name: catalogue_products
#
#  id           :bigint           not null, primary key
#  code         :string           not null
#  point        :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  catalogue_id :bigint
#  product_id   :bigint
#
# Indexes
#
#  index_catalogue_products_on_catalogue_id  (catalogue_id)
#  index_catalogue_products_on_code          (code) UNIQUE
#  index_catalogue_products_on_product_id    (product_id)
#
# Foreign Keys
#
#  fk_rails_...  (catalogue_id => catalogues.id)
#  fk_rails_...  (product_id => products.id)
#

class CatalogueProduct < ApplicationRecord
  belongs_to :product, required: false

  validates :code, :point, presence: true
  validates :code, uniqueness: true

  validate :validate_catalogue
  before_save :upcase_fields

  def validate_catalogue
    catalogue_product = CatalogueProduct.find_by(product: product, catalogue_id: catalogue_id)
    if catalogue_product.present? && catalogue_product != self
      errors.add(:base, "You can only have one unique catalogue product")
    end
  end

  def upcase_fields
    code.upcase!
  end
end
