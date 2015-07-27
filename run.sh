echo Migrating database...
rake db:migrate

TEXT_FILE=$1
export TEXT_FILE

echo Seeding $1 into database...
rake db:seed

echo Starting Rails server...
rails s