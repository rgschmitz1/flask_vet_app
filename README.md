# Setup
Code was tested using Python 3.10.4 using Windows 10 and Ubuntu 20.04

Create a .env file containing the following info
```
FLASK_ENV=development
SECRET_KEY=<insert_key>
POSTGRES_HOST=<hostname>
POSTGRES_PORT=5432
POSTGRES_DB=postgres
POSTGRES_PASS=<password>
POSTGRES_USER=postgres
```

Create a virtual environment and install required packages using the following commands
```
python -m venv venv
```

If using Windows the below command will activate the python virtual environment
```
venv\Scripts\activate
```

If using Linux or Mac the below command will activate the python virtual environment
```
source venv/bin/activate
```

Install the application packages
```
pip install -r requirements.txt
```

## Database setup
Amazon RDS PostgreSQL was used for storage. Setup details can be found here, https://aws.amazon.com/premiumsupport/knowledge-center/free-tier-rds-launch/

***NOTE:*** inbound rule allowing port 5432 for all ipv4 traffic must be specifically set for the security group attached to the database

Install postgresql-client-13 or pgadmin in Windows
```
sudo sh -c 'echo "deb [arch=amd64] http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt update && sudo apt install -y postgresql-client-13
```

Import `setup.sql` using the following command from Linux. Replace `<endpoint>` with the database endpoint from the created database.
```
psql --host=<endpoint> --port=5432 --username=postgres --password --dbname=postgres --file=setup.sql
```

# Running App
To start the application use the following command
```
python app.py
```

When the flask app starts, navigate to the page using a browser, http://localhost:5000
