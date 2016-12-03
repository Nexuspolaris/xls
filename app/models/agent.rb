# == Schema Information
#
# Table name: agents
#
#  id         :integer          not null, primary key
#  name       :string
#  service_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

# Class Agent
class Agent < ApplicationRecord
  has_many :ticket
end
