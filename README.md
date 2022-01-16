[![Build](https://github.com/utPLSQL/utPLSQL-demo-project/actions/workflows/build.yml/badge.svg)](https://github.com/utPLSQL/utPLSQL-demo-project/actions/workflows/build.yml)
[![Quality Gate Status](https://sonarcloud.io/api/project_badges/measure?project=utPLSQL%3AutPLSQL-demo-project&metric=alert_status)](https://sonarcloud.io/dashboard?id=utPLSQL%3AutPLSQL-demo-project)


# CI/CD and Unit Testing for Oracle PLSQL
Demo project using utPLSQL, Travis and SonarCloud for continuous integration of PLSQL and SQL code. 


This is a demo project using [utPLSQL v3](https://github.com/utPLSQL/utPLSQL) for unit testing of Oracle PLSQL code.
The project is also taking benefit of Continuous Integration with Travis CI server as well as static code analysis, code coverage and test results reporting using SonarQube.

With every commit made to the GitHub repository, a build job is executed using [Travis](https://travis-ci.org/utPLSQL/utPLSQL-demo-project) CI.

The build process consists of following steps:
- Download Oracle Database 11g XE
- Download the [latest release of utPLSQL](https://github.com/utPLSQL/utPLSQL/releases/latest)
- Install Oracle Database
- Install [utPLSQL framework](scripts/1_install_utplsql.sh)
- Install [project sources](scripts/2_install_demo_project.sh)
- Install [unit tests](scripts/3_install_tests.sh)
- Download and unzip the [utplsql-cli](https://github.com/utPLSQL/utPLSQL-cli) project binaries
- [Execute all tests](scripts/4_run_tests.sh) on the project
- Publish [test results](https://sonarcloud.io/component_measures/metric/tests/list?id=utPLSQL%3AutPLSQL-demo-project) and [code coverage](https://sonarcloud.io/component_measures/metric/coverage/list?id=utPLSQL%3AutPLSQL-demo-project) to [SonarQube](https://sonarcloud.io/) cloud service


