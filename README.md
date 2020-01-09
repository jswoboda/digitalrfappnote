# Digital RF
The draft app-note for Digital RF


## Abstract

This application note details the open source package Digital RF. This software product contains tools to use the formats Digital RF and Digital Metadata which can be used store RF voltage data and its associated metadata. First showing 

## Format

Block-oriented format and namespace
Time → Channel → Subchannel → Samples
Indexed by number of samples from Unix epoch (Jan. 1, 1970)
Data saved within HDF5 files for long-term portability
File structure is optimized for quick API retrieval of specific RF samples
Metadata is saved along with RF
Digital metadata is saved synchronously with each RF voltage file
HDF5 format ensures long term portability and metadata retrieval
Tree structure of time-indexed data objects 

## Install Instructions

## Basic Recording and Transmitting with USRPs

## Example 2

We have another example.
