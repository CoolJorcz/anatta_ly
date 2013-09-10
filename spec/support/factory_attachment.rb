FactoryGirl.class_eval do
  def attachment(name, path, content_type = "image/jpg")
    path_with_rails_root = "#{Rails.root}/#{path}"
    uploaded_file = fixture_file_upload(path_with_rails_root, content_type)
 
    add_attribute name, uploaded_file
  end
end