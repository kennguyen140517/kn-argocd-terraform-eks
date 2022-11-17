resource "aws_iam_role" "kn_argocd_lab_eks_iam_role" {
  name = "kn-argocd-lab-eks-iam-role"
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