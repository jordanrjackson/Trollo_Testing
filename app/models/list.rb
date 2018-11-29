class List < ApplicationRecord
  belongs_to :boards, optional: :true
  has_many :tasks, dependent: :destroy

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