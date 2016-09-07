#!/bin/bash

source 001-environment.sh

cd /var/www/drupal7/sites/all/modules
git clone https://github.com/Islandora/islandora.git
git clone https://github.com/Islandora/islandora_scholar.git
git clone https://github.com/discoverygarden/google_analytics_reports.git
git clone https://github.com/discoverygarden/islandora_ga_reports.git
git clone https://github.com/Islandora/islandora_solr_search.git
git clone https://github.com/Islandora/islandora_solr_views.git
git clone https://github.com/Islandora/islandora_solution_pack_collection.git
git clone https://github.com/Islandora/objective_forms.git
git clone https://github.com/Islandora/islandora_xml_forms.git
git clone https://github.com/Islandora/php_lib.git
git clone https://github.com/Islandora/islandora_importer.git
git clone https://github.com/Islandora/islandora_bookmark.git
git clone https://github.com/Islandora/islandora_oai.git
git clone https://github.com/Islandora/islandora_solution_pack_audio.git
git clone https://github.com/Islandora/islandora_solution_pack_book.git
git clone https://github.com/Islandora/islandora_solution_pack_image.git
git clone https://github.com/Islandora/islandora_solution_pack_large_image.git
git clone https://github.com/Islandora/islandora_solution_pack_pdf.git
git clone https://github.com/Islandora/islandora_solution_pack_video.git
git clone https://github.com/Islandora/islandora_paged_content.git
git clone https://github.com/Islandora/islandora_internet_archive_bookreader.git
git clone https://github.com/Islandora/islandora_ocr.git
git clone https://github.com/Islandora/islandora_openseadragon.git
git clone https://github.com/Islandora/islandora_jwplayer.git
git clone https://github.com/Islandora/islandora_fits.git
git clone https://github.com/Islandora/islandora_simple_workflow.git
git clone https://github.com/Islandora/islandora_book_batch.git
git clone https://github.com/Islandora/islandora_batch.git
git clone https://github.com/Islandora/islandora_ip_embargo.git
git clone https://github.com/Islandora/islandora_solution_pack_compound.git
git clone https://github.com/Islandora/islandora_solution_pack_newspaper.git
git clone https://github.com/Islandora/islandora_xacml_editor.git
git clone https://github.com/Islandora/islandora_marcxml.git
git clone https://github.com/discoverygarden/islandora_featured_collection.git
git clone https://github.com/Islandora/islandora_solr_metadata.git
git clone https://github.com/discoverygarden/solrmetadataconfigs.git
git clone https://github.com/discoverygarden/islandora_solution_pack_document.git
git clone https://github.com/discoverygarden/islandora_jodconverter.git
git clone https://github.com/discoverygarden/islandora_plupload.git
git clone https://github.com/discoverygarden/islandora_solution_pack_entities.git
git clone https://github.com/Islandora-Labs/islandora_binary_object.git
git clone https://github.com/Islandora/islandora_checksum.git
git clone https://github.com/Islandora/islandora_checksum_checker.git
git clone https://github.com/Islandora/islandora_premis.git
git clone https://github.com/Islandora/islandora_bagit.git

 /usr/bin/pear install Archive_Tar
