# == Schema Information
#
# Table name: pugs
#
#  id         :uuid             not null, primary key
#  age        :integer          default(0)
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Pug < ApplicationRecord
end
