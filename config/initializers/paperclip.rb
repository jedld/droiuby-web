PAPERCLIP_OPTIONS = {}

PAPERCLIP_OPTIONS = {
    :storage => :s3,
    :s3_credentials => {
    :bucket            => ENV['S3_BUCKET_NAME'],
    :access_key_id     => ENV['AWS_ACCESS_KEY_ID'],
    :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']}
} if Rails.env.production?


