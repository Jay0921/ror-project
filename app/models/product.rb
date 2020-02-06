# == Schema Information
#
# Table name: products
#
#  id            :bigint           not null, primary key
#  description   :text
#  featured      :boolean
#  model         :string
#  name          :string           not null
#  status        :integer          default("draft")
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  image_id      :string
#  membership_id :bigint
#
# Indexes
#
#  index_products_on_membership_id  (membership_id)
#  index_products_on_name           (name) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (membership_id => memberships.id)
#

class Product < ApplicationRecord
  acts_as_taggable_on :categories
  attachment :image, type: :image
  enum status: %i[draft active]

  has_many :catalogue_products, dependent: :destroy
  has_one :membership

  validates :name, :description, presence: true
  validates :name, uniqueness: true

  accepts_nested_attributes_for :catalogue_products, allow_destroy: true, reject_if: :all_blank

  def product_codes
    catalogue_products.map(&:code).join(', ')
  end
end
