# Crazy Kitchen Database

This repository contains the design and implementation of a database for Crazy Kitchen, a restaurant aiming to improve its data management for reservations, inventory control, and order processing. The project focuses on creating a comprehensive database system that enhances operational efficiency and customer experience.

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Dataset](#dataset)
- [Technologies Used](#technologies-used)
- [Database Schema](#database-schema)
- [Installation](#installation)
- [Usage](#usage)
- [Contributing](#contributing)

## Overview

Crazy Kitchen seeks to streamline its operations by implementing a robust database system that manages various aspects of the restaurant, including reservations, inventory, and order processing. This project outlines the design and implementation of the database to support these functions effectively.

## Features

- **Reservation Management:** Ability to manage customer reservations, including date, time, and party size.
- **Inventory Control:** Track inventory levels, ingredient usage, and reorder thresholds.
- **Order Processing:** Manage customer orders, payment processing, and order history.
- **Reporting and Analytics:** Generate reports for sales, customer preferences, and inventory status.

## Dataset

The dataset includes various attributes relevant to the restaurant's operations, such as:

- **Customers Table:** Stores customer information (name, contact, preferences).
- **Reservations Table:** Details of customer reservations (reservation ID, date, time, party size).
- **Menu Items Table:** Information about menu items (item ID, name, description, price).
- **Orders Table:** Records of customer orders (order ID, customer ID, items ordered, total amount).
- **Inventory Table:** Tracks inventory levels of ingredients (ingredient ID, name, quantity, reorder level).

### Source

[Dataset Link](#) (provide a link if applicable)

## Technologies Used

- MySQL
- SQLAlchemy
- Python
- Pandas
- Jupyter Notebook

## Database Schema

The database schema is designed to optimize data storage and retrieval. Key components include:

- **Customers Table:** Stores customer information.
- **Reservations Table:** Records details about each reservation, linked to customers.
- **Menu Items Table:** Contains information about food and beverage offerings.
- **Orders Table:** Captures details of each customer order, linked to reservations.
- **Inventory Table:** Manages stock levels of ingredients and supplies.

## Installation

To run this project locally, follow these steps:

1. Clone the repository:
   ```bash
   git clone https://github.com/yuanditang/crazykitchen-db.git
   ```

2. Navigate to the project directory:
   ```bash
   cd crazykitchen-db
   ```

3. Install the required packages:
   ```bash
   pip install -r requirements.txt
   ```

## Usage

1. Open the Jupyter Notebook file (`crazykitchen_analysis.ipynb`).
2. Run the cells to create the database schema, populate it with sample data, and perform analyses.
3. Modify the code as needed to explore different aspects of the restaurant's operations.

## Contributing

Contributions are welcome! If you have suggestions or improvements, please open an issue or submit a pull request.

1. Fork the repository.
2. Create a new branch (`git checkout -b feature-branch`).
3. Commit your changes (`git commit -m 'Add new feature'`).
4. Push to the branch (`git push origin feature-branch`).
5. Open a pull request.
