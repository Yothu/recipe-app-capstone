![](https://img.shields.io/badge/Microverse-blueviolet)

# RECIPE APP

> Web application that allows you to save recipes and shows the shopping list to create them!


## Built With

- Ruby
- Ruby on Rails
- Bootstrap, RSpec, PostgreSQL

## Live Demo (not available)

Check this [live demo]() of the page!

## Getting Started


To get a local copy up and running follow these simple example steps.

### Prerequisites

To use this project you first need to have installed the following:

+ Node.js
+ Ruby
+ PostgreSQL
+ Rails

* Ruby version

The version of ruby that is needed for this project is 

+ 3.1.1

### Setup

Once you have installed them, you need to use the following command to clone the repository:

```git clone https://github.com/Yothu/recipe-app-capstone.git```

### Database creation

Next, use this command to create the databases:
```rake db:create```

Use this command to run the migrations if necesessary:
```rails db:migrate```
### Install

### Usage

Finally, use the following command to initialize the live server:

```rails s```


#### My Foods page

In the **Foods page** you can add foods clicking in the *Add food* button, to create one you need to add a name, a measurement unit and a price to it.
Once it is added, you can delete it by pressing the corresponding's food *Delete* button.

#### My Recipe page

In the **Recipe page** you can add recipes clicking in the *Create Recipe* button, to create one you need to add a name, a preparation time, a cooking time, and a description to it, you can also check the *Public Recipe!* checkbox to make the recipe public.
Once it is added, you can delete it by pressing the corresponding's recipe *Delete* button.


#### Public recipes page

In the **Public recipes page** you will see all users' public recipes, you can see its name, who made it and its description.

#### Recipe details page

If you click in the name of a recipe in the *My Recipes* page or in the *Public Recipes* page you will access the **Recipe details page**, in there are all the details of a recipe, including its ingredients.
If you are the owner of a recipe you can add more ingredients, change it to public or private, and delete ingredients. And even check the shopping list of all your recipes!


### Run tests

To check the test use the following command:

```bundle exec rspec ./spec```

## Authors

👤 **David Vergaray**

- GitHub:   [@Yothu](https://github.com/Yothu)
- Twiter:   [@Daivhy](https://twitter.com/Daivhy)
- LinkedIn: [David Vergaray](https://www.linkedin.com/in/david-vergaray-almontes-051a11127/)

👤 **Anibal Amoroso**

- GitHub: [@githubhandle](https://github.com/sj1978)
- LinkedIn: [LinkedIn](https://linkedin.com/in/anibalamoroso )

## 🤝 Contributing

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

- Hat tip to anyone whose code was used
- Inspiration
- etc

## 📝 License

This project is [MIT](./MIT.md) licensed.
