resource "aws_instance" "nodes_server" {
  count           = "${var.inst_count}" # create three similar EC2 instances
  tags            = { Name = "node-${count.index}" }
  ami             = "${var.inst_ami}"
  instance_type   = "${var.inst_type}"
  key_name        = "${var.aws_key_pair}"
  security_groups = ["${aws_security_group.ingress-swarm.name}"]
}
