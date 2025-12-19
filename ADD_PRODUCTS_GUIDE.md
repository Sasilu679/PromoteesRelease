# How to Add Products to Promotees Group Gallery

## Overview
This guide explains how to add products to your wholesale clothing gallery. Each category can hold up to 100 products.

## Method 1: Using Supabase SQL Editor

1. Go to your Supabase project dashboard
2. Navigate to the SQL Editor
3. Run the following SQL to add products:

```sql
-- Example: Add products to the "T-Shirts" category
INSERT INTO products (category_id, name, image_url, description, order_index)
SELECT
  c.id,
  'Classic Cotton T-Shirt',
  'https://images.pexels.com/photos/1020585/pexels-photo-1020585.jpeg?auto=compress&cs=tinysrgb&w=800',
  'Premium 100% cotton t-shirt, perfect for custom printing',
  1
FROM categories c
WHERE c.slug = 't-shirts';
```

## Method 2: Using Supabase Table Editor

1. Go to your Supabase project dashboard
2. Navigate to the Table Editor
3. Select the `products` table
4. Click "Insert row"
5. Fill in the fields:
   - **category_id**: Select from the categories dropdown
   - **name**: Product name
   - **image_url**: Full URL to the product image
   - **description**: Product description
   - **order_index**: Number for sorting (1, 2, 3, etc.)

## Image Sources

For high-quality stock photos, use these free resources:

- **Pexels**: https://www.pexels.com/search/clothing/
- **Unsplash**: https://unsplash.com/s/photos/apparel
- **Pixabay**: https://pixabay.com/images/search/clothing/

## Bulk Add Example

To add multiple products at once, use SQL:

```sql
-- Add multiple t-shirt products
INSERT INTO products (category_id, name, image_url, description, order_index)
SELECT
  c.id,
  product_name,
  product_url,
  product_desc,
  product_order
FROM categories c
CROSS JOIN (
  VALUES
    ('Classic White Tee', 'https://images.pexels.com/photos/1020585/pexels-photo-1020585.jpeg', 'Premium white cotton t-shirt', 1),
    ('Navy Blue Tee', 'https://images.pexels.com/photos/1050244/pexels-photo-1050244.jpeg', 'Classic navy blue t-shirt', 2),
    ('Black Performance Tee', 'https://images.pexels.com/photos/2220316/pexels-photo-2220316.jpeg', 'Moisture-wicking performance shirt', 3),
    ('Gray V-Neck', 'https://images.pexels.com/photos/2220315/pexels-photo-2220315.jpeg', 'Comfortable gray v-neck tee', 4),
    ('Red Crew Neck', 'https://images.pexels.com/photos/1656684/pexels-photo-1656684.jpeg', 'Bold red crew neck shirt', 5)
) AS products(product_name, product_url, product_desc, product_order)
WHERE c.slug = 't-shirts';
```

## Tips

1. **Image Quality**: Use high-resolution images (at least 800x800px)
2. **Image URLs**: Use direct links to images (ending in .jpg, .png, etc.)
3. **Consistent Naming**: Use clear, descriptive product names
4. **Order Index**: Use incremental numbers to control display order
5. **Descriptions**: Keep descriptions concise but informative

## Example Categories

Your gallery includes these 50 categories:

- T-Shirts, Polo Shirts, Hoodies, Caps, Camo Shirts
- Tank Tops, Long Sleeve Shirts, Button-Up Shirts, Jackets, Sweatshirts
- Athletic Wear, Work Shirts, Safety Vests, Aprons, Uniforms
- Youth Apparel, Ladies Shirts, Ladies Polos, V-Neck Shirts, Henley Shirts
- Raglan Shirts, Pocket Tees, Performance Shirts, Fleece Jackets, Windbreakers
- Varsity Jackets, Denim Shirts, Flannel Shirts, Hawaiian Shirts, Compression Wear
- Thermal Shirts, Tie-Dye Shirts, Embroidered Shirts, Screen Printed, Logo Shirts
- Armor Tees, Ringer Tees, Muscle Shirts, Golf Shirts, Fishing Shirts
- Hunting Apparel, Beanies, Visors, Bucket Hats, Trucker Hats
- Bags & Totes, Backpacks, Towels, Blankets, Accessories

Each category is ready to receive products!
