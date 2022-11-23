# README

migrationの代わりにridgepoleを使用

```
rails db:create
bundle exec ridgepole -c config/database.yml -E development -f db/Schemafile --apply --dry-run
bundle exec ridgepole -c config/database.yml -E development -f db/Schemafile --apply
```
