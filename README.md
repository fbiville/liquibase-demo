# Liquibase 2 sample

## Context

These are the sources used in my short demo from my quickie "(R)évolutionnez vos bases de données" in Devoxx FR, April 20th 2012.
You can find the slides on [Slideshare](http://www.slideshare.net/fbiville/rvolutionnez-vos-bases-de-donnes-avec-liquibase-12635225).

## Setup

Once locally cloned, please ensure the following requirements are met:

 1. tailor `environments/local/liquibase.properties` database connection settings to your needs
 2. `cd environments; ln -s local/liquibase.properties current.properties`
 
Step 2 can be avoided if you explicitly override 'env.file' property from the POM during Maven invocation, such as in:

`mvn liquibase:updateSQL -Denv.file=/path/to/my.properties`.

Ping me on Twitter if you face any problems!