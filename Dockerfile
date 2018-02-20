#
# Dockerfile - docker build script for a standard GlueX sim-recon 
#              container image based on centos 7.
#
# author: richard.t.jones at uconn.edu
# version: june 7, 2017
#
# usage: [as root] $ docker build Dockerfile .
#

FROM centos:latest

# install the hdpm package builder
ADD https://halldweb.jlab.org/dist/gluex_install.tar /
RUN tar xf gluex_install.tar
RUN find gluex_install-* -type f -exec mv -v {} . \;
RUN ./gluex_prereqs_centos.sh
RUN yum -y install which sqlite-devel

# make the cvmfs filesystem visible inside the container
VOLUME /cvmfs/oasis.opensciencegrid.org
