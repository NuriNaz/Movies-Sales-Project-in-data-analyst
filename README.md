# Movies-Sales-Project-in-data-analyst


# 🎬 Movies Sales Analysis Project

## 📌 Overview
This project analyzes a dataset of movie sales using **SQL**, **Excel**, and **Power BI**.  
The objective was to explore the dataset, clean it, perform SQL queries for insights and verification , and finally visualize the results with **interactive Power BI dashboards**.  

This project demonstrates skills in:
- Data Cleaning & Transformation  
- Writing SQL Queries for Analysis and verification
- Using DAX in Power BI  
- Building Interactive Dashboards  
- Storytelling with Data  

---

## 📂 Dataset
The dataset contained information about:
- 🎥 Movie Name  
- 📅 Release Year  
- 🎭 Genre  
- 💰 Budget  
- 🌍 Global Box Office Revenue  
- ⭐ IMDb Rating  
- 🏢 Production Studio  

---

## 🛠️ Tools Used
- **SQL** – Data cleaning, transformations, and queries.  data verification
- **Excel** – Quick checks and preprocessing.  
- **Power BI** – Visualizations, DAX measures, and dashboard creation.  

---

## 🔍 SQL Analysis
Some key SQL queries written during analysis:

### 1. Total Movies
```sql
SELECT COUNT(*) AS TotalMovies
FROM Movies;
```

### 2. Total Revenue
```sql
SELECT SUM(Global_BoxOfficeUSD) AS TotalRevenue
FROM Movies;
```

### 3. Average Rating
```sql
SELECT AVG(IMDbRating) AS AvgRating
FROM Movies;
```

### 4. Average Budget
```sql
SELECT AVG(BudgetUSD) AS AvgBudget
FROM Movies;
```

### 5.TotalMoviesByGenre
SELECT Genre, COUNT(*) AS TotalMoviesByGenre
FROM movies
GROUP BY Genre
ORDER BY TotalMoviesByGenre DESC;

### 6. Revenue by Year
SELECT ReleaseYear, SUM(Global_BoxOfficeUSD) AS TotalRevenue
FROM Movies
GROUP BY ReleaseYear
ORDER BY ReleaseYear;
### 7. Top 10 Movies by Revenue
SELECT TOP 10 
    Title as MovieName, 
SUM(Global_BoxOfficeUSD) AS GlobalRevenue  FROM Movies
group by Title
ORDER BY GlobalRevenue DESC;
### 8. Average Rating by Genre

SELECT 
    CASE
        WHEN IMDbRating >= 8 THEN 'Excellent'
        WHEN IMDbRating >= 6 THEN 'Good'
        WHEN IMDbRating >= 4 THEN 'Average'
        ELSE 'Poor'
    END AS RatingCategory,
    ROUND(AVG(IMDbRating), 2) AS Avg_IMDb_Rating,
    COUNT(*) AS TotalMovies
FROM Movies
GROUP BY 
    CASE
        WHEN IMDbRating >= 8 THEN 'Excellent'
        WHEN IMDbRating >= 6 THEN 'Good'
        WHEN IMDbRating >= 4 THEN 'Average'
        ELSE 'Poor'
    END
ORDER BY Avg_IMDb_Rating DESC;
### 9. Budget vs Revenue (sample scatter data)
SELECT Title, BudgetUSD, Global_BoxOfficeUSD, IMDbRating
FROM Movies
WHERE BudgetUSD IS NOT NULL AND Global_BoxOfficeUSD IS NOT NULL;

### 10.Profit (Revenue - Budget)
SELECT 
    SUM(Global_BoxOfficeUSD) - SUM(BudgetUSD) AS Profit
FROM Movies;
### 11.ROI %
SELECT 
    ROUND(
        ( (SUM(Global_BoxOfficeUSD) - SUM(BudgetUSD)) * 100.0 / SUM(BudgetUSD) )
    , 2) AS ROI_Percentage
FROM Movies;




## 📊 Power BI Dashboard
The Power BI dashboard included multiple visualizations:

🔹 Top Row (KPIs)

## Total Movies 

## Total Global Revenue 

## Average IMDb Rating 

## Average Budget 

🔹 Middle Row (Charts)

## Donut Chart → Movies by Genre (using Genre + MovieCount)

## Line Chart → Revenue Trend by Year (ReleaseYear vs TotalRevenue)

 ## Bar Chart  → Top 10 Movies by Global Revenue

🔹 Bottom Row (Insights)

## Bar Chart → Average IMDb Rating by Genre

 ## Scatter Plot → Budget vs Global Revenue (bubble size = IMDb Rating)

## KPI Card → ROI % (calculated measure)

🔹 Filters (on the side panel)

## Genre

## Year

 ## Country

## Director


---

## 🧮 DAX Measures
Some DAX measures created in Power BI:

```DAX-- KPI Metrics
Total Movies = COUNTROWS(Movies)

Total Global Revenue = SUM(Movies[Global_BoxOfficeUSD])

Average IMDb Rating = AVERAGE(Movies[IMDbRating])

Average Budget (USD) = AVERAGE(Movies[BudgetUSD])

-- Yearly Trend
Yearly Global Revenue = 
CALCULATE(
    [Total Global Revenue],
    ALLEXCEPT(Movies, Movies[ReleaseYear])
)

-- Rating Category
Rating Category = 
SWITCH(
    TRUE(),
    Movies[IMDbRating] >= 8, "Excellent",
    Movies[IMDbRating] >= 6, "Good",
    Movies[IMDbRating] >= 4, "Average",
    "Poor"
)

-- Profit (Revenue - Budget)
Profit = SUM(Movies[Global_BoxOfficeUSD]) - SUM(Movies[BudgetUSD])

-- ROI %
ROI % = 
DIVIDE([Profit], SUM(movies_dataset[BudgetUSD]), 0) * 100


---

## 📈 Insights
1. Action and Drama genres dominated the dataset.  
2. A few blockbuster movies contributed a large portion of the revenue.  
3. Average IMDb rating was **~6.49**, showing overall good audience response.  
4. Some studios consistently produced higher revenue movies.  
5. Year-over-year analysis revealed spikes during specific years due to major releases.  

---

## 🚀 Key Learnings
- How to clean and query data with SQL.  
- Using **Excel** for quick validation and preprocessing.  
- Creating **DAX measures** in Power BI for deeper insights.  
- Designing interactive dashboards for storytelling.  
- Communicating insights effectively to non-technical stakeholders.  

---

## 📌 Conclusion
This project showcases the **end-to-end process** of a data analyst:
- Data Cleaning  
- SQL Querying  
- Visualization with Power BI  
- Extracting Business Insights  

It highlights how **data-driven decision-making** can reveal patterns in the film industry and guide production houses toward better investments.  

---

## 📸 Dashboard Preview
* screenshot link below
https://screenrec.com/share/BWOPsl2moI


 *screen recording with sql  queries verification below
 https://screenrec.com/share/Osn5KEfyVl

Note: to see my movies sales.pbit(i.e power bi dashboard click on the file and clisk on view raw it get downloaded then after you can watch it from there the working dashboard in your system
 

## 👨‍💻 Author
**Nuri Naz**  
Aspiring Data Analyst  
