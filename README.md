# Application API

## Database ##
Execute the attached script file to create the database with a single table and a stored procedure. Few data is also added in the table.

## API ##
Once the databse is created, modify the connection string in appsettings.json file to the respective connection string and execute the application.

Main page will be SwaggerUI with a single API action i.e. Get Merchants. Test with any merchant id.

### Tools and Technologies Used
* SQL as database storage
* Entity Framework for object-database mapping
* InMemory caching for cache in the system memory.

I have made this app as simple as possible so distributed caching using Redix isnt being used to avoid the overhead of installing additional tools.
