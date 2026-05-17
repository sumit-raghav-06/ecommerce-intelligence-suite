# 📊 Business Insights — Olist E-Commerce Analysis

> Derived from SQL-based analysis of the Olist Brazilian E-Commerce dataset using Python + SQLite.

---

## 💼 1. Business Overview (KPIs)

| Metric | Value |
|---|---|
| Total Revenue | ~$13.6M+ |
| Total Orders | 99,441 |
| Average Order Value | ~$141 |

Revenue, order volume, and AOV together frame the platform's scale and customer spending baseline. The $141 AOV is a critical anchor for all downstream pricing and promotional strategy.

---

## 🛒 2. Product & Category Performance

### Revenue Leaders
- **Health & Beauty (`beleza_saude`)** is the #1 revenue generator at **$1.44M+**
- **Watches & Gifts (`relogios_presentes`)** ranks high in revenue despite lower order volume — meaning it has a high Average Order Value (AOV)

### Volume vs. Value Split
- **Bed/Bath/Table (`cama_mesa_banho`)** has the highest order count (9,417+) but ranks 3rd in revenue, indicating lower price points
- Categories with fewer but more expensive orders (Watches, Electronics) are more profitable per transaction

### Premium Segments
- **PCs (Computers)** average **$1,098/unit** — nearly 8× the platform average
- **Small Appliances** and **Agro Industry** average $340–$620
- These high-ticket segments benefit most from installment payment incentives

### Anchor Products
- A single **Furniture & Decor** item tops individual product orders with **527 units sold**
- **Garden Tools** has 4 products in the top 10 most ordered list — showing strong repeat demand in this niche

### 💡 Recommendation
- Use high-margin categories (Watches, Electronics) for profitability campaigns
- Use high-volume categories (Bed/Bath, Health & Beauty) for customer acquisition and retention
- Introduce installment plans for PC and Small Appliance categories to reduce purchase friction

---

## 🌍 3. Geographic Distribution

### City Level
| Rank | City | Orders |
|---|---|---|
| 1 | São Paulo | ~15,540 |
| 2 | Rio de Janeiro | ~7,000+ |
| 3 | Belo Horizonte | ~2,800+ |

São Paulo alone has more orders than the next 4 cities combined.

### State Level
| Rank | State | Revenue |
|---|---|---|
| 1 | SP (São Paulo) | $5.92M |
| 2 | RJ (Rio de Janeiro) | ~$2.1M |
| 3 | MG (Minas Gerais) | ~$1.9M |

The top 3 states (SP, RJ, MG) together generate **over $9.9M** — the platform's financial backbone.

### 💡 Recommendation
- Concentrate **warehousing and logistics** in São Paulo to minimize cost for the highest-density region
- Establish regional **distribution hubs in BA (Bahia) and SC (Santa Catarina)** to reduce freight friction and expand market share beyond the Southeast

---

## 💳 4. Payment Behavior

| Payment Method | Orders | Avg Order Value |
|---|---|---|
| Credit Card | ~76,795 (~74%) | $163.32 |
| Boleto | ~19,784 (~19%) | $145.03 |
| Debit Card | — | $142.57 |
| Voucher | — | $65.70 |

- Credit cards and Boleto together account for **~93% of all transactions**
- The **average installment count is 2.85**, meaning customers frequently spread costs over 3 months
- Vouchers are used for small or discounted transactions only

### 💡 Recommendation
- Incentivize credit card use on high-ticket categories through targeted promotions
- Increase the maximum number of **interest-free installments** to boost AOV for premium items
- Design Boleto-specific promotions to retain Brazil's cash-preference segment

---

## 🚚 5. Delivery & Operational Performance

| Metric | Value |
|---|---|
| Average Delivery Time | 12.56 days |
| Delayed Orders | ~7,827 (7.8%) |
| Early Deliveries | ~88,649 (89%) |

### What This Means
- The platform consistently **under-promises and over-delivers** — 89% of orders arrive before the estimated date
- The 7.8% delay rate, while relatively low, represents **~7,827 high-risk customers** who are likely to churn or leave negative reviews
- 12.56 days is the current expectation baseline; any "Fast Delivery" offering should aim to cut this significantly

### 💡 Recommendation
- Investigate delay patterns by state and carrier to identify bottlenecks
- Create a "Fast Delivery" tier (5–7 days) for SP, RJ, and MG to differentiate from competitors
- Proactively notify customers when delays are detected to mitigate churn risk

---

## 🎯 6. RFM Customer Segmentation

| Segment | Customer Count | Priority |
|---|---|---|
| Needs Attention | 39,984 | 🔴 High |
| At Risk | 23,843 | 🔴 Urgent |
| Potential Loyal | 11,782 | 🟡 Medium |
| Loyal | 6,078 | 🟢 Retain |
| Champion | 5,982 | 🟢 VIP |
| New Customer | 5,688 | 🟡 Onboard |

**67% of the customer base (63,827 customers) are either "At Risk" or "Needs Attention."**

> This is a **retention crisis**, not an acquisition problem. Olist doesn't need more new customers — it needs to win back the ones it already lost.

### 💡 Recommended Actions by Segment

| Segment | Action |
|---|---|
| **Champion** | VIP perks, early product access, referral rewards |
| **Loyal** | Loyalty points, exclusive discounts |
| **Potential Loyal** | Nudge toward a second/third purchase with targeted offers |
| **New Customer** | 90-day onboarding email sequence with category recommendations |
| **At Risk** | Urgent win-back campaign: personalized discount + re-engagement email |
| **Needs Attention** | Broad re-engagement campaign; A/B test messaging and offers |

---

## 📈 7. Revenue Trends

- Revenue peaked in **March–May 2018**, consistently above $1.15M/month
- **November 2017** showed a sharp spike (~$1.11M) — likely driven by **Black Friday** promotions
- December 2017 dipped to $0.86M (typical post-holiday slowdown)
- The platform successfully transitioned from seasonal spikes to a **higher, stable monthly baseline** in 2018

### 💡 Recommendation
- Plan inventory and logistics capacity around the **November Black Friday spike**
- Build a mid-year campaign (March–May window) when organic revenue is naturally strong to maximize returns
- Investigate the September 2018 data cutoff to confirm if it's a dataset artifact or actual slowdown

---

## 🔑 Top-Line Summary

| Area | Key Finding |
|---|---|
| Revenue | SP state alone = 38% of total revenue |
| Products | Health & Beauty = #1 category; PCs = highest price point |
| Payments | 74% credit card; avg 2.85 installments |
| Delivery | 89% early; 7.8% delayed |
| Customers | 67% are at-risk or disengaged |
| Seasonality | Peak in Q1 2018 and Black Friday 2017 |

> **Core strategic priority:** Shift focus from customer acquisition to **retention and re-engagement** — the data shows it will yield the highest ROI.
