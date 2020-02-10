# laravel_install_centos

$bash <(curl -s https://raw.githubusercontent.com/hibiking-0422/laravel_install_centos/master/laravel_install.sh)

----------------インストール後の設定-------------------
・mysqlの設定

1.初期パスワード確認
$ grep password /var/log/mysqld.log

2.パスワード変更
$ mysql_secure_installation

3.認証方法変更
mysql>　 alter user 'root'@'localhost' identified with mysql_native_password by '新しいパスワード';

4.テストデータベース作成
mysql> create database testdb;

5.　.envを編集
$ vi .env

6. migrateコマンド確認
$ php artisan migrate
