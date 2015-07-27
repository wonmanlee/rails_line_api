bundle

echo Starting PG server...
pg_ctl -D /usr/local/var/postgres -l /usr/local/var/postgres/server.log start

echo Creating development database...
createdb rails_api_dev

echo Creating testing database...
createdb rails_api_test

echo Migrating database...
rake db:migrate

TEXT_FILE=$1
export TEXT_FILE

echo Seeding $1 into database...
rake db:seed

echo Starting Rails server...
rails s