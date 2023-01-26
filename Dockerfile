#
# Dockerfile - docker build script for a standard GlueX sim-recon 
#              container image based on centos 7.
#
# original author: richard.t.jones at uconn.edu
# author: ppauli at glasgow
# version: January 25, 2023
#
# usage: [as root] $ docker build Dockerfile .
#

FROM centos:centos7.9.2009

ENV GXI_VERSION=master
ADD https://github.com/JeffersonLab/gluex_install/archive/${GXI_VERSION}.tar.gz /
RUN tar zxvf ${GXI_VERSION}.tar.gz
RUN mv gluex_install-${GXI_VERSION} /gluex_install
RUN /gluex_install/gluex_prereqs_centos_7.sh
RUN mkdir /cvmfs
RUN ln -s cvmfs/oasis.opensciencegrid.org/gluex/group /group
RUN mkdir /u
RUN ln -s ../group /u/group
# make the cvmfs filesystem visible inside the container
VOLUME /cvmfs/oasis.opensciencegrid.org
