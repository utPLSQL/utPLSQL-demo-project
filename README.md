[![build](https://img.shields.io/travis/utPLSQL/utPLSQL-demo-project/develop.svg?label=develop%20branch)](https://travis-ci.org/utPLSQL/utPLSQL-demo-project)
[![sonar](https://sonarcloud.io/api/badges/gate?key=utPLSQL%3AutPLSQL-demo-project%3Adevelop)](https://sonarcloud.io/dashboard/index?id=utPLSQL%3AutPLSQL-demo-project%3Adevelop)


# CI/CD and Unit Testing for Oracle PLSQL
Demo project using utPLSQL, Travis and SonarCloud for continuous integration of PLSQL and SQL code. 


This is a demo project using [utPLSQL v3](https://github.com/utPLSQL/utPLSQL) for unit testing of Oracle PLSQL code.
The project is also taking benefit of Continuous Integration with Travis CI server as well as static code analysis, code coverage and test results reporting using SoanrQube.

With every commit made to the github repository, a build job is executed using [Travis](https://travis-ci.org/utPLSQL/utPLSQL-demo-project) CI.

The build process consists of following steps:
- Download Oracle Database 11g XE
- Download latest release of utPLSQL
- Install Oracle Database
- Install [utPLSQL](https://github.com/utPLSQL/utPLSQL) framework
- Install [project sources](source/install.sh)
- Install [unit tests](test/install.sh)
- Download and unzip the [utplsql-cli](https://github.com/utPLSQL/utPLSQL-cli) project binaries
- [Execute all tests](test/run.sh) on the project
- Publish [test results](https://sonarcloud.io/component_measures/metric/tests/list?id=utPLSQL%3AutPLSQL-demo-project) and [code coverage](https://sonarcloud.io/component_measures/metric/coverage/list?id=utPLSQL%3AutPLSQL-demo-project) to [SonarQube](https://sonarcloud.io/) cloud service


