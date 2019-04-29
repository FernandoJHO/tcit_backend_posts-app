require 'aws-sdk'

class S3Client

    BUCKET = 'bucketfernandojho'
    ACCESS_ID = 'AKIAI2X3B2RUE7R6MMHA'
    SECRET_KEY = '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'
    PROFILE_NAME = 'fernandojho'
    REGION = 'us-west-1'
    AWS_URL = 'https://s3-us-west-1.amazonaws.com/'

    def upload_file(file, name)
        Aws.use_bundled_cert!

        created = false

        folder_path = "carpeta1/"+name

        s3 = Aws::S3::Client.new(
            access_key_id: ACCESS_ID,
            secret_access_key: SECRET_KEY,
            profile: PROFILE_NAME,
            region: REGION
          )

        s3.put_object({acl: "public-read", bucket: BUCKET, key: folder_path, body: file})

        resp = s3.list_objects_v2(bucket: BUCKET)

        resp.contents.each do |obj|
          if obj.key == folder_path
            created = true
          end
        end

        if created
            result = {:estado => 1, :url => AWS_URL+BUCKET+'/'+folder_path}
        else
            result = {:estado => 0}
        end

        return result
    end

    def get_file_content
        Aws.use_bundled_cert!

        s3 = Aws::S3::Client.new(
          access_key_id: ACCESS_ID,
          secret_access_key: SECRET_KEY,
          profile: PROFILE_NAME,
          region: REGION
        )

        resp = s3.get_object({bucket: BUCKET, key: "carpeta1/archivo1"})

        return resp.body.read
    end

end