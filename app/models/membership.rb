# == Schema Information
#
# Table name: memberships
#
#  id         :bigint           not null, primary key
#  message    :text
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_memberships_on_name  (name) UNIQUE
#

class Membership < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true

  has_many :products
end
