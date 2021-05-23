# README

This is a Simple Blog Application

# Prerequisites

```
Github
Ruby 2.5.1
Rails 6.0.3
```

1. Check out the repository
```
git clone git@github.com:classicboy/simple_app.git
```

2. How to run in development enviroment
```
- To run bundle `bundle install`
- To create table`bundle exec rake db:create`
- To setup the database and generate sample data `bundle exec rake db:setup`
- Start server `rails s`
- Open browser and access: `localhost:3000`
```

3. Functions
```
- Guest can view published posts
- User can Signup/Login/Logout( Using Devise )
- After login, regular_user can view their posts and others published posts
- Regular user can only edit their posts and publish non-published posts
- Admin can view all posts
- Admin can edit their posts and publish non-published posts. Admin only can edit other's posts im Admin Page
- Admin can access to Admin Page. In here Admin can manage Users and Posts
- Admin can edit regular-user's posts but can't publish it
```

4. Test account

Admin
```
- Email: 'admin@gmail.com'
- Password: '111111111'
```

Regular User
```
- Email: 'user@gmail.com'
- Password: '999999999'
```
