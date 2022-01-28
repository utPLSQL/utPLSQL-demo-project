docker run --rm -v $(pwd):/work -w /work/  --network host \
    --entrypoint sqlplus gvenzl/oracle-xe:18-slim \
    sys/oracle@//127.0.0.1:1521/XE as sysdba @source/create_user.sql

docker run --rm -v $(pwd):/work -w /work/  --network host \
    --entrypoint sqlplus gvenzl/oracle-xe:18-slim \
    ut3_demo/ut3_demo@//127.0.0.1:1521/XE @source/install.sql
