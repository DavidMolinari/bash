
#[ $# -lt 3 ] && echo "Usage:[DB_pass=<password>] $(basename $0) <DB_HOST> <DB_USER> <DB_NAME> [<DIR>]" && exit 1
#DB_host = ''
#DB_user = 'root'
#DB_pass = 'toor' # (:
#DB=$1
DIR=$1

[ -n "$DB_options" ] || DB_options=" --skip-opt --comments=0 --set-charset --lock-tables --disable-keys --create-options --add-drop-table"
[ -n "$DIR" ] || DIR=.
test -d $DIR || mkdir -p $DIR


for line in `cat dbs.txt`; do
echo $line
  tbl_count=0
  for t in $(mysql -NBA -h localhost -u root -ptoor -D $line -e "select distinct table_name from Information_schema.columns where column_name = 'Date' AND Table_schema ='$line'") 
    do
      (( tbl_count++ ))
      echo "DUMP TABLE: $tbl_count $t"
      mysqldump --host="$DB_host" --result-file="$DIR/$t""_`date +'%Y%m%d%H%M'`.sql" --user="$DB_user" --password="$DB_pass" $DB_options --where="date > '`date -d '-7 day' +%Y-%m-%d`' "  $line $t
    done
  echo "AMENO !!!!! $tbl_count tables dumped from '$DB' TO dir=$DIR"
done

