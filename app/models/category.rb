# == Schema Information
#
# Table name: categories
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_categories_on_name  (name) UNIQUE
#

class Category < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true

  before_destroy :check_for_products, prepend: true

  private

  def check_for_products
    if ActsAsTaggableOn::Tag.find_by(name: name)&.taggings_count.to_i > 0
      errors.add(:base, "cannot delete category while products exist")
    end
    return false
  end
end
