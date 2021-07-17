#
# Dockerfile - docker build script for a standard GlueX sim-recon 
#              container image based on centos 7.
#
# original author: richard.t.jones at uconn.edu
# author: marki at jlab.org
# version: July 16, 2021
#
# usage: [as root] $ docker build Dockerfile .
#

FROM centos:centos7.7.1908

ADD https://github.com/JeffersonLab/gluex_install/archive/2.20.tar.gz /
RUN tar zxvf 2.20.tar.gz
RUN gluex_install-2.20/gluex_prereqs_centos_7.sh
RUN mkdir /cvmfs
RUN ln -s cvmfs/oasis.opensciencegrid.org/gluex/group /group
RUN mkdir /u
RUN ln -s cvmfs/oasis.opensciencegrid.org/gluex/group /u/group
# make the cvmfs filesystem visible inside the container
VOLUME /cvmfs/oasis.opensciencegrid.org
