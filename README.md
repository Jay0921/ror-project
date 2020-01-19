# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

## Requirements
- RBENV/RVM
- Ruby
- PostgreSQL
- Imagemagick

## Software versions
- Ruby: 2.6.3
- Rails: 6.0.2.1

## Capistrano
Update both `deploy.rb` and `product.rb`

## Notes
- This project is using `refile` to manage all the files or images. `Refile` has been set up to connect to `Amazon S3`, just update `S3 bucket` data in `config/initializers/refile.rb`.