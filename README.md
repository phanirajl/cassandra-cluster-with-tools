# cassandra-medusa
cassandra, cstar, and medusa

This is not a production setup, by any means. This is a test environment to be used for experiments on cassandra, cstar, and medusa. Also, ssh keys between containers are an anti-pattern, and are used here only as a convenience.

`docker-compose up -d`

The following will set up those anti-pattern ssh keys:

On the Cassandra nodes:

`/usr/local/bin/configure-client.sh`

On the app node:

`/usr/local/bin/configure-app.sh`

# testing cstar

```
cstar run --command='touch /root/testfile' --seed-host=172.16.238.2
```

# testing medusa

This has to be done in parallel.

```
cstar run --command="medusa backup --backup-name=testbackup1" --seed-host=172.16.238.2 --strategy=all
```

This does not:

```
medusa restore-cluster --backup-name=testbackup1 --seed-target=172.16.238.2
```

# here is some sample data 

```
create keyspace keyspace1 with replication = {'class':'SimpleStrategy', 'replication_factor':1} ;
create table keyspace1.users (userid text primary key, firstname text, lastname text);
insert into keyspace1.users(userid,firstname,lastname) values ('1', 'Valerie', 'Testing');
insert into keyspace1.users(userid,firstname,lastname) values ('2', 'Valerie', 'Two');
insert into keyspace1.users(userid,firstname,lastname) values ('3', 'Valerie', 'Last');
```


