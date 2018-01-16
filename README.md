# Mono Today

MonoToday 是为了帮助人们专注工作，提高工作效率的工具。

MonoToday 的模式来自于[单核工作法](https://baike.baidu.com/item/%E5%8D%95%E6%A0%B8%E5%B7%A5%E4%BD%9C%E6%B3%95/22119461?fr=aladdin)。

想要提高工作效率，走上人生巅峰，赢取白富美吗？快来试试[单核工作法](http://119.23.22.194/)吧

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
