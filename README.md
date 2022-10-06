# travel

This is essentially a blog of my time traveling in South East Asia and South
America. I've written it as a Ruby on Rails API with a React front end because:

- I wanted some practice programming while traveling
- I wanted to try using GraphQL in Ruby
- I wanted a few custom features for the blog so it wasn't just text and
  pictures

## Development

This is no longer in active development. I worked on this while I was travelling
in 2018. From then on I've tried maintain it to keep the site up, but I'm not
planning on adding to it.

### Hosting and history

This is a React app. It used to be backed by a GraphQL API powered by a Ruby on
Rails server hosted on Heroku. However, Heroku stopped their free tier, so I
needed to move this somewhere. Unsurprisingly, lots of dependencies were heavily
out of date, so it was going to be tricky.

Rather than update the server, which would have taken ages, I decided to port
this to a frontend-only app. It's pretty much a static app - there's no real
need for a database given that all of the data was originally stored in yaml
files already in this repo. This is much easier to port as it can easily be
hosted on S3 behind Cloudflare and doesn't require any server that I have to
maintain.

I ported this by recording all of the GraphQL requests the frontend app could
make into a file. That file is now served with the client code and used to
prewarm the Apollo cache. The frontend app therefore didn't need to change much.
It continues to make GraphQL requests, but the Apollo client can handle them all
without any network requests.

The old Rails server (and full copy of the frontend app) is in `rails/`. The
currently-maintained frontend-only app is in `static/`. I would remove the Rails
app, but I don't intend to make more changes here unless something else goes
wrong with this app, in which case it might be useful to have quick access to
the old app.
