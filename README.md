# ad_filter2hosts

Convert various filter formats (DNS, ABP, uBlock Origin, AdBlock) to hosts list with 0.0.0.0 IP

## Overview

This tool converts domain filter lists from various formats to a unified hosts file format with 0.0.0.0 IP addresses. It supports:

- Standard hosts files
- AdBlock/uBlock style domain filters (`||domain.com^`)
- Simple domain lists
- Comment and non-domain lines are automatically filtered out

## Usage

1. Add your filter sources to `filter_list.lst`
2. Run `./ad_filter2hosts.sh`
3. The resulting hosts file will be saved as `hosts_filtered.txt`

## Automated Updates

A GitHub Actions workflow automatically updates the hosts file daily. The latest version is always available in this repository as `hosts_filtered.txt`.

- The workflow runs daily at midnight UTC
- It can also be triggered manually from the Actions tab
- Statistics about the hosts file are available in `hosts_info.md`

## Default Filter Sources

The tool comes pre-configured with these filter sources:

- Cybo1927 host list (blocks anti-adblock pop-ups)
- Energized Spark
- Common AdBlock filter lists
- Default AdAway sources

You can customize the sources by editing the `filter_list.lst` file.
