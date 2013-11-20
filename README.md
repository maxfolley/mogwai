![mogwai](https://raw.github.com/maxfolley/mogwai/master/mogwai.jpg)
# Mogwai

Mogwai is a ruby gem that recursively deploys the contents of a folder to an s3 bucket.

## How to    

Just include mogwai in your gemfile

    gem 'mogwai'

Create a Mogfile in the root of your project, with the following specified

    # Your aws access key
    AWS_ACCESS_KEY_ID: '11111111111111111111'
    # your aws secret key
    AWS_SECRET_ACCESS_KEY: '2222222222222222222222222222222222222222'
    # optional
    AWS_REGION: 'us-standard'
    # The bucket you are publishing to
    AWS_BUCKET: 'my-bucket'
    # Directory to upload to s3 bucket
    BUILD_DIR: 'build'

To deploy, run the mogwai command

    $ mogwai

The contents of the 'build' directory will now reside at the root of the s3 bucket.
