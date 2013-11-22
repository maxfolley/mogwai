require 'yaml'
require 'aws/s3'

class Mogwai 
  CONFIG_PATHS = ["Mogfile", "Mogfile.yml", "mogfile", "mogfile.yml"]

  class Config < Hash
    def read 
      CONFIG_PATHS.each do |path|
        if File.exists? path
          config = YAML.load_file path
          config.each_pair do |key, value|
            self[key.upcase.to_sym] = value
          end
          return
        end
      end
      raise "No Mogfile found. Please make sure you have a Mogfile present."
    end
  end

  def self.deploy
    config = Mogwai::Config.new
    config.read

    # Deploy built assets to s3
    STDOUT.sync = true
    AWS::S3::Base.establish_connection!(
      :access_key_id     => config[:AWS_ACCESS_KEY_ID],
      :secret_access_key => config[:AWS_SECRET_ACCESS_KEY]
    )

    build_dir = config[:BUILD_DIR].gsub(/([^\/])$/, '\1/')
    build_glob = build_dir + "**/*"

    Dir.glob(build_glob).each do |file|
      if File.file?(file)
        remote_file = file.gsub(build_dir, "")

        AWS::S3::S3Object.store(
          remote_file,
          open(file),
          config[:AWS_BUCKET],
          :access => :public_read
        )
      end
    end
    STDOUT.sync = false 
    return true
  end

end
