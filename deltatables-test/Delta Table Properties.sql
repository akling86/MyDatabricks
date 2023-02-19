-- Databricks notebook source
use anton_kling_linde_le_com_db;

-- COMMAND ----------

CREATE or REPLACE TABLE tab_wo_cdf (a STRING, b STRING);

insert into tab_wo_cdf values('a1', 'b1');

-- COMMAND ----------

insert into tab_wo_cdf values('a2', 'b2');

-- COMMAND ----------

describe history tab_wo_cdf

-- COMMAND ----------

CREATE or REPLACE TABLE tab_with_cdf (a STRING, b STRING) TBLPROPERTIES (delta.enableChangeDataFeed = true);

insert into tab_with_cdf values('a1', 'b1');

-- COMMAND ----------

insert into tab_with_cdf values('a2', 'b2');

-- COMMAND ----------

describe history tab_with_cdf

-- COMMAND ----------

SELECT * FROM table_changes('tab_with_cdf', 3, 4)

-- COMMAND ----------

update tab_with_cdf set b='b3' where a='a2'

-- COMMAND ----------

SELECT * FROM table_changes('tab_with_cdf', 3, 5)

-- COMMAND ----------

SELECT * FROM table_changes('tab_with_cdf', '2023-02-17 06:27:00')
