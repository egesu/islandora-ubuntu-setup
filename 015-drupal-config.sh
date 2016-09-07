#!/bin/bash

source 001-environment.sh

cd /var/www/drupal7

drush en block color comment contextual dashboard dblog field field_sql_storage field_ui file filter help image list menu node number options overlay path rdf shortcut system taxonomy text toolbar user bartik seven imagemagick libraries views update ctools oauth_common oauth_common_providerui system_charts chart_views chart googleanalytics views_responsive_grid strongarm features designkit conditional_styles fe_block uuid node_export node_export_features widgets socialmedia block_class colorbox rules entity_token css_injector

drush -y colorbox-plugin

drush -y dis overlay

drush vset islandora_base_url "$ISLANDORA_BASE"

drush vset islandora_solr_url "$SOLR_BASE"

drush -y --user=1 en islandora islandora_audio islandora_basic_collection islandora_basic_image islandora_fits islandora_importer islandora_openseadragon islandora_simple_workflow islandora_video islandora_jwplayer islandora_pdf islandora_paged_content islandora_ocr islandora_internet_archive_bookreader islandora_large_image islandora_book islandora_batch islandora_book_batch xml_form_api xml_form_elements xml_schema_api objective_forms php_lib islandora_solr islandora_solr_config islandora_solr_views islandora_ga_reports islandora_scholar islandora_oai google_analytics_reports islandora_importer xml_form_builder xml_forms islandora_bibliography islandora_scholar_embargo islandora_google_scholar islandora_marcxml islandora_xacml_editor islandora_xacml_api zip_importer pmid_importer ris_importer islandora_bookmark doi_importer endnotexml_importer citation_exporter bartik seven imagemagick libraries views views_ui ctools csl citeproc oauth_common oauth_common_providerui system_charts chart_views chart googleanalytics islandora_compound_object islandora_ip_embargo islandora_newspaper views_slideshow views_slideshow_cycle islandora_featured_collection islandora_solr_metadata islandora_document islandora_jodconverter islandora_entities islandora_entities_csv_import islandora_binary_object

drush php-eval "variable_set('islandora_large_image_viewers', array('name' => array('none' => 'none', 'islandora_openseadragon' => 'islandora_openseadragon'),'default' => 'islandora_openseadragon'));"

drush php-eval "variable_set('islandora_video_viewers', array('name' => array('none' => 'none', 'islandora_jwplayer' => 'islandora_jwplayer'),'default' => 'islandora_jwplayer'));"

drush php-eval "variable_set('islandora_audio_viewers', array('name' => array('none' => 'none', 'islandora_jwplayer' => 'islandora_jwplayer'),'default' => 'islandora_jwplayer'));"

drush php-eval "variable_set('islandora_book_viewers', array('name' => array('none' => 'none', 'islandora_internet_archive_bookreader' => 'islandora_internet_archive_bookreader'), 'default' => 'islandora_internet_archive_bookreader'));"

drush php-eval "variable_set('islandora_book_page_viewers', array('name' => array('none' => 'none', 'islandora_openseadragon' => 'islandora_openseadragon'), 'default' => 'islandora_openseadragon'));"

drush php-eval "variable_set('islandora_newspaper_page_viewers', array('name' => array('none' => 'none', 'islandora_openseadragon' => 'islandora_openseadragon'),'default' => 'islandora_openseadragon'))"

drush php-eval "variable_set('islandora_newspaper_issue_viewers', array('name' => array('none' => 'none', 'islandora_internet_archive_bookreader' => 'islandora_internet_archive_bookreader'),'default' => 'islandora_internet_archive_bookreader'))"

drush vset islandora_pdf_create_fulltext "1"

drush vset islandora_pdf_path_to_pdftotext which pdftotext

drush vset islandora_metadata_display "islandora_solr_metadata"

drush vset islandora_fits_executable_path "/opt/fits/fits.sh"

drush vset islandora_book_tesseract which tesseract

drush vset islandora_ocr_tesseract which tesseract

drush vset islandora_batch_java which java

drush php-eval "variable_set('islandora_ocr_tesseract_enabled_languages', array('deu-frak' => deu-frak, 'eng' => eng, 'fra' => fra, 'ita' => ita, 'jpn' => jpn, 'por' => por, 'spa' => spa, 'dan-frak' => 0, 'deu' => 0, 'hin' => 0, 'ita_old' => 0, 'rus' => 0, 'slk-frak' => 0, 'spa_old' => 0));"

drush vset islandora_lame_url which lame

drush vset islandora_video_ffmpeg_path which ffmpeg

drush vset islandora_video_ffmpeg2theora_path which ffmpeg2theora

drush vset islandora_paged_content_gs which gs

drush vset imagemagick_convert which convert

drush vset islandora_document_create_fulltext "1"

drush vset islandora_document_path_to_pdftotext which pdftotext

drush vset site_name "Stock Islandora and Fedora"

drush vset image_toolkit "imagemagick"

drush vset error_level $ERROR_LEVEL

drush php-eval "variable_set('oai2_date_field', 'fgs_lastModifiedDate_dt')"

NOTE This should be a publicly resolvable URL or viewers will not work for people who cannot resolve the name. You also should ensure that the /etc/hosts file is pointing the name at localhost

drush vset islandora_paged_content_djatoka_url "http://hostname/adore-djatoka/"

drush vset user_register 0

drush -y updb

drush -y cc all

service $APACHE_SERVICE restart

drush cc all
