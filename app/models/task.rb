class Task < ApplicationRecord
    include PgSearch

    pg_search_scope :search_for, against: [ :name, :description, :date]

belongs_to :user

validates :done, default: false, null: false

scope :own_task, -> user { where(user: user) }


  def self.unfinished?
    Task.where(done: false)
  end

  def self.completed?
    Task.where(done: true)
  end


end
