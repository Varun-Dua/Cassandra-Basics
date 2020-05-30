create keyspace perfmonitor
with replication = {'class':'SimpleStrategy', 'replication_factor' = 1};

describe perfmonitor

use perfmonitor;

create table app_instance(
app_id int,
app_name varchar,
proc_id varchar,
host_id varchar,
os_priority int,
cpu_time int,
num_io_ops int
primary key (host_id,proc_id))
with clustering order by (proc_id desc);

describe app_instance

insert into app_instance(app_id, host_id, proc_id, app_name, os_priority, cpu_time, num_io_ops)
values(1, 'Host_1', 'proc_1', 'app_1', 90, 145, 250);

insert into app_instance(app_id, host_id, proc_id, app_name, os_priority, cpu_time, num_io_ops)
values(2, 'Host_2', 'proc_2', 'app_2', 60, 155, 550);

insert into app_instance(app_id, host_id, proc_id, app_name, os_priority, cpu_time, num_io_ops)
values(3, 'Host_3', 'proc_3', 'app_3', 70, 115, 450);

select * from app_instance;

select * from app_instance where app_name = 'app_3'  -- Error - not part of the primary key

create index appname_idx on app_instance(app_name);

describe appname_idx

select * from appname_idx where app_name = 'app_1'; -- this works



