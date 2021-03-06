class Todo < ActiveRecord::Base
  belongs_to :project, counter_cache: true
  has_many :comments, dependent: :destroy

  scope :ordered,   -> { order("created_at ASC") }
  scope :completed, -> { where(complete: true ) }
  scope :recently_updated, -> { order("updated_at DESC")}
  def user
    project.user
  end
end
