<a name="readme-top"></a>

<!-- TABLE OF CONTENTS -->

# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
- [💻 Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Setup](#setup)
  - [Install](#install)
  - [Usage](#usage)
  - [Run tests](#run-tests)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [📝 License](#license)

<!-- PROJECT DESCRIPTION -->

# 📖 Origami <a name="about-project"></a>

**Origami** is a mobile web application to manage budget.

This application allows the customer to:

- Register and log in, so that the data is private to them;
- Introduce new transactions associated with a category;
- See the money spent on each category.


## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
  <summary>Client</summary>
  <ul>
    <li><a href="https://rubyonrails.org/">Ruby on Rails</a></li>
  </ul>
</details>

<details>
  <summary>Server</summary>
  <ul>
    <li><a href="https://rubygems.org/gems/devise/">Devise</a></li>
    <li><a href="https://jwt.io/">JWT</a></li>
    <li><a href="https://github.com/CanCanCommunity/cancancan">Cancancan</a></li>
    <li><a href="https://github.com/flyerhzm/bullet">Bullet</a></li>
    <li><a href="https://github.com/rspec/rspec-rails">RSpec Rails</a></li>
    <li><a href="https://github.com/thoughtbot/factory_bot">Factory Bot</a></li>
    <li><a href="https://bulma.io/">Bulma</a></li>
    <li><a href="https://fontawesome.com/">Font Awesome</a></li>
    <li><a href="https://github.com/norman/friendly_id">Friendly Id</a></li>
  </ul>
</details>

<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

<!-- Features -->

### Key Features <a name="key-features"></a>

- **Authentication**
- **Tests**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need:

[Ruby](https://www.ruby-lang.org/en/)

### Setup

Clone this repository to your desired folder:

using HTTPS:
```sh
  git clone https://github.com/ElsonOtake/Origami.git
  cd Origami
```

using an SSH key:
```sh
  git clone git@github.com:ElsonOtake/Origami.git
  cd Origami
```

using GitHub CLI:
```sh
  git clone gh repo clone ElsonOtake/Origami
  cd Origami
```

### Install

Set up Postgres credentials in .env file
```sh
POSTGRES_USERNAME=postgres_username
POSTGRES_PASSWORD=postgres_password
```

Install this project with:
```sh
  bundle install
  rails db:create db:migrate
```

### Usage

To run the project, execute the following command:

```sh
  rails server
```
Open `http://localhost:3000/` on your browser.

### Run tests

To run tests, run the following command:

```sh
  rspec
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- AUTHORS -->

## 👥 Author <a name="authors"></a>

👤 **Elson Otake**

- GitHub: [elsonotake](https://github.com/elsonotake)
- Twitter: [@elsonotake](https://twitter.com/elsonotake)
- LinkedIn: [elsonotake](https://linkedin.com/in/elsonotake)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>

- [ ] **CRUD for Categories and Transactions**
- [ ] **Transaction details page**


<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>

Give a ⭐️ if you like this project!

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>

I would like to thank:

- Original design idea by [Gregoire Vella on Behance](https://www.behance.net/gregoirevella)
- [Monkik and flaticon](https://www.flaticon.com/authors/monkik) immensely for the wonderful icons used by the app
- [Microverse](https://www.microverse.org/)
- [W3Schools](https://www.w3schools.com/)
- [Stack Overflow](https://stackoverflow.com/)
- [Render](https://dashboard.render.com/)
- [ElephantSQL](https://www.elephantsql.com/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](./MIT.md) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
