# ⭐ Data Warehouse Project (BigQuery + DBT)

This project showcases my ability to design and build an end-to-end **data warehouse** using **Google BigQuery**, **DBT**, and **Kimball Dimensional Modeling**, based on the [Wide World Importers](https://learn.microsoft.com/en-us/sql/samples/wide-world-importers-what-is?view=sql-server-ver17) dataset.

## 🚀 What This Project Demonstrates
- Building a data warehouse from scratch  
- Star-schema design and Kimball modeling  
- Modular DBT transformations (staging → dimensional → facts)  
- Automated DBT tests for data quality  
- Role-playing dimensions, snapshots, and business metrics  

## 📁 Project Structure (Key Models)

### **Dimensions**
- `dim_category.sql`
- `dim_category_rev.sql`
- `dim_customer.sql`
- `dim_customer_attribute.sql`
- `dim_customer_membership.sql`
- `dim_date.sql`
- `dim_person.sql`
- `dim_product.sql`
- `dim_sales_order_line_indicator.sql`
- `dim_supplier.sql`

### **Facts**
- `fact_sales_order.sql`
- `fact_sales_order_line.sql`
- `fact_purchase_order.sql`
- `fact_purchase_order_lines.sql`
- `fact_supplier_transaction.sql`
- `fact_customer_snapshot_monthly.sql`
- `fact_salesperson_target_monthly.sql`

### **Role-Playing Dimensions**
Located under:  
- `models/analytics/role_playing_dimensions/`

## 🧪 DBT Tests
Located in `models/analytics/DBT_test/`:
- `dim_product.yml`
- `dim_sales_order_line_indicator.yml`
- `fact_purchase_order_lines.yml`
- `fact_salesperson_target_monthly.yml`
- `fact_sales_order_line.yml`
- `fact_supplier_transaction.yml`

Covers:
- Primary key checks (`unique`, `not_null`)
- FK relationships
- Accepted values
- Business rule logic via custom tests

## 🛠 Tech Stack
- **Data Warehouse:** Google BigQuery  
- **Transformation:** DBT  
- **Modeling:** Kimball Dimensional Modeling  
- **Dataset:** Wide World Importers  
- **Course:** Data Warehouse by Vitlamdata  

## 📘 How to Explore
- **Analytics models:** `models/analytics/`  
- **DBT tests:** `models/analytics/DBT_test/`  
- **Lineage graph:** Run → `dbt docs generate` + `dbt docs serve`

