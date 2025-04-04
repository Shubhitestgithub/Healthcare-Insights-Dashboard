**Overview**

The goal of this project is to build an interactive analytics dashboard using Python, SQL, and Streamlit to assist healthcare organizations in making data-driven decisions. The dashboard will enable in-depth analysis of various key aspects, including treatment patterns, facility utilization, length of stay, billing versus insurance discrepancies, follow-up appointment trends, bed occupancy etc. By providing actionable insights into these areas, the project aims to optimize hospital operations, improve resource management, and enhance patient care outcomes. This will be accomplished through robust data preprocessing, effective database integration, and the development of a user-friendly platform that allows healthcare administrators to interact with and visualize the data in real time.

**Approach**

**1\. Data Exploration**

* Analyze dataset structure, key variables, and overall content.  
* Identify essential features for effective analysis.

**2\. Data Cleaning and Preprocessing**

* Address missing or inconsistent values.  
* Standardize formats (e.g., date and numerical columns).  
* Conducted in a **Jupyter Notebook** before integrating with the database.

**3\. Database Integration**

* Store the dataset in an SQL database for efficient data retrieval.(Create Python SQL connection)  
* Optimize tables and indices for faster querying.  
  ·         Established using a **Python SQL connection**.

**4\. Sample SQL Queries**

Here are five example queries, with additional ones to be developed:

1. **Admission Trends Over Time** – Track monthly hospital admissions.  
2. **Most Common Diagnoses** – Identify the top five frequent diagnoses.  
3. **Bed Utilization Analysis** – Examine different types of bed occupancy.  
4. **Length of Stay Distribution** – Assess average and maximum patient stay durations.  
5. **Seasonal Admission Patterns** – Determine trends in hospital admissions by season.

Additional queries will further analyze patient behaviors, treatment effectiveness, and hospital operations.

**5\. Dashboard Development**

* Utilize **Streamlit** for an interactive user interface.  
* Implement filtering, querying, and data visualization features.  
  ·         Developed using a **Python (.py) script**.

**6\. Data Visualization & Reporting**

* Use bar charts, line graphs, and pie charts to showcase insights.  
* Present a summary panel with key performance indicators.

 

**Installation & Setup**

**Prerequisites**

* Python 3.x  
* Streamlit  
* Pandas  
* SQL Database (SQLite, PostgreSQL, or MySQL)  
* SQL Alchemy  
* Matplotlib  
* Plotly

 

**Steps to Install**

**1\.**      **Clone the repository:**

git clone [https://github.com/Shubhitestgithub/Healthcare-Insights-Dashboard.git](https://github.com/Shubhitestgithub/Healthcare-Insights-Dashboard.git)

cd healthcare-dashboard

 

**2\.**      **Install the required dependencies:**

pip install \-r requirements.txt

 

**3\.**      **Launch the dashboard:**

streamlit run app.py

 

**Contributors:**

Shubhi Garg

 

 

