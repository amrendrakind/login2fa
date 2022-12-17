![](https://img.shields.io/badge/Microverse-blueviolet)

# Test Project: login2fa

> This is a back-end API application: A database that stores data to handle the login form front-end app for 2FA implementation. 
> The API was set to be accessed only when the user has been authenticated and each of the requests is made with JWT.

## Built With

- Ruby on Rails
- PostgreSql
- Rspec

### Live Demo (if available)

Coming Soon...

## Front-end App - Login Form ##
[Login Form](https://github.com/amrendrakind/loginform_fe)

## Getting Started

To get a local copy up and running follow these simple example steps.
- Clone Repository using
`git clone https://github.com/amrendrakind/login2fa.git`
- Move into project directory
`cd login2fa`

### Setup Database 
- Make sure that your Postgres database is installed.
-  Open the file config\database.yml
- Modify the connection parameters to point your Postgres      Database:
    `username: [your_user]`
    `password: [your_password]`

- If required drop existing database : `rake db:drop`
- Create databases: `rake db:create`
- Create db structure including tables : `rake db:migrate`

### Run Tests
- Install rspec: `bundle install`
- Run all tests: `rspec`
- Run all tests and show test documentation: `rspec spec --format documentation`

### Run App
- If required (Not for testing) run `rails server`
- Visit http://localhost:3000/ in your browser!

## Author

👤 **Amrendra K**

- GitHub: [@amrendrakind](https://github.com/amrendrakind)
- Twitter: [@amrendrak_](https://twitter.com/amrendrak_)
- LinkedIn: [amrendraakumar](https://linkedin.com/in/amrendraakumar)

<p>&nbsp;<img align="center" src="https://github-readme-stats.vercel.app/api?username=amrendrakind&show_icons=true&locale=en&" alt="amrendrakind" /></p>

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/amrendrakind/login2fa/issues).

## Show your support

Give a ⭐️ if you like this project!

## 📝 License

This project is [MIT](./LICENSE) licensed.

## Acknowledgments

- Hat tip to anyone whose tips and code snippet was used
- Inspiration and support from peer group
