CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     'AKIAJMYJJSJZQQI25EHA',                        # required
    aws_secret_access_key: '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',                        # required
    region:                'ap-northeast-2',                  # optional, defaults to 'us-east-1'
    endpoint:              'https://s3-ap-northeast-2.amazonaws.com' # optional, defaults to nil
  }
  config.fog_directory  = 'todaytest'                          # required
end