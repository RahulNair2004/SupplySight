# SupplySight 

**Turning supply chain data into actionable business intelligence through analytics, demand forecasting, inventory planning, and logistics optimization.**

SupplySight is an end-to-end Supply Chain Analytics project designed to transform raw supply chain data into meaningful business insights. It focuses on understanding sales performance, identifying profitability drivers, analyzing delivery efficiency, forecasting demand, and developing data-driven inventory and logistics strategies.

The project combines **Python, SQL (PostgreSQL), Exploratory Data Analysis, Machine Learning, and Power BI** to demonstrate how data analytics can support real-world supply chain and operational decision-making.

---

## Objectives

- Analyze historical sales, order, product, and customer data to identify business trends.
- Evaluate product, category, and regional sales performance.
- Identify factors affecting profitability and operational efficiency.
- Analyze shipping performance, delivery delays, and logistics bottlenecks.
- Develop demand forecasting models to anticipate future product demand.
- Build inventory planning strategies to improve stock management.
- Develop interactive dashboards for monitoring key supply chain KPIs.

---

## Dataset

**Dataset:** DataCo Smart Supply Chain Dataset

The project uses the DataCo Smart Supply Chain dataset, containing historical transactional and operational information across multiple supply chain activities.

Key dataset information:

- Order and customer information
- Product and category details
- Sales, discounts, and profitability
- Order quantities and pricing
- Shipping modes and delivery performance
- Market and geographical information
- Department and regional data

**Dataset source:** [DataCo Smart Supply Chain Dataset — Kaggle](https://www.kaggle.com/datasets/shashwatwork/dataco-smart-supply-chain-for-big-data-analysis)

---

## 🛠️ Technology Stack

| Technology | Purpose |
|---|---|
| Python | Data analysis and preprocessing |
| Pandas & NumPy | Data manipulation |
| Matplotlib & Seaborn | Data visualization |
| Scikit-learn | Machine learning and forecasting experiments |
| PostgreSQL | Relational database and SQL analytics |
| SQL | Business queries and KPI analysis |
| Power BI | Interactive dashboards |
| Jupyter Notebook | Exploratory analysis and experimentation |
| Git & GitHub | Version control |

---

## 📈 Key Performance Indicators (KPIs)

The project aims to track the following supply chain KPIs:

| KPI | Purpose |
|---|---|
| Total Revenue | Measure overall sales performance |
| Total Orders | Measure order volume |
| Total Profit | Evaluate profitability |
| Profit Margin | Assess profitability relative to revenue |
| Average Order Value | Understand purchasing value |
| Average Order Quantity | Measure units purchased per order |
| Discount Percentage | Evaluate discounting patterns |
| Late Delivery Rate | Measure delivery reliability |
| Average Shipping Duration | Evaluate logistics efficiency |
| Forecast Accuracy | Evaluate demand prediction performance |
| Reorder Point | Support replenishment decisions |

---

## 🚀 Installation & Setup

### 1. Clone the repository

```bash
git clone https://github.com/YOUR_USERNAME/SupplySight.git

cd SupplySight
```

### 2. Create a virtual environment

```bash
python -m venv venv
```

Activate it:

**Windows**
```bash
venv\Scripts\activate
```

**Linux / macOS**
```bash
source venv/bin/activate
```

### 3. Install dependencies

```bash
pip install -r requirements.txt
```

### 4. Configure PostgreSQL

- Install PostgreSQL.
- Create a database named `Supply_Sight`.
- Import the cleaned dataset.
- Execute the SQL scripts in the `sql/` directory.

### 5. Run the notebooks

```bash
jupyter notebook
