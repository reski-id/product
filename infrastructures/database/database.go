package database

import (
	"database/sql"
	"fmt"

	_ "github.com/go-sql-driver/mysql"
	"github.com/jmoiron/sqlx"
	"github.com/spf13/viper"
)

var db *sqlx.DB

func init() {
	viper.SetConfigFile(".env")
	viper.ReadInConfig()
}

func connectMySQL() (*sql.DB, error) {
	host := viper.GetString("DB_HOST")
	port := viper.GetString("DB_PORT")
	user := viper.GetString("DB_USER")
	pass := viper.GetString("DB_PASS")
	dbName := viper.GetString("DB_NAME")

	fmt.Println(host, port, dbName, user, pass)

	connectionString := fmt.Sprintf("%s:%s@tcp(%s:%s)/%s?parseTime=true", user, pass, host, port, dbName)

	db, err := sql.Open("mysql", connectionString)
	if err != nil {
		return nil, err
	}

	err = db.Ping()
	if err != nil {
		return nil, err
	}

	return db, nil
}

func GetDB() (*sqlx.DB, error) {
	if db == nil {
		sqlDB, err := connectMySQL()
		if err != nil {
			return nil, err
		}
		db = sqlx.NewDb(sqlDB, "mysql")
	}
	return db, nil
}
