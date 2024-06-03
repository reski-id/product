package repository

import (
	"context"
	"encoding/json"
	"fmt"
	"productApp/entity"

	"productApp/domain"

	"github.com/jmoiron/sqlx"
)

type ProductRepository struct {
	db *sqlx.DB
}

func NewProductRepository(db *sqlx.DB, ctx context.Context) domain.ProductRepository {
	return &ProductRepository{db: db}
}

func (pr *ProductRepository) GetProduct(ctx context.Context, name, stock string, limit, offset int, orderBy string) ([]entity.Product, error) {
	query := `SELECT p.id, p.title, p.description, p.category, p.price, 
            p.discount_percentage, p.rating, p.stock, p.brand, p.sku, 
            p.weight, p.warranty_information, 
            p.shipping_information, p.availability_status, 
            p.return_policy, p.minimum_order_quantity, 
            p.created_at, p.updated_at, p.barcode, p.qr_code, 
            p.images, p.thumbnail,
            JSON_ARRAYAGG(pt.tag) AS tags, 
            JSON_ARRAYAGG(pr.rating) AS rating, 
            JSON_ARRAYAGG(pr.comment) AS comment,
            JSON_ARRAYAGG(pr.date) AS date,
            JSON_ARRAYAGG(pr.reviewer_name) AS reviewer_name,
            JSON_ARRAYAGG(pr.reviewer_email) AS reviewer_email
            FROM product p
            LEFT JOIN product_tag pt ON p.id = pt.product_id
            LEFT JOIN product_review pr ON p.id = pr.product_id
            WHERE p.title LIKE ?
            GROUP BY p.id
            ORDER BY p.stock ` + orderBy + `
            LIMIT ? OFFSET ?`

	var args []interface{}
	args = append(args, "%"+name+"%")
	args = append(args, limit, offset)

	rows, err := pr.db.QueryContext(ctx, query, args...)
	if err != nil {
		fmt.Println(err.Error())
		return nil, err
	}
	defer rows.Close()

	products := make([]entity.Product, 0)
	for rows.Next() {
		var product entity.Product
		var imagesJSON, tagsJSON, ratingsJSON, commentsJSON, datesJSON, reviewerNamesJSON, reviewerEmailsJSON []byte

		err := rows.Scan(
			&product.ID, &product.Title, &product.Description, &product.Category,
			&product.Price, &product.DiscountPercentage, &product.Rating, &product.Stock,
			&product.Brand, &product.SKU, &product.Weight, &product.WarrantyInformation,
			&product.ShippingInformation, &product.AvailabilityStatus, &product.ReturnPolicy,
			&product.MinimumOrderQuantity, &product.CreatedAt, &product.UpdatedAt, &product.Barcode,
			&product.QRCode, &imagesJSON, &product.Thumbnail, &tagsJSON, &ratingsJSON, &commentsJSON,
			&datesJSON, &reviewerNamesJSON, &reviewerEmailsJSON,
		)
		if err != nil {
			fmt.Println(err.Error())
			continue
		}

		if err := json.Unmarshal(tagsJSON, &product.Tags); err != nil {
			fmt.Println("Failed to unmarshal tags:", err)
		}
		if err := json.Unmarshal(ratingsJSON, &product.Rating); err != nil {
			fmt.Println("Failed to unmarshal ratings:", err)
		}
		if err := json.Unmarshal(commentsJSON, &product.Reviews); err != nil {
			fmt.Println("Failed to unmarshal comments:", err)
		}
		if err := json.Unmarshal(datesJSON, &product.Reviews); err != nil {
			fmt.Println("Failed to unmarshal dates:", err)
		}
		if err := json.Unmarshal(reviewerNamesJSON, &product.Reviews); err != nil {
			fmt.Println("Failed to unmarshal reviewer names:", err)
		}
		if err := json.Unmarshal(reviewerEmailsJSON, &product.Reviews); err != nil {
			fmt.Println("Failed to unmarshal reviewer emails:", err)
		}

		// If you want to merge all reviews into a single slice, you can do so here
		allReviews := make([]entity.Review, 0)
		allReviews = append(allReviews, product.Reviews...)

		// Then, assign the merged slice back to the product
		product.Reviews = allReviews

		products = append(products, product)
	}

	if err := rows.Err(); err != nil {
		fmt.Println(err.Error())
		return nil, err
	}

	return products, nil
}

func (ur *ProductRepository) CountAllProduct(ctx context.Context) (int, error) {
	query := `SELECT COUNT(*) FROM product`

	var count int
	err := ur.db.GetContext(ctx, &count, query)
	if err != nil {
		return 0, err
	}

	return count, nil
}

func (ur *ProductRepository) CountFilteredProduct(ctx context.Context, name, stock string) (int, error) {
	query := `
		SELECT COUNT(p.id)
		FROM product p
		LEFT JOIN product_tag pt ON p.id = pt.product_id
		LEFT JOIN product_review pr ON p.id = pr.product_id
		WHERE p.title LIKE ?
	`

	var args []interface{}
	args = append(args, "%"+name+"%")

	if stock != "" {
		query += " AND p.stock = ?"
		args = append(args, stock)
	}

	var count int
	err := ur.db.GetContext(ctx, &count, query, args...)
	if err != nil {
		return 0, err
	}

	return count, nil
}
