resource"aws_elb" "bar"{
name="khaseem-terraform-elb"
availability_zone=["us-east-2a","us-east-2b"]

listeners{
instance_port=80
instance_type="http"
lb_port=80
lb_protocol="http
}

health_check{
healthy_threshold=2
unhealthy_threshold=2
timeout=5
target= "HTTP:80/"
interval=30
}

instances =["${aws_instance.one.id}","${aws_instance.two.id}"]
cross_zone_load_balancing= true
idel_timeout=400
tags{
Name="khaseem-tf-elb"
}
}
