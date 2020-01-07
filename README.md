# trust-framework-idp

The Trust Framework Directory IDP is a Stub IDP which will serve up a Verifiable Credential to a connecting Broker. 

## Running the IDP

### Prerequisites
* Ruby

### Starting the app
There are 2 instances of the Stub IDP to simulate multiple IDPs. They can be started independently by running `startup-idp1.sh` or `startup-idp2.sh`. Alternatively they can be started together with the rest of the Trust Framework Prototype applications using the [start-all-services.sh](https://github.com/alphagov/stub-oidc-broker/blob/master/start-all-services.sh) in the Stub OIDC Broker repository.

When running locally, logs are outputted to `log/development.log`.

### Trust Framework IDP runs on the PAAS
* To deploy Trust Framework Directory  simply login to the PAAS and select the build-learn space. 
* Run `cf push` and this will deploy the app.

## License

[MIT](https://github.com/alphagov/trust-framework-idp/blob/master/LICENCE)