# -*- mode: ruby -*-
# vi: set ft=ruby :

# Specify Vagrant version and Vagrant API version
Vagrant.require_version ">= 1.6.0"
VAGRANTFILE_API_VERSION = "2"
ENV['VAGRANT_DEFAULT_PROVIDER'] = 'docker'

## Vagrant config.
Vagrant.configure(2) do |config|

  config.vm.hostname = "datascience-devbox"

  config.vm.synced_folder ".", "/opt/ds-devbox/"


  # Define a Spark master container
  config.vm.define "spark-master", privileged: true do |app|
    app.vm.synced_folder "/tmp/shared", "/tmp/shared"
    app.vm.provider "docker" do |d|
      d.image = "gettyimages/spark:1.6.2-hadoop-2.6"
      d.name = "spark-master"
      d.ports = ["7077:7077", "8080:8080"]
      d.expose = [7077]
      d.cmd = ["bin/spark-class", "org.apache.spark.deploy.master.Master"]
    end
  end

  # Define a Spark worker container
  config.vm.define "spark-worker", privileged: true do |app|
    app.vm.synced_folder "/tmp/shared", "/tmp/shared"
    app.vm.provider "docker" do |d|
      d.image = "gettyimages/spark:1.6.2-hadoop-2.6"
      d.name = "spark-worker"
      d.cmd = ["bin/spark-class", "org.apache.spark.deploy.worker.Worker", "spark://spark-master:7077"]
      d.link("spark-master:spark-master")
    end
  end

  config.vm.define "miniconda", primary: true, autostart: true do |app|
    app.vm.provider "docker" do |d|
      d.image = "continuumio/miniconda"
      d.cmd = ["/bin/bash", "-c","/opt/conda/bin/conda install jupyter -y --quiet && conda install -y --quiet --file /opt/ds-devbox/notebook-spec.txt && /opt/ds-devbox/provision.sh && source ~/.bashrc && /opt/conda/bin/jupyter notebook --notebook-dir=/opt/ds-devbox/notebooks --ip='*' --port=8888 --no-browser"]
      d.ports = ["8888:8888"]
      d.link("spark-master:spark-master")
#      d.volumes = ["notebooks:/opt/notebooks"]
    end

  end
end
