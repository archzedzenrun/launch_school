SELECT item, menu_price - ingredient_cost AS profit FROM menu_items
  ORDER BY profit DESC LIMIT 1;