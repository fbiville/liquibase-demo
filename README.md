# Liquibase 2 sample

## Context
These are the sources originally used in my short demo from my quickie "(R)évolutionnez vos bases de données" in Devoxx FR, April 20th 2012.
You can find the slides on [Slideshare](http://www.slideshare.net/fbiville/rvolutionnez-vos-bases-de-donnes-avec-liquibase-12635225).
This has since been a bit updated.

## Setup
Once locally cloned, please ensure the following requirements are met:

 1. tailor `environments/local/liquibase.properties` database connection settings to your needs
 2. `cd environments; ln -s local/liquibase.properties my.properties`
 3. (optional) execute `git update-index --assume-unchanged environments/local/liquibase.properties`
 
Step 2 can be avoided if you explicitly override `env.file` property from the POM during Maven invocation, such as in:

`mvn -Denv.file=/path/to/my.properties`.

## Dry run
Simply run `mvn` to implicitly run integration tests and dry run Liquibase.

## Real run
Run `mvn verify liquibase:update`.

## Troubleshooting
Ping me on Twitter (@fbiville) if you face any problems!