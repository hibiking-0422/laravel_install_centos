# laravel_install_centos

$bash <(curl -s https://raw.githubusercontent.com/hibiking-0422/laravel_install_centos/master/laravel_install.sh)

----------------インストール後の設定-------------------

----laravelコマンド-----

- pj作成
$ composer create-project laravel/laravel laravel

- サーバ立ち上げ
$ php artisan serve --host 0.0.0.0

- マイグレーション
$ php artisan migrate

- 環境設定
$ cp .env.example .env
$ php artisan key:generate
$ php artisan config:clear


-プロジェクト作成
$composer create-project --prefer-dist laravel/laravel [PJ名]

-----mysqlの設定-----

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

-----auth & vue の設定-----  
$composer require laravel/ui  
$php artisan ui vue --auth  
$sudo npm install  
$sudo npm run dev  

