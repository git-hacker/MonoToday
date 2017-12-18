# Mono Today

### Database config
Copy 一份 database.yml 配置文件，并修改配置中的 password 字段为你的数据库密码。
如果你的数据库没有设置密码，那就让它空着吧。
```Shell
cp config/database.example.yml config/database.yml
```

Setup Database，注意：执行下面这个任务之前，需要在你的系统中安装并启动 mysql 服务。
至于怎么启动 mysql 服务，这里就不再赘述。自己 Google 一下就搞定啦。
```Shell
rake db:setup
```

### Start server
```Shell
rails s
```
