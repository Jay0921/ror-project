require "refile/s3"

aws = {
  access_key_id: 'AKIAVHC7AD6LJA7U43E5',
  secret_access_key: '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',
  region: 'ap-southeast-1',
  bucket: 'ror-projects'
}

Refile.cache = Refile::S3.new(prefix: "cache", **aws)
Refile.store = Refile::S3.new(prefix: "store", **aws)
