CREATE TABLE IF NOT EXISTS roles (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

-- Users table
CREATE TABLE IF NOT EXISTS users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    created_at DATETIME(6),
    updated_at DATETIME(6),
    address VARCHAR(200),
    date_of_birth DATE,
    email VARCHAR(150) UNIQUE NOT NULL,
    facebook_account_id INT,
    fullname VARCHAR(100) NOT NULL,
    google_account_id INT,
    is_active INT DEFAULT 1,
    password VARCHAR(100),
    phone_number VARCHAR(25),
    role_id BIGINT,
    FOREIGN KEY (role_id) REFERENCES roles(id)
);

-- Categories table
CREATE TABLE IF NOT EXISTS categories (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(350) NOT NULL
);

-- Products table
CREATE TABLE IF NOT EXISTS products (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    created_at DATETIME(6),
    updated_at DATETIME(6),
    description VARCHAR(255),
    is_active INT DEFAULT 1,
    name VARCHAR(350) NOT NULL,
    price FLOAT NOT NULL,
    thumbnail VARCHAR(350),
    category_id BIGINT,
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

-- Coupons table
CREATE TABLE IF NOT EXISTS coupons (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    active INT DEFAULT 1,
    code VARCHAR(25) UNIQUE NOT NULL
);

-- COUPON CONDITIONS table
CREATE TABLE IF NOT EXISTS coupon_conditions (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    attribute VARCHAR(255),
    operator VARCHAR(255),
    value VARCHAR(255),
    discount_amount DECIMAL(38,10),
    coupon_id BIGINT,
    FOREIGN KEY (coupon_id) REFERENCES coupons(id)
);

-- Orders table
CREATE TABLE IF NOT EXISTS orders (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    created_at DATETIME(6),
    updated_at DATETIME(6),
    email VARCHAR(100) NOT NULL,
    fullname VARCHAR(100) NOT NULL,
    is_active INT DEFAULT 1,
    note VARCHAR(150),
    order_date DATETIME(6) NOT NULL,
    status VARCHAR(255) NOT NULL,
    payment_method VARCHAR(100),
    phone_number VARCHAR(20) NOT NULL,
    shipping_address VARCHAR(100) NOT NULL,
    shipping_date DATETIME(6),
    shipping_method VARCHAR(100),
    total_payment FLOAT NOT NULL,
    tracking_number VARCHAR(100),
    coupon_id BIGINT,
    user_id BIGINT,
    FOREIGN KEY (coupon_id) REFERENCES coupons(id),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Order details table
CREATE TABLE IF NOT EXISTS order_details (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    color VARCHAR(20),
    number_of_product INT NOT NULL,
    price FLOAT NOT NULL,
    total_payment FLOAT NOT NULL,
    coupon_id BIGINT,
    order_id BIGINT NOT NULL,
    product_id BIGINT NOT NULL,
    FOREIGN KEY (coupon_id) REFERENCES coupons(id),
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Tokens table (for authentication)
CREATE TABLE IF NOT EXISTS tokens (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    device_type VARCHAR(255),
    expiration_date DATETIME(6),
    expired INT DEFAULT 0,
    revoked INT DEFAULT 0,
    token VARCHAR(500) UNIQUE NOT NULL,
    token_type VARCHAR(50),
    user_id BIGINT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id)
);

-- Social accounts table
CREATE TABLE IF NOT EXISTS social_accounts (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(150),
    name VARCHAR(100),
    provider VARCHAR(20) NOT NULL,
    provider_id VARCHAR(50) NOT NULL
);

-- PRODUCT IMAGES table
CREATE TABLE IF NOT EXISTS product_images (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    image_url LONGBLOB,
    name VARCHAR(100),
    product_id BIGINT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- ====================== INDEXES ======================
CREATE INDEX idx_users_phone ON users(phone_number);
CREATE INDEX idx_orders_user_id ON orders(user_id);
CREATE INDEX idx_orders_status ON orders(status);
CREATE INDEX idx_products_category ON products(category_id);
CREATE INDEX idx_order_details_order ON order_details(order_id);
CREATE INDEX idx_tokens_user ON tokens(user_id);
-- ====================== SAMPLE DATA ======================
INSERT INTO roles (name) VALUES 
('ADMIN'), ('USER');


INSERT INTO categories (name) VALUES 
('Electronics'), ('Clothing'), ('Books');
