class Task < ApplicationRecord
  belongs_to :list, optional: :true

  def self.by_name
    order(:name)
  end

  def self.by_priority
    order(:priority)
  end

  def changepriority(p)
    self.update(priority: p)
  end
end