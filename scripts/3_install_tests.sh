docker run --rm -v $(pwd):/work -w /work/  --network host \
    --entrypoint sqlplus ${ORACLE_DOCKER_IMAGE} \
    ut3_demo/ut3_demo@//127.0.0.1:1521/${SERVICE_NAME} @test/install.sql
