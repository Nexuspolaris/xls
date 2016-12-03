# == Schema Information
#
# Table name: ss_categories
#
#  id           :integer          not null, primary key
#  name         :string
#  categorie_id :integer
#  type         :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class SsCategorie < ApplicationRecord
  has_many :ticket
  def make_exists(name)
    find_or_create_by(name: name)
  end
end
