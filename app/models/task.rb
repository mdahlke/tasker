class Task < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :description, presence: true
  validates :user_id, presence: true
end
