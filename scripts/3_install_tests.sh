docker run --rm -v $(pwd):/work -w /work/  --network host --entrypoint sqlplus truemark/sqlplus:19.8 \
    ut3_demo/ut3_demo@//127.0.0.1:1521/XE @test/award_bonus/test_award_bonus.pks
docker run --rm -v $(pwd):/work -w /work/  --network host --entrypoint sqlplus truemark/sqlplus:19.8 \
    ut3_demo/ut3_demo@//127.0.0.1:1521/XE @test/award_bonus/test_award_bonus.pkb

docker run --rm -v $(pwd):/work -w /work/  --network host --entrypoint sqlplus truemark/sqlplus:19.8 \
    ut3_demo/ut3_demo@//127.0.0.1:1521/XE @test/between_string/test_betwnstr.pks
docker run --rm -v $(pwd):/work -w /work/  --network host --entrypoint sqlplus truemark/sqlplus:19.8 \
    ut3_demo/ut3_demo@//127.0.0.1:1521/XE @test/between_string/test_betwnstr.pkb

docker run --rm -v $(pwd):/work -w /work/  --network host --entrypoint sqlplus truemark/sqlplus:19.8 \
    ut3_demo/ut3_demo@//127.0.0.1:1521/XE @test/remove_rooms_by_name/test_remove_rooms_by_name.pks
docker run --rm -v $(pwd):/work -w /work/  --network host --entrypoint sqlplus truemark/sqlplus:19.8 \
    ut3_demo/ut3_demo@//127.0.0.1:1521/XE @test/remove_rooms_by_name/test_remove_rooms_by_name.pkb
