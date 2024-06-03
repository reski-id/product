
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
    created_at DATETIME,
    updated_at DATETIME,
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
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product_review (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product_id INT,
    rating INT,
    comment TEXT,
    date DATETIME,
    reviewer_name VARCHAR(255),
    reviewer_email VARCHAR(255),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

CREATE TABLE product_tag (
    product_id INT,
    tag VARCHAR(50),
    FOREIGN KEY (product_id) REFERENCES product(id)
);

INSERT INTO product (id, title, description, category, price, discount_percentage, rating, stock, brand, sku, weight, warranty_information, shipping_information, availability_status, return_policy, minimum_order_quantity, created_at, updated_at, barcode, qr_code, images, thumbnail)
VALUES 
(1, 'Essence Mascara Lash Princess', 'The Essence Mascara Lash Princess is a popular mascara known for its volumizing and lengthening effects.', 'beauty', 9.99, 7.17, 4.94, 5, 'Essence', 'RCH45Q1A', 2, '1 month warranty', 'Ships in 1 month', 'Low Stock', '30 days return policy', 24, '2024-05-23T08:56:21.618Z', '2024-05-23T08:56:21.618Z', '9164035109868', 'https://dummyjson.com/public/qr-code.png', '["https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/1.png"]', 'https://cdn.dummyjson.com/products/images/beauty/Essence%20Mascara%20Lash%20Princess/1.png'),
(2, 'Dove Shampoo', 'Dove Shampoo provides gentle cleansing for your hair, leaving it soft and smooth.', 'beauty', 5.49, 10.00, 4.80, 15, 'Dove', 'SHD2345', 1.5, '2 months warranty', 'Ships in 3 days', 'In Stock', '30 days return policy', 1, '2024-01-15T10:00:00.000Z', '2024-01-20T10:00:00.000Z', '1234567890123', 'https://dummyjson.com/public/qr-code.png', '["https://cdn.dummyjson.com/products/images/beauty/Dove%20Shampoo/1.png"]', 'https://cdn.dummyjson.com/products/images/beauty/Dove%20Shampoo/1.png'),
(3, 'Samsung Galaxy S21', 'The latest smartphone from Samsung with cutting-edge technology and sleek design.', 'electronics', 799.99, 5.00, 4.70, 8, 'Samsung', 'SGS21BLK', 0.5, '1 year warranty', 'Ships in 5 days', 'In Stock', '60 days return policy', 1, '2024-03-10T10:00:00.000Z', '2024-03-15T10:00:00.000Z', '9876543210987', 'https://dummyjson.com/public/qr-code.png', '["https://cdn.dummyjson.com/products/images/electronics/Samsung%20Galaxy%20S21/1.png"]', 'https://cdn.dummyjson.com/products/images/electronics/Samsung%20Galaxy%20S21/1.png'),
(4, 'Nike Air Max', 'Experience the ultimate comfort and style with Nike Air Max shoes.', 'fashion', 129.99, 15.00, 4.85, 10, 'Nike', 'NAM12345', 1.2, '6 months warranty', 'Ships in 7 days', 'In Stock', '30 days return policy', 1, '2024-02-10T10:00:00.000Z', '2024-02-15T10:00:00.000Z', '5432167890123', 'https://dummyjson.com/public/qr-code.png', '["https://cdn.dummyjson.com/products/images/fashion/Nike%20Air%20Max/1.png"]', 'https://cdn.dummyjson.com/products/images/fashion/Nike%20Air%20Max/1.png'),
(5, 'Sony WH-1000XM4', 'Industry-leading noise canceling with Dual Noise Sensor technology.', 'electronics', 299.99, 20.00, 4.90, 12, 'Sony', 'WH1000XM4', 0.7, '1 year warranty', 'Ships in 2 days', 'In Stock', '60 days return policy', 1, '2024-04-10T10:00:00.000Z', '2024-04-15T10:00:00.000Z', '2345678901234', 'https://dummyjson.com/public/qr-code.png', '["https://cdn.dummyjson.com/products/images/electronics/Sony%20WH-1000XM4/1.png"]', 'https://cdn.dummyjson.com/products/images/electronics/Sony%20WH-1000XM4/1.png'),
(6, 'Adidas Ultraboost', 'Boost your run with the Adidas Ultraboost running shoes.', 'fashion', 180.00, 10.00, 4.75, 7, 'Adidas', 'ADB67890', 1.1, '6 months warranty', 'Ships in 4 days', 'In Stock', '30 days return policy', 1, '2024-05-01T10:00:00.000Z', '2024-05-05T10:00:00.000Z', '3456789012345', 'https://dummyjson.com/public/qr-code.png', '["https://cdn.dummyjson.com/products/images/fashion/Adidas%20Ultraboost/1.png"]', 'https://cdn.dummyjson.com/products/images/fashion/Adidas%20Ultraboost/1.png'),
(7, 'Apple MacBook Pro', 'The Apple MacBook Pro is a powerful and sleek laptop, perfect for professionals.', 'electronics', 1299.99, 7.00, 4.95, 5, 'Apple', 'MBP2021', 2.0, '1 year warranty', 'Ships in 3 days', 'In Stock', '60 days return policy', 1, '2024-06-01T10:00:00.000Z', '2024-06-05T10:00:00.000Z', '4567890123456', 'https://dummyjson.com/public/qr-code.png', '["https://cdn.dummyjson.com/products/images/electronics/Apple%20MacBook%20Pro/1.png"]', 'https://cdn.dummyjson.com/products/images/electronics/Apple%20MacBook%20Pro/1.png'),
(8, 'Levi’s 501 Original Jeans', 'The Levi’s 501 Original Jeans are a timeless classic, providing comfort and style.', 'fashion', 59.99, 5.00, 4.65, 20, 'Levi’s', 'LV501ORG', 0.8, '1 year warranty', 'Ships in 5 days', 'In Stock', '30 days return policy', 1, '2024-07-01T10:00:00.000Z', '2024-07-05T10:00:00.000Z', '5678901234567', 'https://dummyjson.com/public/qr-code.png', '["https://cdn.dummyjson.com/products/images/fashion/Levi’s%20501%20Original%20Jeans/1.png"]', 'https://cdn.dummyjson.com/products/images/fashion/Levi’s%20501%20Original%20Jeans/1.png'),
(9, 'Bose QuietComfort 35 II', 'Noise cancelling wireless headphones with a comfortable fit.', 'electronics', 349.99, 12.00, 4.88, 10, 'Bose', 'QC35II', 0.6, '1 year warranty', 'Ships in 2 days', 'In Stock', '60 days return policy', 1, '2024-08-01T10:00:00.000Z', '2024-08-05T10:00:00.000Z', '6789012345678', 'https://dummyjson.com/public/qr-code.png', '["https://cdn.dummyjson.com/products/images/electronics/Bose%20QuietComfort%2035%20II/1.png"]', 'https://cdn.dummyjson.com/products/images/electronics/Bose%20QuietComfort%2035%20II/1.png'),
(10, 'Lego Classic Large Creative Brick Box', 'The Lego Classic Large Creative Brick Box is perfect for kids and adults to build and create.', 'toys', 49.99, 8.00, 4.80, 15, 'Lego', 'LGCB1234', 2.5, '6 months warranty', 'Ships in 3 days', 'In Stock', '30 days return policy', 1, '2024-09-01T10:00:00.000Z', '2024-09-05T10:00:00.000Z', '7890123456789', 'https://dummyjson.com/public/qr-code.png', '["https://cdn.dummyjson.com/products/images/toys/Lego%20Classic%20Large%20Creative%20Brick%20Box/1.png"]', 'https://cdn.dummyjson.com/products/images/toys/Lego%20Classic%20Large%20Creative%20Brick%20Box/1.png');

INSERT INTO product_dimension (product_id, width, height, depth) VALUES 
(1, 2.5, 3.5, 1.0),
(2, 4.0, 8.0, 2.0),
(3, 2.7, 6.5, 0.3),
(4, 10.0, 14.0, 5.0),
(5, 7.5, 9.0, 3.0),
(6, 10.0, 15.0, 4.0),
(7, 30.0, 20.0, 2.0),
(8, 12.0, 5.0, 1.0),
(9, 6.0, 8.0, 2.5),
(10, 25.0, 30.0, 10.0);


INSERT INTO product_review (product_id, rating, comment, date, reviewer_name, reviewer_email) VALUES 
(1, 5, 'Absolutely love this mascara!', '2024-05-23 08:56:21', 'Alice Smith', 'alice.smith@example.com'),
(1, 4, 'Good, but could be better.', '2024-05-24 09:30:00', 'Bob Brown', 'bob.brown@example.com'),
(2, 3, 'It’s okay, nothing special.', '2024-02-10 11:00:00', 'Charlie Davis', 'charlie.davis@example.com'),
(2, 2, 'Not impressed.', '2024-02-12 12:00:00', 'Dana Evans', 'dana.evans@example.com'),
(3, 5, 'The best phone I have ever used!', '2024-03-11 13:00:00', 'Eve Foster', 'eve.foster@example.com'),
(4, 5, 'Super comfortable and stylish.', '2024-02-16 14:00:00', 'Frank Green', 'frank.green@example.com'),
(5, 4, 'Great headphones, but a bit pricey.', '2024-04-12 15:00:00', 'Grace Hill', 'grace.hill@example.com'),
(6, 5, 'Perfect for running.', '2024-05-02 16:00:00', 'Harry Jones', 'harry.jones@example.com'),
(7, 5, 'Excellent performance and design.', '2024-06-02 17:00:00', 'Ivy King', 'ivy.king@example.com'),
(8, 4, 'Good jeans, but could be cheaper.', '2024-07-02 18:00:00', 'Jack Lee', 'jack.lee@example.com'),
(9, 5, 'Amazing noise cancellation!', '2024-08-02 19:00:00', 'Kelly Moore', 'kelly.moore@example.com'),
(10, 5, 'Fun and engaging for kids and adults.', '2024-09-02 20:00:00', 'Liam Nelson', 'liam.nelson@example.com');


INSERT INTO product_tag (product_id, tag) VALUES 
(1, 'mascara'),
(1, 'beauty'),
(2, 'shampoo'),
(2, 'beauty'),
(3, 'smartphone'),
(3, 'electronics'),
(4, 'shoes'),
(4, 'fashion'),
(5, 'headphones'),
(5, 'electronics'),
(6, 'shoes'),
(6, 'fashion'),
(7, 'laptop'),
(7, 'electronics'),
(8, 'jeans'),
(8, 'fashion'),
(9, 'headphones'),
(9, 'electronics'),
(10, 'toys'),
(10, 'building blocks');
