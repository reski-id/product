package route

import (
	"context"
	"productApp/app/product/controller"
	"productApp/app/product/repository"
	"productApp/app/product/service"
	"time"

	"github.com/gin-gonic/gin"
	"github.com/jmoiron/sqlx"
)

func RegisterProductRoutes(r *gin.RouterGroup, db *sqlx.DB) {
	v1 := r.Group("/v1")
	{
		timeoutDuration := 10 * time.Second
		ctx, cancel := context.WithTimeout(context.Background(), timeoutDuration)
		defer cancel()

		productRepo := repository.
			NewProductRepository(db, ctx)

		productService := service.NewProductService(productRepo, ctx)

		productController := controller.NewProductController(productService)

		v1.GET("/product", productController.GetProduct)
	}
}
