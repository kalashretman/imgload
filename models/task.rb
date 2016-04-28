class Task
  include Mongoid::Document

  field :task,    type: Float
  field :params,  type: Float
  field :link,    type: String

  mount_uploader :image, ImageUploader
end
