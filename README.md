
# 🎬 Movies Sales Analysis Project  

## 📌 Overview  
This project analyzes a **Movies Sales dataset** using **SQL, Excel, and Power BI**.  
The goal was to **explore, clean, and analyze the dataset**, verify insights with SQL queries, and build an **interactive Power BI dashboard** to visualize the findings.  

This project demonstrates skills in:  
- ✅ Data Cleaning & Transformation  
- ✅ Writing SQL Queries for Analysis & Verification  
- ✅ Using DAX in Power BI  
- ✅ Building Interactive Dashboards  
- ✅ Storytelling with Data  

---

## 📂 Dataset  
The dataset contained the following information:  
- 🎥 **Movie Name**  
- 📅 **Release Year**  
- 🎭 **Genre**  
- 💰 **Budget (USD)**  
- 🌍 **Global Box Office Revenue (USD)**  
- ⭐ **IMDb Rating**  
- 🏢 **Production Studio**  

---

## 🛠️ Tools Used  
- **SQL** → Data cleaning, transformations, and querying (verification)  
- **Excel** → Quick checks & preprocessing  
- **Power BI** → Visualizations, DAX measures & dashboard creation  

---

## 🔍 SQL Analysis  
Some key SQL queries written during the analysis:  

```sql
-- 1. Total Movies
SELECT COUNT(*) AS TotalMovies FROM Movies;

-- 2. Total Revenue
SELECT SUM(Global_BoxOfficeUSD) AS TotalRevenue FROM Movies;

-- 3. Average Rating
SELECT AVG(IMDbRating) AS AvgRating FROM Movies;

-- 4. Average Budget
SELECT AVG(BudgetUSD) AS AvgBudget FROM Movies;

-- 5. Total Movies by Genre
SELECT Genre, COUNT(*) AS TotalMoviesByGenre
FROM Movies
GROUP BY Genre
ORDER BY TotalMoviesByGenre DESC;

-- 6. Revenue by Year
SELECT ReleaseYear, SUM(Global_BoxOfficeUSD) AS TotalRevenue
FROM Movies
GROUP BY ReleaseYear
ORDER BY ReleaseYear;

-- 7. Top 10 Movies by Revenue
SELECT TOP 10 Title AS MovieName, SUM(Global_BoxOfficeUSD) AS GlobalRevenue
FROM Movies
GROUP BY Title
ORDER BY GlobalRevenue DESC;

-- 8. Average Rating by Category
SELECT CASE 
         WHEN IMDbRating >= 8 THEN 'Excellent'
         WHEN IMDbRating >= 6 THEN 'Good'
         WHEN IMDbRating >= 4 THEN 'Average'
         ELSE 'Poor'
       END AS RatingCategory,
       ROUND(AVG(IMDbRating), 2) AS Avg_IMDb_Rating,
       COUNT(*) AS TotalMovies
FROM Movies
GROUP BY CASE 
           WHEN IMDbRating >= 8 THEN 'Excellent'
           WHEN IMDbRating >= 6 THEN 'Good'
           WHEN IMDbRating >= 4 THEN 'Average'
           ELSE 'Poor'
         END
ORDER BY Avg_IMDb_Rating DESC;

-- 9. Budget vs Revenue
SELECT Title, BudgetUSD, Global_BoxOfficeUSD, IMDbRating
FROM Movies
WHERE BudgetUSD IS NOT NULL AND Global_BoxOfficeUSD IS NOT NULL;

-- 10. Profit
SELECT SUM(Global_BoxOfficeUSD) - SUM(BudgetUSD) AS Profit FROM Movies;

-- 11. ROI %
SELECT ROUND(
  ((SUM(Global_BoxOfficeUSD) - SUM(BudgetUSD)) * 100.0 / SUM(BudgetUSD)), 2
) AS ROI_Percentage
FROM Movies;
```

---

## 📊 Power BI Dashboard  
The dashboard was designed with **KPIs, charts, and filters** for deeper insights:  

### 🔹 Top Row (KPIs)  
- Total Movies  
- Total Global Revenue  
- Average IMDb Rating  
- Average Budget  

### 🔹 Middle Row (Charts)  
- 🍩 **Donut Chart** → Movies by Genre  
- 📈 **Line Chart** → Revenue Trend by Year  
- 📊 **Bar Chart** → Top 10 Movies by Global Revenue  

### 🔹 Bottom Row (Insights)  
- 📊 **Bar Chart** → Average IMDb Rating by Genre  
- 🔵 **Scatter Plot** → Budget vs Global Revenue (bubble size = IMDb Rating)  
- 📌 **KPI Card** → ROI %  

### 🔹 Filters  
- Genre  
- Year  
- Country  
- Director  

---

## 🧮 DAX Measures  

```DAX
-- Total Movies
Total Movies = COUNTROWS(Movies)

-- Total Global Revenue
Total Global Revenue = SUM(Movies[Global_BoxOfficeUSD])

-- Average IMDb Rating
Average IMDb Rating = AVERAGE(Movies[IMDbRating])

-- Average Budget
Average Budget (USD) = AVERAGE(Movies[BudgetUSD])

-- Yearly Global Revenue
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

-- Profit
Profit = SUM(Movies[Global_BoxOfficeUSD]) - SUM(Movies[BudgetUSD])

-- ROI %
ROI % = DIVIDE([Profit], SUM(Movies[BudgetUSD]), 0) * 100
```

---

## 📈 Insights  
1. **Action & Drama** genres dominated the dataset.  
2. A few **blockbusters contributed the majority of revenue**.  
3. Average IMDb rating was **~6.49**, showing overall good audience response.  
4. Some studios consistently produced **higher revenue movies**.  
5. Revenue trends revealed **spikes during specific years** due to major releases.  

---

## 🚀 Key Learnings  
- Cleaning & querying data with **SQL**  
- Using **Excel** for validation & preprocessing  
- Creating **DAX measures** for advanced analysis  
- Designing **interactive dashboards** for storytelling  
- Communicating insights effectively to stakeholders  

---

## 📌 Conclusion  
This project highlights the **end-to-end process of a Data Analyst**:  
- Data Cleaning  
- SQL Querying  
- Visualization with Power BI  
- Extracting Business Insights  

It demonstrates how **data-driven decisions** can uncover patterns in the film industry and guide studios toward **smarter investments**.  

---

## 📸 Dashboard Preview  
🔗 **Dashboard Screenshot** → [View Here](https://screenrec.com/share/BWOPsl2moI)  
🔗 **SQL Queries Verification (Screen Recording)** → [Watch Here](https://screenrec.com/share/Osn5KEfyVl)  

👉 To view the working **Power BI Dashboard (.pbit file)**:  
- Go to the repository → Click on the `.pbit` file → Select **View Raw** → It will download automatically.  

---

## 👨‍💻 Author  
**Nuri Naz**  
_Aspiring Data Analyst_  
