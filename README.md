[![Build](https://github.com/utPLSQL/utPLSQL-demo-project/actions/workflows/build.yml/badge.svg)](https://github.com/utPLSQL/utPLSQL-demo-project/actions/workflows/build.yml)
[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=utPLSQL%3AutPLSQL-demo-project&metric=alert_status)](https://sonarcloud.io/dashboard?id=utPLSQL%3AutPLSQL-demo-project)


# CI/CD and Unit Testing for Oracle PLSQL

## Demo project using utPLSQL, Travis and SonarCloud for continuous integration of PLSQL and SQL code. 


This is a demo project using [utPLSQL v3](https://github.com/utPLSQL/utPLSQL) for unit testing of Oracle PLSQL code.
The project is also taking benefit of Continuous Integration with Travis CI server as well as static code analysis, code coverage and test results reporting using SonarCloud.

With every commit made to the github repository, a build job is executed using [Travis](https://travis-ci.org/utPLSQL/utPLSQL-demo-project) CI.

The build process consists of following steps:
- Download Oracle Database 11g XE
- Download [latest release of utPLSQL](https://github.com/utPLSQL/utPLSQL/releases/latest)
- Install Oracle Database
- Install [utPLSQL](https://github.com/utPLSQL/utPLSQL) framework
- Install [project sources](source/install.sh)
- Install [unit tests](test/install.sh)
- Download and unzip the [utplsql-cli](https://github.com/utPLSQL/utPLSQL-cli) project binaries
- [Execute all tests](test/run.sh) on the project
- Publish [test results](https://sonarcloud.io/component_measures/metric/tests/list?id=utPLSQL%3AutPLSQL-demo-project) and [code coverage](https://sonarcloud.io/component_measures/metric/coverage/list?id=utPLSQL%3AutPLSQL-demo-project) to [SonarQube](https://sonarcloud.io/) cloud service

## Demo project using utPLSQL, Azure Devops and SQLCL Liquibase for continuous integration of PLSQL and SQL code. 

This is a demo project using [utPLSQL v3](https://github.com/utPLSQL/utPLSQL) for unit testing of Oracle PLSQL code.
The project is also taking benefit of Continuous Integration with Azure Devops server as well as static code analysis, code coverage and test results reporting using SonarCloud.

With every commit made to the github repository, a pipeline is executed using [AzureDevops](https://dev.azure.com/utplsql/utplsql/_build) CI.
The pipeline is setup into stages.
- Build Database: During this stage we are deploying our code using SQLCL Liquibase. This ensures that syntax of command is correct as well as integrity of changes with others Tests are deployed to that database and executed. In our scenario we are forcing the failure into success using utplsqlcli option `--failure-exit-code=0`. Code coverage and test results are published and immutable artifact is created that will be propagated to next stages of deployment.
  - Build Stage consists of following steps:
    - Download binaries for utplsqlcli and sqlcl *(this step is optional, its possible that in self hosted agent this will be part of agent etc.)*
    - Provision a database from docker *(this steps is optional and depends on your setup of databases)*
    - Clone utplsql repository and install utPLSQL
    - Create test user and install test packages
    - Execute Liquibase update to deploy code
    - Execute tests
    - Publish test results
    - Execute sonar analysis
    - Copy source code and publish to artefact staging for publish


- Deploy Code to Database: During this stage we are using an artefact created in previous stage that was tested and deploying to the actual database ( DEV,PRD, UAT, NFT etc.), running tests is optional depends on project setup and the stage ( we will not be deploying tests to PRD but possible to DEV yes)
  - Deploy Stage consists of following steps:
    - Download binaries for utplsqlcli and sqlcl *(this step is optional, its possible that in self hosted agent this will be part of agent etc.)*
    - Provision a database from docker *( this step most likely you will not run as these databases will exists already)*
    - Create user to deploy code to *( this step most likely you will not run as the user will exists already)*
    - Execute Liquibase update to deploy code


## Demo project using utPLSQL, Azure Devops and Flyway for continuous integration of PLSQL and SQL code. 