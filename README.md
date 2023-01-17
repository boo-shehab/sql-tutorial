# sql-tutorial
<!-- TABLE OF CONTENTS -->

# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
- [💻 Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Setup](#setup)
  - [Usage](#usage)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [📝 License](#license)

<!-- PROJECT DESCRIPTION -->

# 📖 Vet clinic database <a name="about-project"></a>

**Vet clinic database** is a basic introduction to using a relational database to create and manage data structures. The focus is on a vet clinic, where I will create multiple tables to store information about animals, insert sample data, and query the tables to retrieve and display information.
## 🛠 Built With <a name="built-with"></a>

[Postgresql](https://www.postgresql.org/)

<!-- Features -->

### Key Features <a name="key-features"></a>

- **Get familiar with relational database**
- **Create sql queries and commands**
- **Create and manage data structures for a vet clinic**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need:

[Postgresql](https://www.postgresql.org/)

### Setup

Clone this repository to your desired folder:

```sh
  git clone git@github.com:Kweeka1/sql-tutorial.git
  cd sql-tutorial
```

### Usage

To use postgresql, you need to establish a connection to PostgreSQL local server with a user name and password.
By default, PostgreSQL comes with a built-in user called 'postgres' and a password of 'postgres'.
But it is recommended that you create a new user using this default account for security reasons. 
This will ensure that you have a separate user with different privileges and permissions that can be used to connect to the database.

1. Create a new user (optional)

```sql
  CREATE USER 'your name' WITH PASSWORD 'your password' CREATEDB;
```

- CREATEDB option will allow you to create databases.

2. Create a database with your desired name:

```sql
  CREATE DATABASE 'database name';
```

3. Create tables

Run SQL commands in schema.sql file to create necessary tables.

4. Populate tables with data

Run SQL commands in data.sql file to populate tables with data.

5. Run some queries

- Now you can run queries to grab data from those tables
- See some example queries in queries.sql.

<!-- AUTHORS -->

## 👥 Author <a name="authors"></a>

- GitHub: [ahmed abas](https://github.com/boo-shehab)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>

- [ ] **Create a web app to manipulate data stored**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>

Give a star if you like this project!

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>

I would like to thank Microverse for project inspiration.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
