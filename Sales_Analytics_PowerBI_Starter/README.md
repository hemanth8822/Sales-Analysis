# Sales Analytics Dashboard - Power BI Starter Project

## Dataset profile
- Source: Sample - Superstore.csv
- Rows: 9,994
- Order-date range: 2014-01-03 to 2017-12-30
- Revenue: $2,297,200.86
- Profit: $286,397.02
- Profit margin: 12.47%
- Distinct orders: 5,009
- Distinct customers: 793

## Files
- `Superstore_Clean.csv`: cleaned Power BI-ready source with ISO dates and text postal codes.
- `DAX_Measures.dax`: KPI, growth, ranking, and time-intelligence measures.
- `DimDate.dax`: calculated date table.
- `PowerQuery_FactSales.m`: optional Power Query import script. Update the file path first.
- `Superstore_Theme.json`: import through View > Themes > Browse for themes.
- `Top_Products.csv`, `Regional_Performance.csv`, `Monthly_Trends.csv`: QA reference outputs.

## Recommended model
Use `FactSales` as the transaction table. For a portfolio-ready star schema, create reference queries:
- `DimProduct`: Product ID, Product Name, Category, Subcategory; remove duplicates by Product ID.
- `DimCustomer`: Customer ID, Customer Name, Segment; remove duplicates by Customer ID.
- `DimGeography`: Postal Code, City, State, Country, Region; remove duplicate rows.
- `DimDate`: use the supplied DAX table.

Relationships (single direction, one-to-many):
- DimDate[Date] -> FactSales[Order Date]
- DimProduct[Product ID] -> FactSales[Product ID]
- DimCustomer[Customer ID] -> FactSales[Customer ID]
- DimGeography[Postal Code] -> FactSales[Postal Code]

Hide technical keys and numeric source columns that users should replace with measures.
Sort DimDate[Month] by DimDate[Month Number], and DimDate[Month Year] by DimDate[Month Year Sort].

## Page 1 - Executive Overview
Canvas: 16:9. Add Year, Region, Category, and Segment slicers across the top.

KPI cards:
1. Total Revenue
2. Total Profit
3. Profit Margin %
4. Revenue YoY Growth %

Visuals:
- Line and clustered column chart: Month Year; columns = Total Revenue; line = Total Profit.
- Bar chart: Region by Total Revenue, with Total Profit in tooltip.
- Bar chart: Product Name by Total Revenue; visual-level Top N = 10 using Total Revenue.
- Treemap: Category > Subcategory by Total Revenue.

## Page 2 - Product Performance
- Matrix: Category, Subcategory, Product Name with Revenue, Profit, Margin %, Units Sold, Rank.
- Scatter: Revenue vs Profit; size = Units Sold; legend = Category.
- Bar chart: Top 10 products by Revenue.
- Bar chart: Bottom 10 products by Profit.
- Slicers: Category and Subcategory.

## Page 3 - Regional Performance
- Filled map or Azure Maps: State; size/color based on Revenue and Profit.
- Bar chart: Region by Revenue and Profit.
- Matrix: Region > State > City with Revenue, Profit, Margin %, Orders.
- Tooltip page: Revenue, Profit, Orders, Average Order Value.

## Page 4 - Monthly Trends
- Line chart: Month Year by Revenue and Revenue LY.
- Line chart: Month Year by Revenue YoY Growth %.
- Area chart: Month Year by Profit.
- Small multiples: Monthly Revenue by Region.

## Formatting
- Currency: Revenue, Profit, AOV -> $#,##0 or $#,##0.00
- Percent: Margin and growth -> 0.0%
- Positive profit: green; negative profit: red.
- Keep titles short, align cards, and use consistent margins.

## Build sequence
1. Open Power BI Desktop and import `Superstore_Clean.csv` as `FactSales`.
2. Confirm data types, especially date, currency, percentage, and Postal Code as text.
3. Create the reference dimension queries and relationships listed above.
4. Create `DimDate` from `DimDate.dax`; sort its month fields and use it as the model date table when using classic time intelligence.
5. Add the measures from `DAX_Measures.dax`.
6. Import `Superstore_Theme.json`.
7. Build the four pages from the visual specifications.
8. Validate totals against the dataset profile above.
