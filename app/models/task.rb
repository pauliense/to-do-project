class Task < ApplicationRecord
    include PgSearch

    pg_search_scope :search_for, against: [ :name, :description, :date, :category]

belongs_to :user




  CATEGORY = ["very happy", "excited", "content", "stressed out", "angry", "sad"]

  validates :category, presence: true, inclusion: { in: CATEGORY, allow_nil: false }

validates :done, default: false, allow_nil: false
validates :name, presence: true


scope :own_task, -> user { where(user: user) }


  def self.unfinished?
    Task.where(done: false)
  end

  def self.completed?
    Task.where(done: true)
  end

end
