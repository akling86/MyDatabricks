-- Databricks notebook source
use erpdata;

-- COMMAND ----------

create or replace view secure_proc_data as
select
  *
from
  po_proc_data
where
  is_member(project_definition)

-- COMMAND ----------

select
  count(*)
from
  secure_proc_data;

-- COMMAND ----------

CREATE or REPLACE TABLE dyn_security (user STRING, project STRING);

insert into dyn_security values('anton.kling@linde-le.com', 'K-01-2110BCJN');

select * from dyn_security;

-- COMMAND ----------

create or replace view secure_proc_data2
as
select
  *
from 
  po_proc_data as p
where
 exists(
   select 
     s.user
   from
     dyn_security as s
   where
     s.user = current_user
   and
     p.project_definition = s.project
 )

-- COMMAND ----------

select
  count(*)
from
  secure_proc_data2;

-- COMMAND ----------


