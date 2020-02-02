# == Schema Information
#
# Table name: products
#
#  id          :bigint           not null, primary key
#  description :text
#  featured    :boolean
#  model       :string
#  name        :string           not null
#  status      :integer          default("draft")
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  image_id    :string
#
# Indexes
#
#  index_products_on_name  (name) UNIQUE
#

class Product < ApplicationRecord
  attachment :image, type: :image
  enum status: %i[draft active]

  validates :name, :description, presence: true
  validates :name, uniqueness: true
end
