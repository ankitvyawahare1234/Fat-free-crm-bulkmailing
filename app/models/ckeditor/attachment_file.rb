class Ckeditor::AttachmentFile < Ckeditor::Asset
  has_attached_file :data,
                    :url  => ("http://" + $request.host_with_port + "/assets/ckeditor_assets/pictures/:id/:style_:basename.:extension"),
                     :path => ":rails_root/app/assets/images/ckeditor_assets/pictures/:id/:style_:basename.:extension"
  
  validates_attachment_size :data, :less_than => 100.megabytes
  validates_attachment_presence :data

  def url_thumb
    @url_thumb ||= Ckeditor::Utils.filethumb(filename)
  end
end
