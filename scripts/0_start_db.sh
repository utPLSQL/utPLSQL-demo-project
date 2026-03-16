docker run -d --name ora-utplsql -p 1521:1521 -e ORACLE_PASSWORD=${ORACLE_PASSWORD} ${ORACLE_DOCKER_IMAGE}
