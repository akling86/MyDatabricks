-- Databricks notebook source
use anton_kling_linde_le_com_db;

-- COMMAND ----------

CREATE or REPLACE TABLE dyn_prop (item STRING, property STRING, value STRING, uom STRING);

insert into dyn_prop values('item1', 'prop1', 'val1', 'uom1');
insert into dyn_prop values('item1', 'prop2', 'val2', 'uom2');
insert into dyn_prop values('item2', 'prop1', 'ValVal', 'MM');

-- COMMAND ----------

select * from dyn_prop

-- COMMAND ----------

-- MAGIC %python
-- MAGIC from pyspark.sql import functions as F 
-- MAGIC 
-- MAGIC pivotItem = (spark
-- MAGIC       .table("dyn_prop")
-- MAGIC       .groupBy("item")
-- MAGIC       .pivot("property")
-- MAGIC       .agg(F.first('value').alias('val'),F.first('uom').alias('uom'))
-- MAGIC )
-- MAGIC display(pivotItem)

-- COMMAND ----------

drop table dyn_prop

-- COMMAND ----------


