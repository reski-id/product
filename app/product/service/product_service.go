package service

import (
	"context"
	"productApp/domain"
	"productApp/entity"
)

type ProductService struct {
	repo domain.ProductRepository
	ctx  context.Context
}

func NewProductService(repo domain.ProductRepository, ctx context.Context) *ProductService {
	return &ProductService{
		repo: repo,
		ctx:  ctx,
	}
}

func (us *ProductService) GetProduct(ctx context.Context, name, stock string, limit, offset int, orderBy string) ([]entity.Product, error) {
	return us.repo.GetProduct(ctx, name, stock, limit, offset, orderBy)
}

// CountAllProducts returns the total number of users
func (us *ProductService) CountAllProduct(ctx context.Context) (int, error) {
	return us.repo.CountAllProduct(ctx)
}

func (us *ProductService) CountFilteredProduct(ctx context.Context, name, stock string) (int, error) {
	return us.repo.CountFilteredProduct(ctx, name, stock)
}
