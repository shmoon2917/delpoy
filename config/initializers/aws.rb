CarrierWave.configure do |config|
  config.fog_credentials = {
    provider:              'AWS',                        # required
    aws_access_key_id:     'AKIAJSKUGTWYUMCPEQBA',                        # required
    aws_secret_access_key: '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',                        # required
   region:                'ap-northeast-2',                  # optional, defaults to 'us-east-1'
    endpoint:              'https://s3-ap-northeast-2.amazonaws.com' # optional, defaults to nil
  }
  config.fog_directory  = 'todaytest'                          # required
end