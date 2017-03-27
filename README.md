# Docker php-Redis-Admin

## Clone php redis admin
```
$ sh phpRedisAdmin.sh
```

ref: [https://github.com/erikdubbelboer/phpRedisAdmin](https://github.com/erikdubbelboer/phpRedisAdmin)

## Run
```
$ docker-compose up -d
```

## Redis cli
```
$ docker exec -it {contrainner name or id} redis-cli
127.0.0.1:6379> auth 123456
OK
```

## PHP Redis Admin
Go to `http://localhost:8080/` 

```php
'login' => array(
    // Username => Password
    // Multiple combinations can be used
    'admin' => array(
      'password' => '123456',
    ),
    'guest' => array(
      'password' => '123456',
      'servers'  => array(0) // Optional list of servers this user can access.
    )
```