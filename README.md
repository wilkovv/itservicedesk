# README

Setup:

```bash
bundle install

# Save rake secret
rake secret
rails credentials:edit
```

In open file:

```
devise:
 jwt_secret_key: <rake secret key>
```

```bash
rails db:drop && rails db:migrate && rails db:seed
```