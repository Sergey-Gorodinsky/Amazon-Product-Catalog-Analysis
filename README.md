<div style="text-align: center;">
    <h1>Amazon Sales  Data Analysis</h1>
</div>

## Overview

Amazon Marketplace offers a wide range of products across multiple categories and price segments. Understanding category performance,  customer engagement and the effectiveness of pricing strategies is essential for optimizing product positioning and improving customer experience.

This analysis examines the product catalog, discount policy and pricing distribution of Amazon marketplace. The objective is to identify key trends within the marketplace, evaluate differences in performance across product categories and find opportunities for improvement.
The analysis focuses on several key business areas:

Catalog Structure - how products are distributed across general and detailed categories.
Pricing Distribution - how prices vary within and across categories, and what that reveals about market positioning
Discount Policy - how aggressively different categories are discounted, and whether discounting correlates with product quality and rating
Customer Ratings - how satisfaction and engagement differ across categories, and which products stand out as best or worst performers


## Dataset

| | |
|---|---|
| Source | `https://www.kaggle.com/datasets/karkavelrajaj/amazon-sales-dataset` |
| Size | 1465 rows × 16 columns |
---

## ERD
<p align="center">
<img width="567" height="423" alt="ERD" src="https://github.com/user-attachments/assets/132df774-7187-46ef-99f2-f30496373edc" />
</p>



<h1 align="center">Executive Summary</h1>

<p align="center">
  <img width="903" height="116" alt="key_values" src="https://github.com/user-attachments/assets/490a64b6-75ae-4c02-86dc-70026a1fc36c" />
</p>

<img width="2778" height="1314" alt="Catalog Overview (1)" src="https://github.com/user-attachments/assets/0fdab335-ce37-4088-aef5-bb46c5763dcc" />





# 1. Key Findings

<div align="center">

| Finding | Details |
|---|---|
| **97.3% of all products are in just 3 categories** | Electronics, Home & Kitchen, Computers & Accessories make up 1,299 of 1,335 products. Any pricing, quality, or other issue/pattern in the big three can be extrapolated to the other categories. |
| **~50% discount policy** | The catalog average discount is 46.41%, with a maximum of 94%. This is a systematic high-low pricing policy. The USB-C adapter listed at ₹4,990 sold for ₹294 (94% off). |
| **Discounts and ratings have a negative correlation** | Categories with the lowest discounts have the highest ratings: Office Products (11.1% discount — 4.31 average rating), Painting Materials (0% discount — 4.50 average rating). |
| **USB Cables alone are 13.7% of the entire catalog** | 183 of 1,335 products are USB Cables. Within Electronics, they are 39.5% of all products. |

</div>


<img width="2778" height="1314" alt="Subcategory Overview (1)" src="https://github.com/user-attachments/assets/42c9fee0-b594-4ddc-bd2c-3f46d4d11794" />


