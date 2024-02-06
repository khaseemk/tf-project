provider "aws"{
region="us-east-2"
access_key="AKIA47CRURE3TOGIKCSJ"
secret_key="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"
}

resource"aws_instance""one"{
ami="ami-0cf7b2f456cd5efd4"
instance_type="t2.medium"
key_name="ohio"
vpc_seurity_group_ids=[aws_security_group.tfsec.id]
availability_zone="us-east-2a"
user_data=<<EOF
#!/bin/bash
sudo -i
yum install httpd -y
systemctl start httpd 
chkconfig httpd on
echo"hi this is my terraform project server-1"> /var/www/html/index.html
EOF
tags{
Name="TF-project-server-01"
}
}


provider "aws"{
region="us-east-2"
access_key="AKIA47CRURE3TOGIKCSJ"
secret_key="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"
}

resource"aws_instance""two"{
ami="ami-0cf7b2f456cd5efd4"
instance_type="t2.medium"
key_name="ohio"
vpc_seurity_group_ids=[aws_security_group.tfsec.id]
availability_zone="us-east-2b"
user_data=<<EOF
#!/bin/bash
sudo -i
yum install httpd -y
systemctl start httpd
chkconfig httpd on
echo"hi this is my terraform project server-2"> /var/www/html/index.html
EOF
tags{
Name="TF-project-server-02"
}
}
