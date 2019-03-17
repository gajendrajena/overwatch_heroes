# Overwatch Heroes
A list of overwatch heroes

## Technologies
- Frontend
`React` (16.8.4), `Twitter Bootstrap (4.3.1)`

- Backend
`Ruby on Rails` ( Ruby:` 2.6.0`, Rails: `6.0.0.2.beta2` )

## Pre requisite
1. Ruby - `2.6.0` ( Choose `rvm` or `rbenv` )

2. Postgresql - `10.7`
`brew install postgresql`
`brew services start postgresql`

## Setup

**1. Clone the repository**
```
git clone git@github.com:gajendrajena/overwatch_heroes.git
```

**2. Install Dependencies**
```
cd overwatch_heroes
bundle install
```

**3. Create Database**

```
rake db:create
```

**4. Setup seed data**

```
rake db:setup
```

**5. Run server**

```
rails s
```

**6. To run testcases**

```
rails test
```


## Deployment

Platform - `Heroku`

This application is currently deployed at https://overwatchheros.herokuapp.com/


## Credits

Gajendra Jena