# == Schema Information
#
# Table name: equipment
#
#  id          :integer          not null, primary key
#  description :text
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  home_id     :integer
#
class Equipment < ApplicationRecord
end
