CREATE TABLE product (
    id INT PRIMARY KEY,
    title VARCHAR(255),
    description TEXT,
    category VARCHAR(50),
    price DECIMAL(10, 2),
    discount_percentage DECIMAL(5, 2),
    rating DECIMAL(3, 2),
    stock INT,
    brand VARCHAR(50),
    sku VARCHAR(50),
    weight DECIMAL(10, 2),
    warranty_information VARCHAR(255),
    shipping_information VARCHAR(255),
    availability_status VARCHAR(50),
    return_policy VARCHAR(255),
    minimum_order_quantity INT,
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    barcode VARCHAR(50),
    qr_code TEXT,
    images TEXT,
    thumbnail TEXT 
);

CREATE TABLE product_dimension (
    product_id INT,
    width DECIMAL(10, 2),
    height DECIMAL(10, 2),
    depth DECIMAL(10, 2),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product_review (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    rating INT,
    comment TEXT,
    date DATETIME DEFAULT CURRENT_TIMESTAMP,
    reviewer_name VARCHAR(255),
    reviewer_email VARCHAR(255),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product_tag (
    product_id INT,
    tag VARCHAR(50),
    created_at DATETIME DEFAULT CURRENT_TIMESTAMP,
    updated_at DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES product(id)
);



INSERT INTO product (
    id, title, description, category, price, discount_percentage, rating, stock, brand, sku, weight, 
    warranty_information, shipping_information, availability_status, return_policy, minimum_order_quantity, 
    created_at, updated_at, barcode, qr_code, images, thumbnail
) VALUES 
(1, 'Essence Mascara Lash Princess', 'The Essence Mascara Lash Princess is a popular mascara known for its volumizing and lengthening effects.', 'beauty', 9.99, 7.17, 4.94, 5, 'Essence', 'RCH45Q1A', 2, '1 month warranty', 'Ships in 1 month', 'Low Stock', '30 days return policy', 24, NOW(), NOW(), '9164035109868', 'https://dummyjson.com/public/qr-code.png', '["https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/1.png"]', 'https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/1.png'),
(2, 'Dove Shampoo', 'Dove Shampoo provides gentle cleansing for your hair, leaving it soft and smooth.', 'beauty', 5.49, 10.00, 4.80, 15, 'Dove', 'SHD2345', 1.5, '2 months warranty', 'Ships in 3 days', 'In Stock', '30 days return policy', 1, NOW(), NOW(), '1234567890123', 'https://dummyjson.com/public/qr-code.png', '["https://cdn.dummyjson.com/products/images/beauty/Dove%20Shampoo/1.png"]', 'https://cdn.dummyjson.com/products/images/beauty/Dove%20Shampoo/1.png'),
(3, 'Samsung Galaxy S21', 'The latest smartphone from Samsung with cutting-edge technology and sleek design.', 'electronics', 799.99, 5.00, 4.70, 8, 'Samsung', 'SGS21BLK', 0.5, '1 year warranty', 'Ships in 5 days', 'In Stock', '60 days return policy', 1, NOW(), NOW(), '9876543210987', 'https://dummyjson.com/public/qr-code.png', '["https://cdn.dummyjson.com/products/images/electronics/Samsung%20Galaxy%20S21/1.png"]', 'https://cdn.dummyjson.com/products/images/electronics/Samsung%20Galaxy%20S21/1.png'),
(4, 'Nike Air Max', 'Experience the ultimate comfort and style with Nike Air Max shoes.', 'fashion', 129.99, 15.00, 4.85, 10, 'Nike', 'NAM12345', 1.2, '6 months warranty', 'Ships in 7 days', 'In Stock', '30 days return policy', 1, NOW(), NOW(), '5432167890123', 'https://dummyjson.com/public/qr-code.png', '["https://cdn.dummyjson.com/products/images/fashion/Nike%20Air%20Max/1.png"]', 'https://cdn.dummyjson.com/products/images/fashion/Nike%20Air%20Max/1.png'),
(5, 'Sony WH-1000XM4', 'Industry-leading noise canceling with Dual Noise Sensor technology.', 'electronics', 299.99, 20.00, 4.90, 12, 'Sony', 'WH1000XM4', 0.7, '1 year warranty', 'Ships in 2 days', 'In Stock', '60 days return policy', 1, NOW(), NOW(), '2345678901234', 'https://dummyjson.com/public/qr-code.png', '["https://cdn.dummyjson.com/products/images/electronics/Sony%20WH-1000XM4/1.png"]', 'https://cdn.dummyjson.com/products/images/electronics/Sony%20WH-1000XM4/1.png'),
(6, 'Adidas Ultraboost', 'Boost your run with the Adidas Ultraboost running shoes.', 'fashion', 180.00, 10.00, 4.75, 7, 'Adidas', 'ADB67890', 1.1, '6 months warranty', 'Ships in 4 days', 'In Stock', '30 days return policy', 1, NOW(), NOW(), '3456789012345', 'https://dummyjson.com/public/qr-code.png', '["https://cdn.dummyjson.com/products/images/fashion/Adidas%20Ultraboost/1.png"]', 'https://cdn.dummyjson.com/products/images/fashion/Adidas%20Ultraboost/1.png'),
(7, 'Apple MacBook Pro', 'The Apple MacBook Pro is a powerful and sleek laptop, perfect for professionals.', 'electronics', 1299.99, 7.00, 4.95, 5, 'Apple', 'MBP2021', 2.0, '1 year warranty', 'Ships in 3 days', 'In Stock', '60 days return policy', 1, NOW(), NOW(), '4567890123456', 'https://dummyjson.com/public/qr-code.png', '["https://cdn.dummyjson.com/products/images/electronics/Apple%20MacBook%20Pro/1.png"]', 'https://cdn.dummyjson.com/products/images/electronics/Apple%20MacBook%20Pro/1.png'),
(8, 'Levi’s 501 Original Jeans', 'The Levi’s 501 Original Jeans are a timeless classic, providing comfort and style.', 'fashion', 59.99, 5.00, 4.65, 20, 'Levi’s', 'LV501ORG', 0.8, '1 year warranty', 'Ships in 5 days', 'In Stock', '30 days return policy', 1, NOW(), NOW(), '5678901234567', 'https://dummyjson.com/public/qr-code.png', '["https://cdn.dummyjson.com/products/images/fashion/Levi’s%20501%20Original%20Jeans/1.png"]', 'https://cdn.dummyjson.com/products/images/fashion/Levi’s%20501%20Original%20Jeans/1.png')



INSERT INTO product_dimension (
    product_id, width, height, depth, created_at, updated_at
) VALUES 
(1, 1.5, 12.0, 1.0, NOW(), NOW()),
(2, 5.0, 15.0, 3.0, NOW(), NOW()),
(3, 7.1, 15.2, 0.8, NOW(), NOW()),
(4, 10.5, 30.0, 15.0, NOW(), NOW()),
(5, 8.5, 22.0, 20.0, NOW(), NOW()),
(6, 9.0, 25.0, 12.0, NOW(), NOW()),
(7, 30.5, 40.0, 20.0, NOW(), NOW()),
(8, 10.0, 35.0, 15.0, NOW(), NOW());



INSERT INTO product_review (
    product_id, rating, COMMENT, DATE, reviewer_name, reviewer_email, created_at, updated_at
) VALUES 
(1, 5, 'Great mascara! Lengthens and volumizes my lashes.', NOW(), 'Alice', 'alice@example.com', NOW(), NOW()),
(2, 4, 'Good shampoo, makes my hair feel soft.', NOW(), 'Bob', 'bob@example.com', NOW(), NOW()),
(3, 5, 'Love the new features on this phone.', NOW(), 'Charlie', 'charlie@example.com', NOW(), NOW()),
(4, 4, 'Comfortable and stylish shoes.', NOW(), 'David', 'david@example.com', NOW(), NOW()),
(5, 5, 'Excellent noise canceling headphones.', NOW(), 'Eve', 'eve@example.com', NOW(), NOW()),
(6, 4, 'Great shoes for running.', NOW(), 'Frank', 'frank@example.com', NOW(), NOW()),
(7, 5, 'Powerful and sleek laptop.', NOW(), 'Grace', 'grace@example.com', NOW(), NOW()),
(8, 4, 'Comfortable and stylish jeans.', NOW(), 'Hank', 'hank@example.com', NOW(), NOW());


INSERT INTO product_tag (
    product_id, tag, created_at, updated_at
) VALUES 
(1, 'makeup', NOW(), NOW()),
(2, 'haircare', NOW(), NOW()),
(3, 'smartphone', NOW(), NOW()),
(4, 'shoes', NOW(), NOW()),
(5, 'headphones', NOW(), NOW()),
(6, 'running', NOW(), NOW()),
(7, 'laptop', NOW(), NOW()),
(8, 'jeans', NOW(), NOW());


