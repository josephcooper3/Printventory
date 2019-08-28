# Printventory
Inventory management software for selling art prints.

The app has been built with Ruby, Sinatra, PostgreSQL, HTML and CSS to meet the following brief:

Build an app which allows a shopkeeper to track their shop's inventory. This is not an app which the customer will see, it is an admin/management app for the shop workers.

* The inventory should track individual products, including a name, description, stock quantity, buying cost, and selling price.
* The inventory should track manufacturers, including a name and any other appropriate details.
* The shop can sell anything you like, but you should be able to create, edit and delete manufacturers and products separately.
  * This might mean that it makes more sense for a car shop to track makes and models of cars. Or a bookstore might sell books by author, or by publisher, and not by manufacturer. You are free to name classes and tables as appropriate to your project.
* Show an inventory page, listing all the details for all the products in stock in a single view.
* As well as showing stock quantity as a number, the app should visually highlight "low stock" and "out of stock" items to the user.

In addition to this, it has a filter functionality to view all the prints in the inventory by a given artist.

To run the software, first clone the repository and create a PostgreSQL database called 'printventory'. You will also need to install Ruby, and the Sinatra and PG gems. Then run the following command in the root directory to set up the database:
```
psql -d printventory -f db/printventory.sql
```

To start the app, run the following command:
```
ruby app.rb
```
Then navigate to localhost/4567 in your browser (Chrome is recommended).

To load a selection of sample data, run the seeds script:
```
ruby db/seeds.rb
```

All included images for samples are Public Domain from the Yale Centre for British Art: https://britishart.yale.edu/collections/search
