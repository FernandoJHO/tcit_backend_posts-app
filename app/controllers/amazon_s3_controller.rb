require './app/utils/s3_client'

class AmazonS3Controller < ApplicationController
  skip_before_action :verify_authenticity_token, :only => [:upload]

  def upload
    file = params[:file]
    name = params[:name]

    s3_client = S3Client.new

    result = s3_client.upload_file(file, name)

    render :json => result

  end

  def download
    s3_client = S3Client.new

    result = s3_client.get_file_content

    render :json => result

  end

end
