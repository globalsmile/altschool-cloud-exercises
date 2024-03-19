# provision.tf

provider "aws" {
  region = "us-west-2" # Choose your region
}

resource "aws_instance" "sock_server" {
  ami           = "ami-0d7a109bf30624c99" # Choose your AMI
  instance_type = "t2.micro"
  key_name      = "sock-server-key" # Change to your key name
  security_groups = ["sock-server-group"] # Change to your security group name

  tags = {
    Name = "sock-server-instance"
  }
}

# User data script to install required software
resource "aws_instance" "sock_server" {
  # other resource attributes

  user_data = <<-EOF
              #!/bin/bash
              # Update system
              sudo apt update -y
              sudo apt upgrade -y
              
              # Install Kubernetes
              sudo apt-get update && sudo apt-get install -y apt-transport-https curl
              curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
              echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
              sudo apt update
              sudo apt-get install -y kubelet kubeadm kubectl
              sudo apt-mark hold kubelet kubeadm kubectl
              
              # Install Ansible
              sudo apt install -y ansible

              # Install Jenkins
              wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
              sudo sh -c 'echo deb https://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
              sudo apt update
              sudo apt install -y openjdk-11-jdk jenkins

              # Start Jenkins service
              sudo systemctl start jenkins
              sudo systemctl enable jenkins
              
              # Install Prometheus
              wget https://github.com/prometheus/prometheus/releases/download/v2.30.3/prometheus-2.30.3.linux-amd64.tar.gz
              tar -xzf prometheus-2.30.3.linux-amd64.tar.gz
              sudo mv prometheus-2.30.3.linux-amd64 /opt/prometheus
              
              # Install Alertmanager
              wget https://github.com/prometheus/alertmanager/releases/download/v0.24.0/alertmanager-0.24.0.linux-amd64.tar.gz
              tar -xzf alertmanager-0.24.0.linux-amd64.tar.gz
              sudo mv alertmanager-0.24.0.linux-amd64 /opt/alertmanager
              
              # Install Certbot for Let's Encrypt
              sudo apt install -y certbot
              sudo certbot certonly --standalone -d yourdomain.com # Change to your domain
              EOF
}

