git clone --depth=1 --branch=${UTPLSQL_VERSION} https://github.com/utPLSQL/utPLSQL.git utPLSQL
chmod -R go+w $(pwd)/utPLSQL/source
docker run --rm -v $(pwd)/utPLSQL:/utPLSQL -w /utPLSQL/source --network host \
    --entrypoint sqlplus gvenzl/oracle-xe:18-slim sys/oracle@//127.0.0.1:1521/XE as sysdba @install_headless.sql UT3 UT3 users
