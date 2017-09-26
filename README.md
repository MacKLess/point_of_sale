# Point Of Sale

#### _Project in Ruby_

#### By Kelsey Langlois & L. Devin MacKrell

## Description

_A Point of Sale app for an antique shop built using Ruby and ActiveRecord._

## Setup/Installation Requirements

* Clone this repository at [github.com/langlk/point_of_sale](https://github.com/langlk/point_of_sale.git)
* Ensure you have Postgres installed and running ([instructions here](https://www.learnhowtoprogram.com/ruby/ruby-database-basics/installing-postgres-7fb0cff7-a0f5-4b61-a0db-8a928b9f67ef))
* Create a database ```point_of_sale_development``` by running the command ```createdb -T template0 point_of_sale_development```
* Run the command ```psql point_of_sale_development < my_database.sql``` in the project root directory
* Run the command ```ruby app.rb``` in the project root directory
* Open ```localhost:4567``` in your web browser

## Specifications

* Manager can add, view, edit, and delete products.
* Cashier can add, edit, and cancel a purchase.
* Manager can view all purchases, and see total sales over a specified time period.
* Cashier can only sell items that have not been sold to another customer.

## Support and contact details

_Please contact [kels.langlois@gmail.com](mailto:kels.langlois@gmail.com) or [ldmackrell@gmail.com](mailto:ldmackrell@gmail.com) with questions, comments, or issues._

## Technologies Used

* Ruby
* Sinatra
* Postgres
* ActiveRecord

### License

Copyright (c) 2017 **Kelsey Langlois & L. Devin MacKrell**

*This software is licensed under the MIT license.*
