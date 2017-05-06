# A demo of an Oracle Database Project

This is a demo project using [utPLSQL v3](https://github.com/utPLSQL/utPLSQL) for unit testing of Oracle PLSQL code.
The project is also taking benefit of Continuous Integration with Travis CI server as well as static code analysis, code coverage and test results reporting using SoanrQube.

With every commit made to the github repository, a build job is executed using [Travis](https://travis-ci.org/utPLSQL/utPLSQL-demo-project) CI.

The build process consists of following steps:
- Download Oracle Database 11g XE
- Download latest release of utPLSQL
- Install Oracle Database
- Install utPLSQL framework
- Install [project sources](source/install.sh)
- Install [unit tests](test/install.sh)
- [Execute all tests](test/run.sh) on the project
- Publish [test results](https://sonarqube.com/component_measures/metric/tests/list?id=utPLSQL%3AutPLSQL-demo-project) and [code coverage](https://sonarqube.com/component_measures/metric/coverage/list?id=utPLSQL%3AutPLSQL-demo-project) to [SonarQube](https://sonarqube.com/) cloud service


