resource "aws_eip" "swarm_eip" {
  count    = "${var.inst_count}"
  instance = "${element(aws_instance.nodes_server.*.id, count.index)}"
  tags     = { Name = "eip-${count.index}" }
  vpc      = true
}
