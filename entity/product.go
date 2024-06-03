package entity

type Review struct {
	Rating        int    `json:"rating" db:"rating"`
	Comment       string `json:"comment" db:"comment"`
	Date          string `json:"date" db:"date"`
	ReviewerName  string `json:"reviewerName" db:"reviewer_name"`
	ReviewerEmail string `json:"reviewerEmail" db:"reviewer_email"`
}

type Product struct {
	ID                   int        `json:"id" db:"id"`
	Title                string     `json:"title" db:"title"`
	Description          string     `json:"description" db:"description"`
	Category             string     `json:"category" db:"category"`
	Price                float64    `json:"price" db:"price"`
	DiscountPercentage   float64    `json:"discountPercentage" db:"discount_percentage"`
	Rating               float64    `json:"rating" db:"rating"`
	Stock                int        `json:"stock" db:"stock"`
	Tags                 []string   `json:"tags" db:"tags"`
	Brand                string     `json:"brand" db:"brand"`
	SKU                  string     `json:"sku" db:"sku"`
	Weight               float64    `json:"weight" db:"weight"`
	Dimensions           Dimensions `json:"dimensions"`
	WarrantyInformation  string     `json:"warrantyInformation" db:"warranty_information"`
	ShippingInformation  string     `json:"shippingInformation" db:"shipping_information"`
	AvailabilityStatus   string     `json:"availabilityStatus" db:"availability_status"`
	Reviews              []Review   `json:"reviews"`
	ReturnPolicy         string     `json:"returnPolicy" db:"return_policy"`
	MinimumOrderQuantity int        `json:"minimumOrderQuantity" db:"minimum_order_quantity"`
	CreatedAt            string     `json:"createdAt" db:"created_at"`
	UpdatedAt            string     `json:"updatedAt" db:"updated_at"`
	Barcode              string     `json:"barcode" db:"barcode"`
	QRCode               string     `json:"qrCode" db:"qr_code"`
	Images               []string   `json:"images" db:"images"`
	Thumbnail            string     `json:"thumbnail" db:"thumbnail"`
}
type Dimensions struct {
	Width  float64 `json:"width" db:"width"`
	Height float64 `json:"height" db:"height"`
	Depth  float64 `json:"depth" db:"depth"`
}
