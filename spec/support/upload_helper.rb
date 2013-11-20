module UploadHelper
  def upload_files_from_tmp
    Dir.glob("/tmp/upload-*")
  end

  def delete_upload_files 
    upload_files_from_tmp.each do |f|
    FileUtils.rm(f) 
    end
  end
end
