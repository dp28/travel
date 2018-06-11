# travel

This is essentially a blog of my time traveling in South East Asia and South
America. I've written it as a Ruby on Rails API with a React front end becasue:

* I wanted some practice programming while traveling
* I wanted to try using GraphQL in Ruby
* I wanted a few custom features for the blog so it wasn't just text and
  pictures

## Installation

### Dependencies

| Name        | Version |
|-------------|---------|
| Ruby        | 2.4.2   |
| Rails       | 5.2     |
| bundler gem | >= 1.16 |
| Postgres    | 9.5     |
| Node.js     | 8.5.0   |
| Yarn        | >= 1.7  |

After ensuring you have all the dependencies and cloning this repo, run:

```bash
bundle install
yarn install
```

Using postgres, create a development database called `travel_development`. For
simplicity, this is currently set up to use the database user `postgres` with
the password `password`. If this is not your current setup, either create a new
user and password in postgres or edit
[./config/database.yml](./config/database.yml) to use the username and password
you used to create the development database.

To set up the schema and populate the database, run

```bash
./bin/rails db:migrate
./bin/rails db:seed
```

## Development

This uses Ruby on Rails for the API and React for the front end, built using
Webpack. Both the Rails server and Webpack frontend will automatically reload
when files are changed in development. To start them, run `./bin/rails server` in
one terminal and `./bin/webpack-dev-server` in another.

### Tests

Before running tests, follw the installtion instructions to create a new
database, this time called `travel_test`. To run the Ruby tests, use `rspec` and
`rubocop` to check for style violations. For the javascript files, use
`yarn test`.

By default, the javascript tests will rerun on changes. To get a similar
experience for Ruby, run `guard`. This will run tests on change and check for
style violations, too.

### Adding a diary entry

To add a diary entry, run `./bin/rails data:create_next_day`. This will create a
new YAML file in the `./db/data` directory, one day ahead of the last existing
day file. Some information will be copied from the previous day to make it
easier to fill in.

If you add any photos (by URL), before commiting the day, run
`./bin/rails data:update_photos`. This calculates the dimensions of the photo
and stores them so this doesn't have to be done during an import.

### Releasing

To release, you need to have the Heroku toolbelt installed and have the correct
credentials. Once you have that, you can run one of:

* `RAILS_ENV=production ./bin/rails release:api`
* `RAILS_ENV=production ./bin/rails release:frontend`
* `RAILS_ENV=production ./bin/rails release:full`

API releases are designed for changes only to Ruby files or when adding new
diary entries. Frontend releases are for releases without any diary entries or
database changes. Full releases include everything. Any release that makes
frontent changes need release notes and will precompile the frontend code
bundles and check them in so that multiple versions of the site can be displayed
simultaneously.
