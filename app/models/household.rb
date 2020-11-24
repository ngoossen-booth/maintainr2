# == Schema Information
#
# Table name: households
#
#  id         :integer          not null, primary key
#  nickname   :string
#  picture    :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  owner_id   :integer
#
class Household < ApplicationRecord
end
