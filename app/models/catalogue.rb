# == Schema Information
#
# Table name: catalogues
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_catalogues_on_name  (name) UNIQUE
#

class Catalogue < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
end
