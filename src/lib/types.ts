export interface Category {
  id: string;
  name: string;
  slug: string;
  description: string;
  icon_name: string;
  order_index: number;
  created_at: string;
}

export interface Product {
  id: string;
  category_id: string;
  name: string;
  image_url: string;
  description: string;
  order_index: number;
  created_at: string;
}
