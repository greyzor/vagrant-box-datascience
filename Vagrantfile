# -*- mode: ruby -*-
# vi: set ft=ruby :

# Specify Vagrant version and Vagrant API version
Vagrant.require_version ">= 1.6.0"
VAGRANTFILE_API_VERSION = "2"
ENV['VAGRANT_DEFAULT_PROVIDER'] = 'docker'

## Vagrant config.
Vagrant.configure(2) do |config|

  config.vm.hostname = "datascience-devbox"

  config.vm.define "miniconda", primary: true, autostart: true do |a|
    a.vm.provider "docker" do |d|
      d.build_dir = "dockerfiles/"
      d.dockerfile = "miniconda.docker"
      d.cmd = ["/opt/conda/bin/jupyter", "notebook", "--notebook-dir=/opt/notebooks", "--ip='*'", "--port=8888", "--no-browser"]
      d.ports = ["8888:8888"]
    end
  end
end