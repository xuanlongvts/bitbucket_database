/*
Before restoring a database, you need to terminate all connections to that database and prepare the backup file. In PostgreSQL, you can restore a database in two ways:

Using psqlto restore plain SQL script file generated by  pg_dump and  pg_dumpall tools.
Using  pg_restore to restore tar file and directory format created by the  pg_dump tool.
*/

-- How to restore databases using psql
/*
The psql tool allows you to restore the SQL script file generated by the pg_dump,  pg_dumpall or any other tools that generate compatible backed up files. 
By using the psql tool, you can execute the entire script in the dump file.
*/

-- To restore a full backup and ignore any error occurred during the restoration process, you use the following command:
-- psql -U username -f backupfile.sql

-- If you want to stop restoring a database in case of errors, you add the --set ON_ERROR_STOP=on option:
-- psql -U username --set ON_ERROR_STOP=on -f backupfile

-- If you back up objects in a particular database, you can restore them using the following command:
-- psql -U username -d database_name -f objects.sql


-- How to restore databases using pg_restore
/*
Besides psqltool, you can use  pg_restore program to restore databases backed up by the  pg_dump or pg_dumpalltools. 
With  pg_restore program, you have various options for restoration databases, for example:

The  pg_restore allows you to perform parallel restores using the  -j option to specify the number of threads for restoration. 
Each thread restores a separate table simultaneously, which speeds up the process dramatically. 
Currently, the  pg_restore support this option for the only custom file format.

The  pg_restore also allows you to restore specific database objects in a backup file that contains the full database.

The  pg_restore can take a database-backed up in the older version and restore it in the newer version.
*/

-- create new database and resotre from dvdrental
-- CREATE DATABASE new_dvdrental;

-- Second, restore the table structure only from the dvdrental.tar backup file by using the following command:
-- pg_restore --dbname=new_dvdrental --section=pre-data dvdrental.tar

-- pg_restore -h localhost -p 5432 -U postgres -d db_graphql_relay -v dvdrental.tar