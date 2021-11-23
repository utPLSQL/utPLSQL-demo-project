docker run --rm -v $(pwd):/work -w /work/  --network host --entrypoint sqlplus truemark/sqlplus:19.8 \
    sys/oracle@//127.0.0.1:1521/XE as sysdba @source/create_users.sql

docker run --rm -v $(pwd):/work -w /work/  --network host --entrypoint sqlplus truemark/sqlplus:19.8 \
    ut3_demo/ut3_demo@//127.0.0.1:1521/XE @source/award_bonus/employees_test.sql
docker run --rm -v $(pwd):/work -w /work/  --network host --entrypoint sqlplus truemark/sqlplus:19.8 \
    ut3_demo/ut3_demo@//127.0.0.1:1521/XE @source/award_bonus/award_bonus.prc

docker run --rm -v $(pwd):/work -w /work/  --network host --entrypoint sqlplus truemark/sqlplus:19.8 \
    ut3_demo/ut3_demo@//127.0.0.1:1521/XE @source/between_string/betwnstr.fnc

docker run --rm -v $(pwd):/work -w /work/  --network host --entrypoint sqlplus truemark/sqlplus:19.8 \
    ut3_demo/ut3_demo@//127.0.0.1:1521/XE @source/remove_rooms_by_name/rooms.sql
docker run --rm -v $(pwd):/work -w /work/  --network host --entrypoint sqlplus truemark/sqlplus:19.8 \
    ut3_demo/ut3_demo@//127.0.0.1:1521/XE @source/remove_rooms_by_name/remove_rooms_by_name.prc

