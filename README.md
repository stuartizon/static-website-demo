# Static Website Demo
Demo of the approach to host a static website using AWS and Terraform

## Local Development
- Install the dependencies: `npm install`
- Start the development server: `npm start`
- Navigate to `localhost:3000`

# Deployment
1. Firstly set up an AWS account.

2. Register a domain name. You can do this through AWS or something else, but you will need to set up your nameservers manually if you do it outside AWS.

3. Set up a Route 53 hosted zone for your domain name. (This could also be automated with Terraform config, but I've left it as a manual step for now)

4. Create an IAM user with admin access at the very least to the following policies. ()
    - AWSLambdaFullAccess
    - IAMFullAccess
    - AmazonS3FullAccess
    - CloudFrontFullAccess
    - AmazonAPIGatewayAdministrator
    - AmazonRoute53FullAccess
    - AWSCertificateManagerFullAccess

   If this user is not set up with the correct access, then some of the resources will fail to create when running Terraform. Ensure this user has programmatic access. Note the access key ID and secret access key.

5. Fork the repo (or clone it locally, but you will need to run the pipeline steps manually). Modify the domain name in the [CI workflow](.github/workflows/ci.yml).

6. Set up variables using GitHub secrets for `AWS_ACCESS_KEY_ID` and `AWS_SECRET_ACCESS_KEY`. (Define environment variables in your shell if you are running the pipeline steps locally.)
