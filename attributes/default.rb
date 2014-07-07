# # # # # # #
# tartarus  #
# # # # # # #

node.default['tartarus']['config_path'] = "/etc/tartarus"
node.default['tartarus']['run_path'] = "/usr/sbin"
node.default['tartarus']['timestamps_path'] = "/var/spool/tartarus/timestamps"
node.default['tartarus']['hooks_template_cookbook'] = "tartarus"
node.default['tartarus']['apt_repository']['name'] = "wertarbyte"
node.default['tartarus']['apt_repository']['uri'] = "http://wertarbyte.de/apt ./"
node.default['tartarus']['apt_repository']['key'] = "http://wertarbyte.de/apt/software-key.gpg"

node.default['tartarus']['cron']['month'] = "*"
node.default['tartarus']['cron']['weekday'] = "*"
node.default['tartarus']['cron']['day'] = "*"
node.default['tartarus']['cron']['hour'] = "3"
node.default['tartarus']['cron']['minute'] = "45"

node.default['tartarus']['encrypt_passphrase'] = nil

node.default['tartarus']['incremental_backup'] = false
node.default['tartarus']['stay_in_filesystem'] = true
node.default['tartarus']['create_lvm_snapshot'] = false
node.default['tartarus']['lvm_volume_name'] = nil
node.default['tartarus']['snapshot_dir'] = nil
node.default['tartarus']['lvm_mount_options'] = nil
node.default['tartarus']['lvm_snapshot_size'] = "200m"
node.default['tartarus']['assembly_method'] = "tar"
node.default['tartarus']['tar_options'] = "--ignore-failed-read"
node.default['tartarus']['compression_method'] = "gzip"
node.default['tartarus']['storage_method'] = "SIMULATE"
node.default['tartarus']['storage_file_dir'] = nil
node.default['tartarus']['storage_ftp_server'] = nil
node.default['tartarus']['storage_ftp_dir'] = nil
node.default['tartarus']['storage_ftp_user'] = nil
node.default['tartarus']['storage_ftp_password'] = nil
node.default['tartarus']['storage_ftp_use_ssl'] = false
node.default['tartarus']['storage_ftp_ssl_insecure'] = false
node.default['tartarus']['storage_ftp_use_sftp'] = false
node.default['tartarus']['storage_chunk_size'] = nil
node.default['tartarus']['incremental_stacking'] = false
node.default['tartarus']['exclude'] = nil
node.default['tartarus']['exclude_files'] = nil
node.default['tartarus']['exclude_filename_patterns'] = nil
node.default['tartarus']['encrypt_symmetrically'] = false
node.default['tartarus']['encrypt_asymmetrically'] = false
node.default['tartarus']['encrypt_key_id'] = nil
node.default['tartarus']['encrypt_keyring'] = nil
node.default['tartarus']['encrypt_gpg_options'] = nil
node.default['tartarus']['limit_disk_io'] = true
node.default['tartarus']['check_for_update'] = false
node.default['tartarus']['file_list_creation'] = false
node.default['tartarus']['file_list_directory'] = nil

# activate process hooks individually, do not use blank hooks!
#
# node.default['tartarus']['pre_process_hook'] = "pre_process_hook.erb"
# node.default['tartarus']['post_process_hook'] = "post_process_hook.erb"
# node.default['tartarus']['pre_configverify_hook'] = "pre_configverify_hook.erb"
# node.default['tartarus']['post_configverify_hook'] = "post_configverify_hook.erb"
# node.default['tartarus']['pre_cleanup_hook'] = "pre_cleanup_hook.erb"
# node.default['tartarus']['post_cleanup_hook'] = "post_cleanup_hook.erb"
# node.default['tartarus']['pre_freeze_hook'] = "pre_freeze_hook.erb"
# node.default['tartarus']['post_freeze_hook'] = "post_freeze_hook.erb"
# node.default['tartarus']['pre_store_hook'] = "pre_store_hook.erb"
# node.default['tartarus']['post_store_hook'] = "post_store_hook.erb"
# node.default['tartarus']['debug_hook'] = "debug_hook.erb"
# node.default['tartarus']['pre_find_hook'] = "pre_find_hook.erb"
# node.default['tartarus']['post_find_hook'] = "post_find_hook.erb"
# node.default['tartarus']['pre_tar_hook'] = "pre_tar_hook.erb"
# node.default['tartarus']['pre_compression_hook'] = "pre_compression_hook.erb"
# node.default['tartarus']['post_compression_hook'] = "post_compression_hook.erb"
# node.default['tartarus']['pre_storage_hook'] = "pre_storage_hook.erb"
# node.default['tartarus']['post_storage_hook'] = "post_storage_hook.erb"
