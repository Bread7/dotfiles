#!/bin/bash

if ! command -v duti; then
    echo "Duti not found. Please install duti first."
    exit 1
fi

duti -s com.qoppa.PDFStudio pdf all
