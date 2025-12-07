# Insights & Business Recommendations  
Music Store Sales Analysis (Chinook)

This document summarizes the key insights and business recommendations derived from a set of SQL queries on the Chinook music store database. The analysis focuses on genres, albums, artists, markets (countries), customers, and yearly revenue trends.

---

## 1. Genre Performance

### 1.1 Top-Revenue Genres

**Query:** Top 5 genres by total revenue  

| Genre              | Revenue (USD) |
|--------------------|---------------|
| Rock               | 826.65        |
| Latin              | 382.14        |
| Metal              | 261.36        |
| Alternative & Punk | 241.56        |
| TV Shows           | 93.53         |

**Insights**

- Rock is the **core revenue driver**, with ~826.65 USD, almost **double** the second-place genre (Latin).
- Latin and Metal also contribute significantly, confirming strong demand for rock and heavier / alternative music styles.

**Actions**

- Prioritize **Rock, Latin, and Metal** in content acquisition, promotion, and homepage placement.
- Design targeted campaigns such as “Best of Rock” and “Latin Essentials” playlists.

---

### 1.2 Lowest-Revenue Genres

**Query:** Bottom 5 genres by total revenue  

| Genre              | Revenue (USD) |
|--------------------|---------------|
| Rock And Roll      | 5.94          |
| Easy Listening     | 9.90          |
| Heavy Metal        | 11.88         |
| Electronica/Dance  | 11.88         |
| Science Fiction    | 11.94         |

**Insights**

- These genres generate **almost no sales** (roughly 6–12 USD each).
- Despite the number of tracks in some of these genres, customer demand is clearly low.

**Actions**

- **De-prioritize** these genres in marketing and user interface (fewer homepage slots, less recommendation weight).
- Avoid further expanding catalog for consistently low-performing genres unless there is strategic value (e.g., brand image, editorial diversity).
- Focus on maintaining only best-performing tracks instead of large, slow-moving inventories.

---

### 1.3 Bottom Genres with Revenue per Track

**Query:** Bottom 10 genres by revenue + revenue per track  

Sample rows:

| Genre             | Revenue | Tracks | Revenue/Track |
|-------------------|---------|---------|---------------|
| Rock And Roll     | 5.94    | 6       | 0.99          |
| Easy Listening    | 9.90    | 10      | 0.99          |
| Science Fiction   | 11.94   | 5       | **2.39**      |
| Comedy            | 17.91   | 8       | **2.24**      |

**Insights**

- Some low-revenue genres (e.g. **Science Fiction, Comedy**) have **high revenue per track**, indicating strong willingness to pay in small, niche audiences.
- Other genres combine **low total revenue and low revenue per track**, showing both low volume and low efficiency.

**Actions**

- For **niche but high-value** genres (Science Fiction, Comedy):
  - Maintain and carefully expand catalog.
  - Run small, targeted campaigns (“Sci-Fi Audio Specials”, “Comedy Collections”) aimed at niche fans.
- For genres with low revenue and low revenue per track:
  - Reduce catalog size and acquisition.
  - Exclude from major marketing efforts and treat as long-tail inventory only.

---

## 2. Album Performance

### 2.1 Best-Selling Albums

**Query:** Top 10 albums by units sold  

Key results:

- **Minha Historia**: 35 units (clear #1)
- Greatest Hits: 26 units  
- Unplugged: 25 units  
- Acústico: 22 units  
- Several Latin/Brazilian albums appear in the top 10.

**Insights**

- **Minha Historia** significantly outperforms all other albums, marking it as a flagship product.
- Many of the best-selling albums are Latin/Brazilian titles, reinforcing the strength of Latin music in this catalog.

**Actions**

- Ensure **adequate inventory and prominent placement** for Minha Historia and other top albums.
- Use best-selling albums as anchors in bundle offers (e.g., “Buy this album and get X% off related tracks”).
- Create themed collections around top albums, especially for the Latin segment.

---

## 3. Artist Performance

### 3.1 Top Artists by Revenue

**Query:** Top 10 artists by total revenue  

Example top artists:

- **Iron Maiden**: 138.60 USD  
- U2: 105.93 USD  
- Metallica: 90.09 USD  
- Led Zeppelin: 86.13 USD  
- Lost: 81.59 USD  

**Insights**

- Rock/Metal artists **dominate revenue**, with Iron Maiden clearly leading.
- A small group of artists contributes a disproportionate share of total revenue.

**Actions**

- Prioritize **partnerships and promotions** with Iron Maiden, U2, Metallica, and other top artists.
- Run “Artist Spotlight” campaigns featuring these artists to further leverage their popularity.
- Use tracks from these artists in curated playlists and recommendation algorithms.

---

### 3.2 Top Artists by Units Sold

**Query:** Top 10 artists by total tracks sold  

Key result:

- **Iron Maiden** again ranks #1 with 140 tracks sold, followed by U2, Metallica, and Led Zeppelin.

**Insights**

- Iron Maiden is dominant both in revenue and volume, making them the **most strategically important artist** in the catalog.
- Some artists achieve high sales volume but relatively lower revenue, likely due to lower average prices or more single purchases.

**Actions**

- Treat Iron Maiden and peers as **core catalogue anchors**: prioritize for future releases, exclusive deals, and feature placements.
- Consider price optimization and bundling strategies for high-volume but lower-revenue artists to increase average order value.

---

## 4. Market Performance (Country-Level Revenue)

**Query:** Total revenue by country  

Top countries:

| Country | Revenue (USD) |
|---------|---------------|
| USA     | 523.06        |
| Canada  | 303.96        |
| France  | 195.10        |
| Brazil  | 190.10        |
| Germany | 156.48        |

**Insights**

- The **USA is the largest market** by far, followed by Canada, France, Brazil, and Germany.
- A handful of countries generate the majority of revenue, while many others contribute modest but non-negligible amounts.

**Actions**

- Focus **paid marketing, partnerships, and localized content** on the top markets (USA, Canada, Brazil, major EU countries).
- For long-tail countries, favor low-cost channels such as email campaigns and algorithmic recommendations instead of high-spend advertising.
- Combine country insights with genre insights (e.g. promote Latin music more heavily in Brazil and other Latin-speaking markets).

---

## 5. Customer Performance

**Query:** Top 10 customers by total revenue  

Example top customers:

- Helena Holý (Czech Republic): 49.62 USD  
- Richard Cunningham (USA): 47.62 USD  
- Luis Rojas (Chile): 46.62 USD  
- Several customers from the USA appear in the top 10.

**Insights**

- Revenue is partially concentrated in a **small group of high-value customers**.
- The USA is not only the largest market overall but also well represented among top-spending customers.

**Actions**

- Introduce a **loyalty / VIP program** targeting top customers (e.g., exclusive previews, small discounts, or bonus content).
- Use customer purchase history to build **personalized recommendations** for these users (favorite genres, artists, or albums).
- Monitor churn risk for top customers and proactively engage them via email or in-app messages.

---

## 6. Yearly Genre Revenue & Growth

**Query:** Yearly revenue by genre with year-over-year (YoY) growth using window functions (LAG).  

Selected patterns:

- **Rock** shows stable positive growth of roughly **3–7% per year**, making it the most stable genre.
- **Pop** increases by ~800% from 2021 to 2022.  
- **Comedy** jumps by ~500% in 2024.  
- **Bossa Nova** grows ~300% in 2023.  
- **Jazz** grows ~266.67% in 2025.  
- Certain genres (e.g. Blues, Electronica/Dance, Reggae) show strong declines in some years.

**Insights**

- Rock is a **long-term, reliable growth genre**.
- Genres such as Pop, Bossa Nova, and Jazz experience **sharp growth spikes**, indicating emerging or seasonal trends.
- Other genres display highly volatile or consistently negative growth, suggesting limited or unstable demand.

**Actions**

- Treat **Rock** as the backbone genre:
  - Maintain strong catalog coverage and consistent marketing.
  - Use Rock to stabilize overall revenue.

- For **fast-growing genres** (Pop, Bossa Nova, Jazz):
  - Launch **experimental campaigns** and expand catalog to test if growth can be sustained.
  - Monitor performance closely to decide whether to scale up investment.

- For **declining or volatile genres**:
  - Reduce marketing and acquisition budgets.
  - Maintain only core titles and evaluate annually whether they still justify their catalog space.

---

## 7. Overall Strategic Recommendations

Based on all analyses above, the following high-level actions are recommended:

1. **Double down on core drivers**  
   Focus content, promotion, and partnerships on Rock, Latin, Metal, and top artists like Iron Maiden, U2, and Metallica.

2. **Optimize catalog and marketing mix**  
   Reduce investment in consistently low-performing genres and reallocating resources to high-revenue and high-growth areas.

3. **Leverage high-value customers and markets**  
   Implement loyalty and personalization for top customers; concentrate growth efforts on key markets such as the USA, Canada, and Brazil.

4. **Experiment with emerging trends**  
   Use small, controlled campaigns to test growth potential in genres with sudden spikes (Pop, Bossa Nova, Jazz, Comedy).

5. **Use data continuously**  
   Repeat this analysis periodically (e.g., quarterly or annually) to track changes in genre popularity, artist performance, and market trends.

---

This insight report is based entirely on SQL queries executed against the Chinook database, using joins, aggregations, and window functions to translate raw sales data into actionable business recommendations.
