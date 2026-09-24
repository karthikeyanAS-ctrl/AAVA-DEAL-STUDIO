catalog = workspace
schema = aava_deal_studio

CREATE TABLE workspace.aava_deal_studio.dim_customer" (
"customer_id" TEXT,
  "customer_name" TEXT,
  "industry" TEXT,
  "country" TEXT,
  "segment" TEXT,
  "parent_customer_id" TEXT,
  "first_order_date" TEXT
);

CREATE TABLE "dim_product" (
"product_id" TEXT,
  "product_name" TEXT,
  "product_family" TEXT,
  "delivery_model" TEXT,
  "list_price_usd" INTEGER
);

CREATE TABLE "dim_contract" (
"contract_id" TEXT,
  "customer_id" TEXT,
  "contract_start_date" TEXT,
  "contract_end_date" TEXT,
  "contract_type" TEXT,
  "acv_usd" REAL,
  "tcv_usd" REAL,
  "auto_renew_flag" TEXT,
  "notice_period_days" INTEGER,
  "governing_law" TEXT,
  "discount_pct" REAL,
  "status" TEXT,
  "source_doc_ref" TEXT
);

CREATE TABLE "fact_invoice" (
"invoice_id" TEXT,
  "customer_id" TEXT,
  "contract_id" TEXT,
  "invoice_date" TEXT,
  "currency" TEXT,
  "fx_rate_to_usd" REAL,
  "invoice_amount_usd" REAL,
  "billing_frequency" TEXT
);

CREATE TABLE "fact_invoice_line" (
"invoice_line_id" TEXT,
  "invoice_id" TEXT,
  "product_id" TEXT,
  "quantity" INTEGER,
  "unit_price_usd" REAL,
  "discount_pct" REAL,
  "line_amount_usd" REAL,
  "revenue_type" TEXT,
  "service_period_start" TEXT,
  "service_period_end" TEXT
);

CREATE TABLE "fact_subscription_month" (
"customer_id" TEXT,
  "snapshot_month" TEXT,
  "arr_usd" REAL,
  "status" TEXT
);

CREATE TABLE "fact_collection" (
"collection_id" TEXT,
  "invoice_id" TEXT,
  "customer_id" TEXT,
  "payment_date" TEXT,
  "amount_paid_usd" REAL,
  "days_outstanding" INTEGER,
  "status" TEXT
);

CREATE TABLE "fact_support_ticket" (
"ticket_id" TEXT,
  "customer_id" TEXT,
  "opened_date" TEXT,
  "severity" TEXT,
  "category" TEXT,
  "resolution_hours" REAL,
  "csat_score" INTEGER
);

CREATE TABLE "mgmt_ebitda_adjustment" (
"adjustment_id" TEXT,
  "fiscal_year" TEXT,
  "category" TEXT,
  "amount_usd" INTEGER,
  "mgmt_rationale" TEXT,
  "source_doc_ref" TEXT
);

CREATE TABLE "mgmt_claim" (
"claim_id" TEXT,
  "claim_text" TEXT,
  "metric_key" TEXT,
  "claimed_value" REAL,
  "period" TEXT,
  "cim_page" INTEGER
);
