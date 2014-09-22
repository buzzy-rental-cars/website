class Illustration < ActiveRecord::Base
  belongs_to :illustratable, polymorphic: true

  mount_uploader :illustration, IllustrationUploader
end
