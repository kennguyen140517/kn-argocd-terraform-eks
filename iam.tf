resource "aws_iam_role" "eks_iam_role" {
  name = format("%s-eks-iam-role", local.general_prefix)
  path = "/"
  assume_role_policy = <<EOF
{
 "Version": "2012-10-17",
 "Statement": [
  {
   "Effect": "Allow",
   "Principal": {
    "Service": "eks.amazonaws.com"
   },
   "Action": "sts:AssumeRole"
  }
 ]
}
EOF

}