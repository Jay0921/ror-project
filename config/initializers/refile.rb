require "refile/s3"

aws = {
  access_key_id: ENV["REFILE_S3_ACCESS_KEY_ID"],
  secret_access_key: ENV["REFILE_S3_SECRET_ACCESS_KEY"],
  region: ENV["REFILE_S3_REGION"],
  bucket: ENV["REFILE_S3_BUCKET"]
}

Refile.cache = Refile::S3.new(prefix: "cache", **aws)
Refile.store = Refile::S3.new(prefix: "store", **aws)
