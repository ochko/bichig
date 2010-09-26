module OtfFilesHelper
  def source_url(file)
    "/system/fonts/#{file.source_name}"
  end

  def binary_url(file)
    "/system/fonts/#{file.binary_name}"
  end
end
