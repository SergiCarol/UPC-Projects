#!/bin/bash

ls -b --block-size=M $1 | cut -b
