ALTER TABLE `karyawan` ADD `user_id` INT(11) NOT NULL AFTER `kary_group_id`;
ALTER TABLE `karyawan` ADD UNIQUE(`nip`);