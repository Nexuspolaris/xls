# == Schema Information
#
# Table name: produits
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Produit < ApplicationRecord
  has_many :ticket
  def make_exists(name)
    find_or_create_by(name: name)
  end
end
