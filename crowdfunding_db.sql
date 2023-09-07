-- Contacts (users) table
CREATE TABLE contacts (
    contact_id INT PRIMARY KEY,
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL
);

-- Categories table
CREATE TABLE categories (
    category_id VARCHAR(255) PRIMARY KEY,
    category VARCHAR(255) NOT NULL
);

-- Subcategories table
CREATE TABLE subcategories (
    subcategory_id VARCHAR(255) PRIMARY KEY,
    subcategory VARCHAR(255) NOT NULL
);

-- Campaigns table
CREATE TABLE campaigns (
    cf_id INT PRIMARY KEY,
    contact_id INT REFERENCES contacts(contact_id),
    company_name VARCHAR(255) NOT NULL,
    description TEXT,
    goal DECIMAL NOT NULL,
    pledged DECIMAL NOT NULL,
    outcome VARCHAR(255) NOT NULL,
    backers_count INT NOT NULL,
    country VARCHAR(255) NOT NULL,
    currency VARCHAR(3) NOT NULL,
    launch_date DATE NOT NULL,
    end_date DATE NOT NULL,
    category_id VARCHAR(255) REFERENCES categories(category_id),
    subcategory_id VARCHAR(255) REFERENCES subcategories(subcategory_id)
);

SELECT * FROM contacts LIMIT 10;
SELECT * FROM categories LIMIT 10;
SELECT * FROM subcategories LIMIT 10;
SELECT * FROM campaigns LIMIT 10;

-- Drop the campaigns table first because it references the other tables
DROP TABLE IF EXISTS campaigns;

-- Drop subcategories and categories
DROP TABLE IF EXISTS subcategories;
DROP TABLE IF EXISTS categories;

-- Finally, drop the contacts (users) table
DROP TABLE IF EXISTS contacts;
