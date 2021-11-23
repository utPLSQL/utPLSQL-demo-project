git clone --depth=1 --branch=${UTPLSQL_VERSION} https://github.com/utPLSQL/utPLSQL.git utPLSQL

docker run --rm -v $(pwd)/utPLSQL:/utPLSQL -w /utPLSQL/source --network host \
    --entrypoint sqlplus truemark/sqlplus:19.8 sys/oracle@//127.0.0.1:1521/XE as sysdba @install_headless.sql UT3 UT3 users
