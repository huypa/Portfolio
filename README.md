# ☕ Portfolio – Power BI Coffee Shop Dashboard
## 1. Overview
I designed and developed an interactive **Power BI dashboard** to analyze and visualize the performance of three key coffee stores — **Astoria**, **Hell’s Kitchen**, and **Lower Manhattan**. The dashboard highlights **daily, weekly, and categorical sales performance**, enabling business users to monitor revenue trends, identify high-performing stores, and understand customer purchasing patterns.

**Full dashboard:** [Coffee Power BI Dashboard](https://app.powerbi.com/view?r=eyJrIjoiNDg2NmI3MDYtOGQxYS00M2RmLTk2YWUtNTFmNTk4OGY0ODIxIiwidCI6IjMyNGViYTBiLTJjNTUtNDE3NS1iMzBjLThjODNlMzZmMTE2ZCJ9)  

<img width="1851" height="1044" alt="Screenshot 2025-11-05 at 14 59 35" src="https://github.com/user-attachments/assets/83edfecc-beaa-4048-b35b-4bc8c41fef31" />

## 2. Project Details

- **Tool:** Power BI  
- **Data Source:** [Point-of-Sale Transaction Data (Kaggle)](https://www.kaggle.com/code/ahmedabbas757/coffee-shop-sales/input)  
- **Goasl Focus:** Revenue, Product Mix, Store & Time Analysis  
- **Technical Focus:** Power Querry / DAX / Database Design

The data model follows a snowflake schema with Transaction as the central fact table connected to key dimensions — Dim_product, Dim_type, Dim_location, and Dim_Date. It supports time-based, product, and store-level analysis. Supporting tables like Measure Table and Parameter enable dynamic KPI calculations and interactive Power BI reports for revenue, quantity, and transaction insights.

    <img width="876" height="926" alt="Screenshot 2025-10-29 at 12 18 34" src="https://github.com/user-attachments/assets/bd1826e8-94a8-4ebb-a711-ca26870ad551" />

## 3. Key Features & Insights
*3.1 Revenue & Trend Analysis*
- Interactive **line and bar charts** showing total revenue and growth trends by store and week, with **hover-enabled tooltips** displaying detailed metrics (e.g., daily revenue, % change vs. previous period).

*3.2 Store Comparison*
- Visualized each store’s contribution using **dynamic comparison visuals** and **share indicators**, providing instant insights into performance balance.

*3.3 Product & Category Breakdown*
- Ranked **top product types** (*Barista Espresso, Chai Tea, Gourmet Coffee*) and **categories** (*Coffee, Tea, Bakery*, etc.) using horizontal bar charts for intuitive readability. I also added filter options for quickly 

*3.4 Weekday vs. Weekend Performance*
- Displayed **customer traffic and sales volume** differences between weekdays and weekends to support staffing and promotional strategy planning.

## 4. Color & Design System

- **Palette:** Warm, coffee-inspired tones — *espresso browns*, *latte beige*, and *cream neutrals* for visual comfort.  
- **Highlights:** Accent colors applied strategically to emphasize KPIs and positive/negative performance trends.  
- **Layout:** Balanced visual hierarchy and clean typography for readability and user engagement.  

## 5. Interactivity & Usability

- **Dynamic Filters:** Select by *Month*, *Store*, or *Metric* (Revenue, Quantity, Transactions).  
- **Hover Cards:** Reveal contextual data such as *percentage change*, *total contribution*, and *performance vs. prior month*.  
- **Drill-down Features:** Allow users to explore data from overall trends down to daily performance.  
- **Responsive Design:** Optimized layout for both large and compact screen views.

## 6. Results
This dashboard shows a positive performance in March for the coffee business:
- All major KPIs increased by **22–23%**.
- **Coffee** is the dominant revenue driver, especially **espresso-based drinks**.
- All three stores perform consistently, with **Lower Manhattan** holding a slight lead.
- Revenue is driven mainly by **weekday traffic**, likely due to worker and commuter activity.
- Daily trends show regular **peaks and healthy consistency**, with no concerning drops.
- The business is growing, product mix is healthy, and **store performance** is stable across locations.



