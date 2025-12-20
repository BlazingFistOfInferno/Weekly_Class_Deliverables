resource "aws_s3_object" "index" {
  bucket = aws_s3_bucket.website.bucket
  key    = "index.html"
  source = "./lab-example/index.html"
  content_type = "text/html"

  etag = filemd5("./lab-example/index.html")
}

resource "aws_s3_object" "error" {
  bucket = aws_s3_bucket.website.bucket
  key    = "error.html"
  source = "./lab-example/error.html"
  content_type = "text/html"

  etag = filemd5("./lab-example/error.html")
}


variable "images_dir" {
  description = "The path to the local images directory"
  default     = "./lab-example"
}

# resource "aws_s3_bucket" "example_bucket" {
#   bucket = aws_s3_bucket.website.bucket
# }

resource "aws_s3_object" "images_upload" {
  for_each = fileset(var.images_dir, "**")

  bucket = aws_s3_bucket.website.bucket
  key    = each.key # The relative path within the directory (e.g., "pic1.png" or "subdir/pic2.png")
  source = "${var.images_dir}/${each.key}"
  # Using source_hash helps Terraform detect changes in the file content
  source_hash = filemd5("${var.images_dir}/${each.key}")
}