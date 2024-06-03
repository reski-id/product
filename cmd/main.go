package main

import (
	"fmt"
	"productApp/infrastructures/database"
	"productApp/middleware"

	docs "productApp/docs"
	response "productApp/response"

	"github.com/gin-gonic/gin"
	"github.com/jmoiron/sqlx"
	"github.com/spf13/viper"
	swaggerfiles "github.com/swaggo/files"
	ginSwagger "github.com/swaggo/gin-swagger"
)

type App struct {
	db *sqlx.DB
}

func NewApp(db *sqlx.DB) *App {
	return &App{db: db}
}

func (app *App) Run() {
	r := gin.Default()

	docs.SwaggerInfo.BasePath = "/api/v1"
	r.GET("/swagger/*any", ginSwagger.WrapHandler(swaggerfiles.Handler))

	r.Use(middleware.CorsMiddleware())

	// Health Check
	r.GET("/health", func(c *gin.Context) {
		response.Success(c, gin.H{"message": "service is running"})
	})

	r.Run(":8080")
}

// @title           Product Service
// @version         1.0
// @description     This is a swagger documentation for Product Service.
// @BasePath        /api/v1
// @host            localhost:8080
// @schemes         http https
func main() {

	envPath := "configs/.env"
	viper.SetConfigFile(envPath)
	err := viper.ReadInConfig()
	if err != nil {
		fmt.Println("Error loading .env file:", err)
		return
	}

	db, errDb := database.GetDB()
	if errDb != nil {
		fmt.Println("Failed to connect to the database:", errDb)
		return
	}
	defer db.Close()

	app := NewApp(db)

	app.Run()
}
