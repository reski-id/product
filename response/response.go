package response

import (
	"net/http"

	"github.com/gin-gonic/gin"
)

func Success(c *gin.Context, data interface{}) {
	c.JSON(http.StatusOK, data)
}

func Error(c *gin.Context, statusCode int, internalCode int, message string) {
	c.JSON(statusCode, gin.H{
		"internalcode": internalCode,
		"status":       "error",
		"message":      message,
	})
}

func Created(c *gin.Context, message string) {
	c.JSON(http.StatusCreated, gin.H{
		"status":  "success",
		"message": message,
	})
}

func BadRequest(c *gin.Context, message string) {
	c.JSON(http.StatusBadRequest, gin.H{
		"status":  "error",
		"message": message,
	})
}

func NotFound(c *gin.Context, message string) {
	c.JSON(http.StatusNotFound, gin.H{
		"status":  "error",
		"message": message,
	})
}

func InternalServerError(c *gin.Context, message string) {
	c.JSON(http.StatusInternalServerError, gin.H{
		"status":  "error",
		"message": message,
	})
}
