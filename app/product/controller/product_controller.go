package controller

import (
	"math"
	"productApp/domain"
	"productApp/response"
	"strconv"
	"strings"

	"github.com/gin-gonic/gin"
)

type ProductController struct {
	service domain.ProductService
}

func NewProductController(service domain.ProductService) *ProductController {
	return &ProductController{service: service}
}

// GetProducts godoc
// @Summary Get products
// @Description Get products based on the specified name and stock, with pagination and sorting options.
// @Tags Products
// @Param name query string false "Search product by name"
// @Param page query integer false "Page number for pagination (default 1)"
// @Param limit query integer false "Number of records per page (default 10)"
// @Param order_stock query string false "Sort products by stock in ascending (asc) or descending (desc) order"
// @Produce json
// @Success 200 {object} map[string]interface{}
// @Failure 400 {string} string "Bad Request"
// @Failure 500 {string} string "Internal Server Error"
// @Router /v1/product [get]
func (uc *ProductController) GetProduct(c *gin.Context) {
	ctx := c.Request.Context()

	name := c.DefaultQuery("name", "")
	orderStock := c.DefaultQuery("order_stock", "") // user can choose ASC or DESC
	pageStr := c.DefaultQuery("page", "1")
	limitStr := c.DefaultQuery("limit", "10")

	page, err := strconv.Atoi(pageStr)
	if err != nil || page < 1 {
		response.BadRequest(c, "Invalid page parameter")
		return
	}

	limit, err := strconv.Atoi(limitStr)
	if err != nil {
		response.BadRequest(c, "Invalid limit parameter")
		return
	}

	offset := (page - 1) * limit

	orderBy := "ASC"
	if strings.ToLower(orderStock) == "desc" {
		orderBy = "DESC"
	}

	products, err := uc.service.GetProduct(ctx, name, orderStock, limit, offset, orderBy)
	if err != nil {
		response.InternalServerError(c, "Failed to fetch products")
		return
	}

	totalProducts, err := uc.service.CountFilteredProduct(ctx, name, orderStock)
	if err != nil {
		response.InternalServerError(c, "Failed to count products")
		return
	}

	totalPages := int(math.Ceil(float64(totalProducts) / float64(limit)))

	data := map[string]interface{}{
		"data": products,
		"meta": map[string]interface{}{
			"totalPages":    totalPages,
			"totalProducts": totalProducts,
		},
	}
	response.Success(c, data)
}
