## Braintree Store - Bark Babel

```$ bundle```

```$ bundle exec figaro install```

```$ rake db:migrate```

```$ rake db:seed```





Go to config/application.yml and add Braintree sandbox authorizations

  ```
  BT_ENVIRONMENT: 'sandbox'
  BT_MERCHANT_ID: 'yourMerchantID'
  BT_PUBLIC_KEY: 'yourPublicKey'
  BT_PRIVATE_KEY: 'yourPrivateKey'
  ```

start shopping at localhost:3000/

View a gif of the app [here](https://gfycat.com/ImpassionedAggressiveBrahmanbull)
