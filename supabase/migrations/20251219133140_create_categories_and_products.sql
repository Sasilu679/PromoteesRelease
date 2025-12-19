/*
  # Create Categories and Products Tables for Promotees Group Gallery

  ## Overview
  Creates the database structure for a wholesale clothing gallery with categories and products.

  ## New Tables
  
  ### `categories`
  - `id` (uuid, primary key) - Unique identifier for each category
  - `name` (text) - Display name of the category (e.g., "Caps", "Camo Shirts")
  - `slug` (text, unique) - URL-friendly version of the name
  - `description` (text) - Brief description of the category
  - `icon_name` (text) - Lucide icon name for the category
  - `order_index` (integer) - For sorting categories in display order
  - `created_at` (timestamptz) - Timestamp of creation
  
  ### `products`
  - `id` (uuid, primary key) - Unique identifier for each product
  - `category_id` (uuid, foreign key) - References categories table
  - `name` (text) - Product name/title
  - `image_url` (text) - URL to product image
  - `description` (text) - Product description
  - `order_index` (integer) - For sorting products within category
  - `created_at` (timestamptz) - Timestamp of creation

  ## Security
  - Enable RLS on both tables
  - Allow public read access (this is a showcase website)
  - Only authenticated users can insert/update/delete (for admin purposes)
*/

-- Create categories table
CREATE TABLE IF NOT EXISTS categories (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  name text NOT NULL,
  slug text UNIQUE NOT NULL,
  description text DEFAULT '',
  icon_name text DEFAULT 'package',
  order_index integer DEFAULT 0,
  created_at timestamptz DEFAULT now()
);

-- Create products table
CREATE TABLE IF NOT EXISTS products (
  id uuid PRIMARY KEY DEFAULT gen_random_uuid(),
  category_id uuid REFERENCES categories(id) ON DELETE CASCADE NOT NULL,
  name text NOT NULL,
  image_url text NOT NULL,
  description text DEFAULT '',
  order_index integer DEFAULT 0,
  created_at timestamptz DEFAULT now()
);

-- Enable RLS
ALTER TABLE categories ENABLE ROW LEVEL SECURITY;
ALTER TABLE products ENABLE ROW LEVEL SECURITY;

-- Public read access for categories
CREATE POLICY "Anyone can view categories"
  ON categories FOR SELECT
  TO anon
  USING (true);

-- Public read access for products
CREATE POLICY "Anyone can view products"
  ON products FOR SELECT
  TO anon
  USING (true);

-- Authenticated users can manage categories
CREATE POLICY "Authenticated users can insert categories"
  ON categories FOR INSERT
  TO authenticated
  WITH CHECK (true);

CREATE POLICY "Authenticated users can update categories"
  ON categories FOR UPDATE
  TO authenticated
  USING (true)
  WITH CHECK (true);

CREATE POLICY "Authenticated users can delete categories"
  ON categories FOR DELETE
  TO authenticated
  USING (true);

-- Authenticated users can manage products
CREATE POLICY "Authenticated users can insert products"
  ON products FOR INSERT
  TO authenticated
  WITH CHECK (true);

CREATE POLICY "Authenticated users can update products"
  ON products FOR UPDATE
  TO authenticated
  USING (true)
  WITH CHECK (true);

CREATE POLICY "Authenticated users can delete products"
  ON products FOR DELETE
  TO authenticated
  USING (true);

-- Create indexes for better performance
CREATE INDEX IF NOT EXISTS idx_categories_slug ON categories(slug);
CREATE INDEX IF NOT EXISTS idx_categories_order ON categories(order_index);
CREATE INDEX IF NOT EXISTS idx_products_category ON products(category_id);
CREATE INDEX IF NOT EXISTS idx_products_order ON products(category_id, order_index);

-- Insert initial 50 categories
INSERT INTO categories (name, slug, description, icon_name, order_index) VALUES
  ('T-Shirts', 't-shirts', 'Classic promotional t-shirts', 'shirt', 1),
  ('Polo Shirts', 'polo-shirts', 'Professional polo shirts', 'badge', 2),
  ('Hoodies', 'hoodies', 'Comfortable hoodies and sweatshirts', 'wind', 3),
  ('Caps', 'caps', 'Baseball caps and hats', 'candy', 4),
  ('Camo Shirts', 'camo-shirts', 'Camouflage pattern shirts', 'trees', 5),
  ('Tank Tops', 'tank-tops', 'Sleeveless tank tops', 'sun', 6),
  ('Long Sleeve Shirts', 'long-sleeve-shirts', 'Long sleeve t-shirts', 'ruler', 7),
  ('Button-Up Shirts', 'button-up-shirts', 'Casual button-up shirts', 'square', 8),
  ('Jackets', 'jackets', 'Lightweight jackets', 'cloud', 9),
  ('Sweatshirts', 'sweatshirts', 'Crew neck sweatshirts', 'waves', 10),
  ('Athletic Wear', 'athletic-wear', 'Performance athletic apparel', 'activity', 11),
  ('Work Shirts', 'work-shirts', 'Durable work shirts', 'briefcase', 12),
  ('Safety Vests', 'safety-vests', 'High-visibility safety vests', 'shield', 13),
  ('Aprons', 'aprons', 'Work and kitchen aprons', 'utensils', 14),
  ('Uniforms', 'uniforms', 'Professional uniforms', 'users', 15),
  ('Youth Apparel', 'youth-apparel', 'Kids and youth clothing', 'smile', 16),
  ('Ladies Shirts', 'ladies-shirts', 'Women''s t-shirts', 'heart', 17),
  ('Ladies Polos', 'ladies-polos', 'Women''s polo shirts', 'flower', 18),
  ('V-Neck Shirts', 'v-neck-shirts', 'V-neck style shirts', 'triangle', 19),
  ('Henley Shirts', 'henley-shirts', 'Henley style shirts', 'circle', 20),
  ('Raglan Shirts', 'raglan-shirts', 'Baseball raglan shirts', 'aperture', 21),
  ('Pocket Tees', 'pocket-tees', 'T-shirts with pockets', 'inbox', 22),
  ('Performance Shirts', 'performance-shirts', 'Moisture-wicking performance wear', 'zap', 23),
  ('Fleece Jackets', 'fleece-jackets', 'Warm fleece jackets', 'snowflake', 24),
  ('Windbreakers', 'windbreakers', 'Lightweight windbreakers', 'wind', 25),
  ('Varsity Jackets', 'varsity-jackets', 'Classic varsity jackets', 'award', 26),
  ('Denim Shirts', 'denim-shirts', 'Denim and chambray shirts', 'box', 27),
  ('Flannel Shirts', 'flannel-shirts', 'Plaid flannel shirts', 'grid', 28),
  ('Hawaiian Shirts', 'hawaiian-shirts', 'Tropical print shirts', 'palmtree', 29),
  ('Compression Wear', 'compression-wear', 'Compression athletic wear', 'move', 30),
  ('Thermal Shirts', 'thermal-shirts', 'Thermal base layer shirts', 'flame', 31),
  ('Tie-Dye Shirts', 'tie-dye-shirts', 'Tie-dye pattern shirts', 'droplet', 32),
  ('Embroidered Shirts', 'embroidered-shirts', 'Custom embroidered apparel', 'pen-tool', 33),
  ('Screen Printed', 'screen-printed', 'Screen printed designs', 'printer', 34),
  ('Logo Shirts', 'logo-shirts', 'Custom logo apparel', 'tag', 35),
  ('Armor Tees', 'armor-tees', 'Heavy-duty armor style tees', 'shield-check', 36),
  ('Ringer Tees', 'ringer-tees', 'Classic ringer t-shirts', 'disc', 37),
  ('Muscle Shirts', 'muscle-shirts', 'Sleeveless muscle shirts', 'dumbbell', 38),
  ('Golf Shirts', 'golf-shirts', 'Golf polo shirts', 'flag', 39),
  ('Fishing Shirts', 'fishing-shirts', 'Performance fishing shirts', 'anchor', 40),
  ('Hunting Apparel', 'hunting-apparel', 'Hunting and outdoor wear', 'crosshair', 41),
  ('Beanies', 'beanies', 'Knit beanies and winter hats', 'candy-cane', 42),
  ('Visors', 'visors', 'Sun visors', 'sun-medium', 43),
  ('Bucket Hats', 'bucket-hats', 'Casual bucket hats', 'umbrella', 44),
  ('Trucker Hats', 'trucker-hats', 'Mesh trucker hats', 'truck', 45),
  ('Bags & Totes', 'bags-totes', 'Promotional bags and totes', 'shopping-bag', 46),
  ('Backpacks', 'backpacks', 'Branded backpacks', 'backpack', 47),
  ('Towels', 'towels', 'Promotional towels', 'waves', 48),
  ('Blankets', 'blankets', 'Custom blankets', 'layout', 49),
  ('Accessories', 'accessories', 'Other promotional accessories', 'sparkles', 50)
ON CONFLICT (slug) DO NOTHING;