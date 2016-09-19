# -*- mode: ruby -*-
# vi: set ft=ruby :

# Specify Vagrant version and Vagrant API version
Vagrant.require_version ">= 1.6.0"
VAGRANTFILE_API_VERSION = "2"
ENV['VAGRANT_DEFAULT_PROVIDER'] = 'docker'

## Vagrant config.
Vagrant.configure(2) do |config|

  config.vm.hostname = "datascience-devbox"

  config.vm.synced_folder "notebooks", "/opt/notebooks"

  config.vm.define "miniconda", primary: true, autostart: true do |app|

    app.vm.provider "docker" do |d|
      d.image = "continuumio/miniconda"
      d.cmd = ["/bin/bash", "-c","/opt/conda/bin/conda install jupyter -y --quiet && conda install -y --quiet --file notebook-spec.txt &&  mkdir -p /opt/notebooks && /opt/conda/bin/jupyter notebook --notebook-dir=/opt/notebooks --ip='*' --port=8888 --no-browser"]
      d.ports = ["8888:8888"]
    end

  end
end
