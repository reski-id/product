package response

type StandarResponses struct {
	Draw            int8  `json:"draw"`
	RecordsTotal    int64 `json:"records_total"`
	RecordsFiltered int64 `json:"records_filtered"`
}
