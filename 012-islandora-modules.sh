#!/bin/bash

source 001-environment.sh

cd /var/www/drupal7/sites/all/modules
git clone --branch 7.x-1.8 --depth 1 https://github.com/Islandora/islandora.git
git clone --branch 7.x-1.8 --depth 1 https://github.com/Islandora/islandora_scholar.git
git clone --depth 1 https://github.com/discoverygarden/google_analytics_reports.git
git clone --depth 1 https://github.com/discoverygarden/islandora_ga_reports.git
git clone --branch 7.x-1.8 --depth 1 https://github.com/Islandora/islandora_solr_search.git
git clone --branch 7.x-1.8 --depth 1 https://github.com/Islandora/islandora_solr_views.git
git clone --branch 7.x-1.8 --depth 1 https://github.com/Islandora/islandora_solution_pack_collection.git
git clone --branch 7.x-1.8 --depth 1 https://github.com/Islandora/objective_forms.git
git clone --branch 7.x-1.8 --depth 1 https://github.com/Islandora/islandora_xml_forms.git # 7.x-1.7 has a bug, gives the error: "The following module is missing from the file system schema _api"
git clone --branch 7.x-1.8 --depth 1 https://github.com/Islandora/php_lib.git
git clone --branch 7.x-1.8 --depth 1 https://github.com/Islandora/islandora_importer.git
git clone --branch 7.x-1.8 --depth 1 https://github.com/Islandora/islandora_bookmark.git
git clone --branch 7.x-1.8 --depth 1 https://github.com/Islandora/islandora_oai.git
git clone --branch 7.x-1.8 --depth 1 https://github.com/Islandora/islandora_solution_pack_audio.git
git clone --branch 7.x-1.8 --depth 1 https://github.com/Islandora/islandora_solution_pack_book.git
git clone --branch 7.x-1.8 --depth 1 https://github.com/Islandora/islandora_solution_pack_image.git
git clone --branch 7.x-1.8 --depth 1 https://github.com/Islandora/islandora_solution_pack_large_image.git
git clone --branch 7.x-1.8 --depth 1 https://github.com/Islandora/islandora_solution_pack_pdf.git
git clone --branch 7.x-1.8 --depth 1 https://github.com/Islandora/islandora_solution_pack_video.git
git clone --branch 7.x-1.8 --depth 1 https://github.com/Islandora/islandora_paged_content.git
git clone --branch 7.x-1.8 --depth 1 https://github.com/Islandora/islandora_internet_archive_bookreader.git
git clone --branch 7.x-1.8 --depth 1 https://github.com/Islandora/islandora_ocr.git
git clone --branch 7.x-1.8 --depth 1 https://github.com/Islandora/islandora_openseadragon.git
git clone --branch 7.x-1.8 --depth 1 https://github.com/Islandora/islandora_jwplayer.git
git clone --branch 7.x-1.8 --depth 1 https://github.com/Islandora/islandora_fits.git
git clone --branch 7.x-1.8 --depth 1 https://github.com/Islandora/islandora_simple_workflow.git
git clone --branch 7.x-1.8 --depth 1 https://github.com/Islandora/islandora_book_batch.git
git clone --branch 7.x-1.8 --depth 1 https://github.com/Islandora/islandora_batch.git
git clone --branch 7.x --depth 1 https://github.com/Islandora/islandora_ip_embargo.git
git clone --branch 7.x-1.8 --depth 1 https://github.com/Islandora/islandora_solution_pack_compound.git
git clone --branch 7.x-1.8 --depth 1 https://github.com/Islandora/islandora_solution_pack_newspaper.git
git clone --branch 7.x-1.8 --depth 1 https://github.com/Islandora/islandora_xacml_editor.git
git clone --branch 7.x-1.8 --depth 1 https://github.com/Islandora/islandora_marcxml.git
git clone --branch 7.x --depth 1 https://github.com/discoverygarden/islandora_featured_collection.git
git clone --branch 7.x-1.8 --depth 1 https://github.com/Islandora/islandora_solr_metadata.git
git clone --depth 1 https://github.com/discoverygarden/solrmetadataconfigs.git
git clone --branch 7.x --depth 1 https://github.com/discoverygarden/islandora_solution_pack_document.git
git clone --branch 7.x --depth 1 https://github.com/discoverygarden/islandora_jodconverter.git
git clone --branch 7.x --depth 1 https://github.com/discoverygarden/islandora_plupload.git
git clone --branch 7.x-1.8 --depth 1 https://github.com/discoverygarden/islandora_solution_pack_entities.git
git clone --branch 7.x --depth 1 https://github.com/Islandora-Labs/islandora_binary_object.git
git clone --branch 7.x-1.8 --depth 1 https://github.com/Islandora/islandora_checksum.git
git clone --branch 7.x-1.8 --depth 1 https://github.com/Islandora/islandora_checksum_checker.git
git clone --branch 7.x-1.8 --depth 1 https://github.com/Islandora/islandora_premis.git
git clone --branch 7.x-1.8 --depth 1 https://github.com/Islandora/islandora_bagit.git

/usr/bin/pear install Archive_Tar
