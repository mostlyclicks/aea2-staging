CarrierWave.configure do |config|
	config.root = Rails.root.join('tmp')
	config.cache_dir = 'uploads'
	
	config.fog_credentials = {
		:provider					=> 'AWS',
		:aws_access_key_id			=> ENV['S3_KEY_ACCESS'],
		:aws_secret_access_key		=> ENV['S3_SECRET_KEY_ACCESS']
	}

	config.fog_directory = ENV['S3_BUCKET_NAME']
	config.fog_public = true
	config.fog_attributes = {}
	#config.asset_host = {}


end