# Cron job to delete sessions from rails apps. Deletes any session which hasn't
# been touched since "older_than" days. You have to grant the special user permission with this SQL:
# GRANT  DELETE ON `database_name`.`sessions` TO 'username'@'%localhost';
# GRANT SELECT ON *.* TO 'username'@'%localhost';
dbpass=''
dbuser='username'
host='localhost'
older_than=2 # delete sessions older than this many days
databases=[
    'list',
    'of',
    'databases'
]


require 'dbi'
date_cutoff = Date.today - older_than
puts "Deleting sessions prior to #{date_cutoff} from:"

databases.each do |db|
    dbh=DBI.connect("dbi:Mysql:#{db}:#{host}",dbuser,dbpass)
    rows=dbh.do("delete from sessions where updated_at < ?", date_cutoff)
    puts "#{db}: #{rows}"
end
puts "Done."

# get some usage info, top 5 auto_increment values, and top 5 tables by number of rows
dbh=DBI.connect("dbi:Mysql:information_schema:#{host}",dbuser,dbpass)
sql=["select table_schema, table_name, auto_increment from tables order by auto_increment desc limit 5",
    "select table_schema, table_name, table_rows from tables order by table_rows desc limit 5"
]
sql.each do |s|
    puts s
    sth=dbh.prepare(s)
    sth.execute
    while(r = sth.fetch)
        puts r.inspect
    end
end
puts "Done."

