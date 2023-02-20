-- Databricks notebook source
use anton_kling_linde_le_com_db;

-- COMMAND ----------

CREATE or REPLACE TABLE main_tab (a STRING, b STRING);

insert into main_tab values('a1', 'b1');

-- COMMAND ----------

CREATE or REPLACE TABLE merge_table (a STRING, b STRING, c STRING);

insert into merge_table values('a1', 'b1', 'c1');
insert into merge_table values('a2', 'b2', 'c2');

-- COMMAND ----------

MERGE INTO main_tab as a1
USING merge_table as a2
ON
 a1.a = a2.a
WHEN MATCHED
  THEN UPDATE SET *
WHEN NOT MATCHED
  THEN INSERT *

-- COMMAND ----------

select * from main_tab

-- COMMAND ----------

SET spark.databricks.delta.schema.autoMerge.enabled = true

-- COMMAND ----------

MERGE INTO main_tab as a1
USING merge_table as a2
ON
 a1.a = a2.a
WHEN MATCHED
  THEN UPDATE SET *
WHEN NOT MATCHED
  THEN INSERT *

-- COMMAND ----------

select * from main_tab

-- COMMAND ----------

drop table main_tab;
drop table merge_table;

-- COMMAND ----------


