## Project Setup

1. Clone the project repository from GitHub using the following command:
```bash
git clone https://github.com/ipssi-mia-group11/commandes-back.git
```
2. Navigate to the project directory:
```bash
cd commandes-back
```
3. Install the project dependencies by running the following command:
```bash
npm install
```
4. Duplicate the `.env` file and rename it as `.env.local`. You can do this by running the following command:
```bash
cp .env .env.local
```
5. Configure the `.env.local` file with your specific environment variables, such as database credentials and other configuration values.
6. Import the MySQL database dump file `datacommande.sql` into your MySQL database. You can use database management tools like phpMyAdmin or the MySQL command line to import the dump file.


## Starting the Server

To start the server, you can run the following command:
```bash
npm start
```
This will start the server and make it accessible at the specified port (usually port 3000) on your local machine.
Once the server is running, you can make API requests to interact with the project’s RESTful endpoints.