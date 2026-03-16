docker run --rm -v $(pwd):/work -w /work/  --network host \
    --entrypoint sqlplus ${ORACLE_DOCKER_IMAGE} \
    sys/oracle@//127.0.0.1:1521/${SERVICE_NAME} as sysdba @source/create_user.sql

docker run --rm -v $(pwd):/work -w /work/  --network host \
    --entrypoint sqlplus ${ORACLE_DOCKER_IMAGE} \
    ut3_demo/ut3_demo@//127.0.0.1:1521/${SERVICE_NAME} @source/install.sql
