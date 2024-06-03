package domain

import (
	"context"
	"productApp/entity"
)

type ProductRepository interface {
	GetProduct(ctx context.Context, name, stock string, limit, offset int, orderBy string) ([]entity.Product, error)
	CountAllProduct(ctx context.Context) (int, error)
	CountFilteredProduct(ctx context.Context, name, stock string) (int, error)
}

type ProductService interface {
	GetProduct(ctx context.Context, name, stock string, limit, offset int, orderBy string) ([]entity.Product, error)
	CountAllProduct(ctx context.Context) (int, error)
	CountFilteredProduct(ctx context.Context, name, stock string) (int, error)
}
