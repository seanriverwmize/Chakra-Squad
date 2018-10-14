if Rails.env.production?
  Rails.configuration.stripe = {
    publishable_key: ENV['STRIPE_PUBLISHABLE_KEY'],
    secret_key: ENV['STRIPE_SECRET_KEY']
  }
else
  Rails.configuration.stripe = {
    publishable_key: 'pk_test_i3h1i4SpNxrpLEvVdXqkiwNC',
    secret_key: 'sk_test_xz3CvUttnPYRVY3KyWblVjIK'
  }
end
