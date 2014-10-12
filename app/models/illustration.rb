class Illustration < ActiveRecord::Base
  belongs_to :illustratable, polymorphic: true

  has_attached_file :illustration, styles: { thumbnail: "250x250>", embedded: "920x2000>" }
  
  validates_attachment :illustration, presence: true,
    content_type: { content_type: "image/jpeg" },
    size: { in: 0..5.megabytes }
  
  before_post_process :illustration_filename
  
  # Set illustration filename in the database:
  def illustration_filename
    if self.illustration.present?
      self.illustration_file_name = self.illustration_file_name.split('.')[0].to_url + ".jpg"
    end
  end
  
  # Set illustration filename in the file system:
  Paperclip.interpolates :illustration_filename do |attachment, style|
    attachment.instance.illustration_filename
  end
end
