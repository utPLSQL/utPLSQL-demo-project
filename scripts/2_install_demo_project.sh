docker run --rm -v $(pwd):/work -w /work/  --network host \
    --entrypoint sqlplus gvenzl/oracle-xe:18-slim \
    sys/oracle@//127.0.0.1:1521/XE as sysdba @source/install.sql
