# == Schema Information
#
# Table name: clothes
#
#  id          :integer          not null, primary key
#  description :text
#  quantity    :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  home_id     :integer
#
class Clothe < ApplicationRecord
end
