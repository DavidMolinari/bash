
[ $# -lt 3 ] && echo "Usage:[DB_pass=<password>] $(basename $0) <DB_HOST> <DB_USER> <DB_NAME> [<DIR>]" && exit 1
DB_host=$1
DB_user=$2
DB=$3
DIR=$4
 
[ -n "$DB_options" ] || DB_options="--skip-opt --comments=0 --set-charset --lock-tables --disable-keys --create-options --add-drop-table"
[ -n "$DIR" ] || DIR=.
test -d $DIR || mkdir -p $DIR

if [ -z "$DB_pass" ]; then
		echo -n "DB password: "
			read -s DB_pass
		fi
		echo
		echo "Dumping tables into separate SQL command files for database '$DB' into dir=$DIR"
		 
		tbl_count=0
		for t in $(mysql -NBA -h $DB_host -u $DB_user -p$DB_pass -D $DB -e 'show tables') 
				do
						(( tbl_count++ ))
							echo "DUMPING TABLE: $tbl_count $t"
								mysqldump --host="$DB_host" --result-file="$DIR/$t.sql" --user="$DB_user" --password="$DB_pass" $DB_options  $DB $t
							done
							 
							echo "$tbl_count tables dumped from database '$DB' into dir=$DIR"
