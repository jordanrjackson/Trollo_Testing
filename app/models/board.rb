class Board < ApplicationRecord
  belongs_to :user, optional: :true

  has_many :lists, dependent: :destroy

  def self.by_name
    order(:name)
  end

  def self.by_description
    order(:description)
  end

  def changedescription(d)
    self.update(description: d)
  end

end