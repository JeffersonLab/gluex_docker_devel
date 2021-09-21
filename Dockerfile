#
# Dockerfile - docker build script for a standard GlueX sim-recon 
#              container image based on centos 7.
#
# original author: richard.t.jones at uconn.edu
# author: marki at jlab.org
# version: September 21, 2021
#
# usage: [as root] $ docker build Dockerfile .
#

FROM centos:centos7.7.1908

ENV GXI_VERSION=2.26
ADD https://github.com/JeffersonLab/gluex_install/archive/${GXI_VERSION}.tar.gz /
RUN tar zxvf ${GXI_VERSION}.tar.gz
RUN gluex_install-${GXI_VERSION}/gluex_prereqs_centos_7.sh
RUN mkdir /cvmfs
RUN ln -s cvmfs/oasis.opensciencegrid.org/gluex/group /group
RUN mkdir /u
RUN ln -s ../group /u/group
# make the cvmfs filesystem visible inside the container
VOLUME /cvmfs/oasis.opensciencegrid.org
